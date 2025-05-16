-- Set vimrc.vim if you still need it
local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)

-- Mason for installing binaries easily
require("mason").setup()
require("mason-lspconfig").setup()

-- Go plugin setup
require('go').setup()

-- Setup LSP servers
local lspconfig = require('lspconfig')

-- gopls for general Go language features
lspconfig.gopls.setup{}


-- golangci_lint_ls for extra linting
require('lspconfig').golangci_lint_ls.setup({
  -- cmd = { "/Users/danielluz/.asdf/shims/golangci-lint-langserver" }, -- e.g., /usr/local/bin/golangci-lint-langserver
  -- init_options = {
  --   command = { "golangci-lint", "run", "--out-format", "json" }
  -- },
  settings = {
    golangci_lint_ls = {
      command = "golangci-lint",
      debounce = 1000, -- ms: wait to prevent spamming
    },
  },
})

-- Keymap for "Go to definition"
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)

-- Diagnostics config
vim.diagnostic.config({
  virtual_text = false, -- disable inline text (less noisy)
})

-- Show diagnostics automatically in hover popup
vim.o.updatetime = 100
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Variable to track whether formatting is disabled
local formatting_disabled = false

-- Toggle formatting on/off
vim.keymap.set('n', '<leader>ft', function()
  formatting_disabled = not formatting_disabled
  if formatting_disabled then
    print("Autoformatting Disabled")
  else
    print("Autoformatting Enabled")
  end
end)

-- Autoformat and import organize on save
local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    if not formatting_disabled then
      require('go.format').goimports()
    end
  end,
  group = format_sync_grp,
})
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*.go",
--   callback = function()
--     require('go.format').goimports()
--
--     -- local current_file = vim.fn.expand('%:p')
--     -- local cmd = string.format('gci write %s', current_file)
--     -- vim.fn.system(cmd)
--
--     vim.cmd('e!')
--   end,
--   group = format_sync_grp,
-- })

-- GCI command to organize imports (grouped)
vim.api.nvim_create_user_command('GCI', function()
  local current_file = vim.fn.expand('%:p')
  local cmd = string.format('gci write --skip-generated -s standard -s default -s "prefix(github.com/truepay)" %s', current_file)
  
  vim.fn.system(cmd)
  vim.cmd('e!') -- Reload buffer
end, {})

