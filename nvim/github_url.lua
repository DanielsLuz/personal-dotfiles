-- GitHub URL generator for Neovim
-- This function creates a GitHub URL for the current file and line number

local M = {}

-- Function to execute shell command and get output
local function execute_command(cmd)
  local handle = io.popen(cmd)
  local result = handle:read("*a")
  handle:close()
  return result:gsub("%s+$", "") -- trim trailing whitespace
end

-- Function to get git repository root
local function get_git_root()
  local git_root = execute_command("git rev-parse --show-toplevel 2>/dev/null")
  if git_root == "" then
    return nil
  end
  return git_root
end

-- Function to get current git branch or commit
local function get_git_ref()
  -- Try to get current branch name first
  local branch = execute_command("git symbolic-ref --short HEAD 2>/dev/null")
  if branch ~= "" then
    return branch
  end
  
  -- If not on a branch, get commit hash
  local commit = execute_command("git rev-parse --short HEAD 2>/dev/null")
  return commit
end

-- Function to parse GitHub remote URL
local function parse_github_remote()
  -- Get the remote URL (try origin first, then any remote)
  local remote_url = execute_command("git remote get-url origin 2>/dev/null")
  if remote_url == "" then
    remote_url = execute_command("git remote get-url $(git remote | head -1) 2>/dev/null")
  end
  
  if remote_url == "" then
    return nil, nil
  end
  
  -- Parse different GitHub URL formats
  local owner, repo
  
  -- SSH format: git@github.com:owner/repo.git
  owner, repo = remote_url:match("git@github%.com:([^/]+)/([^%.]+)%.git")
  if owner and repo then
    return owner, repo
  end
  
  -- HTTPS format: https://github.com/owner/repo.git
  owner, repo = remote_url:match("https://github%.com/([^/]+)/([^%.]+)%.git")
  if owner and repo then
    return owner, repo
  end
  
  -- HTTPS format without .git: https://github.com/owner/repo
  owner, repo = remote_url:match("https://github%.com/([^/]+)/([^/]+)$")
  if owner and repo then
    return owner, repo
  end
  
  return nil, nil
end

-- Function to get relative file path from git root
local function get_relative_path(git_root, file_path)
  -- Remove git root from file path to get relative path
  local relative_path = file_path:gsub("^" .. git_root .. "/", "")
  return relative_path
end

-- Main function to generate GitHub URL
function M.copy_github_url()
  -- Get current file path
  local file_path = vim.fn.expand("%:p")
  if file_path == "" then
    print("No file is currently open")
    return
  end
  
  -- Get current line number
  local line_num = vim.fn.line(".")
  
  -- Get git repository root
  local git_root = get_git_root()
  if not git_root then
    print("Not in a git repository")
    return
  end
  
  -- Check if file is within git repository
  if not file_path:find("^" .. git_root) then
    print("Current file is not within the git repository")
    return
  end
  
  -- Get relative file path
  local relative_path = get_relative_path(git_root, file_path)
  
  -- Parse GitHub remote
  local owner, repo = parse_github_remote()
  if not owner or not repo then
    print("Could not parse GitHub remote URL")
    return
  end
  
  -- Get current git reference (branch or commit)
  local git_ref = get_git_ref()
  if not git_ref then
    print("Could not determine git branch or commit")
    return
  end
  
  -- Construct GitHub URL
  local github_url = string.format("https://github.com/%s/%s/blob/%s/%s#L%d", 
                                   owner, repo, git_ref, relative_path, line_num)
  
  -- Copy to clipboard (+ register for system clipboard)
  vim.fn.setreg("+", github_url)
  
  -- Also copy to unnamed register
  vim.fn.setreg("", github_url)
  
  print("Copied to clipboard: " .. github_url)
end

-- Function to create the command
function M.setup()
  -- Create user command
  vim.api.nvim_create_user_command('GitHubUrl', M.copy_github_url, {})
  
  -- Optional: Create a key mapping (uncomment if you want)
  -- vim.keymap.set('n', '<leader>gy', M.copy_github_url, { desc = 'Copy GitHub URL' })
end

return M
