-- ============================================================================
-- Neovim Configuration - Unified init.lua
-- ============================================================================

-- ============================================================================
-- BASIC SETTINGS
-- ============================================================================

-- Set vim config files path
vim.env.MYVIMCFG = vim.fn.expand('$HOME/.config/nvim/config')

-- Basic editor settings
vim.opt.incsearch = true
vim.opt.list = true
vim.opt.autoread = true
vim.cmd('syntax enable')

-- Set leader key
vim.g.mapleader = ','

-- Disable arrow keys
vim.keymap.set('n', '<Up>', '<nop>')
vim.keymap.set('n', '<Down>', '<nop>')
vim.keymap.set('n', '<Left>', '<nop>')
vim.keymap.set('n', '<Right>', '<nop>')

-- Tags and swapfile settings
vim.opt.tags = './tags;'
vim.opt.swapfile = false

-- Use ack instead of grep
vim.opt.grepprg = 'ag --path-to-ignore ~/.ignore --nogroup --nocolor'

-- Wildignores for ctrlP
vim.opt.wildignore = '*/tmp/*,*.so,*.swp,*.zip,.cabal-sandbox,.tmp'
vim.opt.wildmode = 'longest:full,full'

-- Path and suffixes
vim.opt.path = '.,src'
vim.opt.suffixesadd = '.js,.vue'

-- Editor appearance and behavior
vim.opt.showmatch = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.number = true
vim.opt.signcolumn = 'number'
vim.opt.timeout = false
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 10
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Python host programs
vim.g.python3_host_prog = '/usr/local/bin/python3'
vim.g.python2_host_prog = '/usr/local/bin/python3'

-- Add fzf to runtime path
vim.opt.runtimepath:append('~/.fzf')

--e============================================================================
-- PLUGIN MANAGEMENT (vim-plug)
-- ============================================================================

-- Auto-install vim-plug
local plug_path = vim.fn.stdpath('data') .. '/site/autoload/plug.vim'
if vim.fn.empty(vim.fn.glob(plug_path)) > 0 then
  vim.fn.system({
    'curl', '-fLo', plug_path, '--create-dirs',
    'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  })
  vim.cmd('autocmd VimEnter * PlugInstall --sync | source $MYVIMRC')
end

-- Initialize vim-plug
vim.cmd('call plug#begin("~/.config/nvim/plugged")')

-- Global utils
vim.cmd("Plug 'radenling/vim-dispatch-neovim'")
vim.cmd("Plug 'tpope/vim-dispatch'")
vim.cmd("Plug 'tomtom/tlib_vim'")
vim.cmd("Plug 'tpope/vim-repeat'")
vim.cmd("Plug 'tpope/vim-unimpaired'")

-- Linting (commented out)
-- vim.cmd("Plug 'neomake/neomake'")
-- vim.cmd("Plug 'dense-analysis/ale'")

-- Searching
vim.cmd("Plug 'mileszs/ack.vim'")

-- Colorschemes
vim.cmd("Plug 'arcticicestudio/nord-vim'")

-- Git utils
vim.cmd("Plug 'airblade/vim-gitgutter'")
vim.cmd("Plug 'tpope/vim-fugitive'")

-- Navigation
vim.cmd("Plug 'scrooloose/nerdtree'")
vim.cmd("Plug 'junegunn/fzf.vim'")

-- Better buffers
vim.cmd("Plug 'itchyny/lightline.vim'")
vim.cmd("Plug 'taohexxx/lightline-buffer'")

-- Autocompletion
vim.cmd("Plug 'github/copilot.vim'")
vim.cmd("Plug 'jiangmiao/auto-pairs'")
vim.cmd("Plug 'tomtom/tcomment_vim'")
vim.cmd("Plug 'tpope/vim-surround'")

-- Javascript plugins
vim.cmd("Plug 'pangloss/vim-javascript'")
vim.cmd("Plug 'alvan/vim-closetag'")
vim.cmd("Plug 'maxmellon/vim-jsx-pretty'")
vim.cmd("Plug 'othree/yajs.vim'")
vim.cmd("Plug 'HerringtonDarkholme/yats.vim'")

-- Go and LSP
vim.cmd("Plug 'nvim-treesitter/nvim-treesitter'")
vim.cmd("Plug 'williamboman/mason.nvim'")
vim.cmd("Plug 'williamboman/mason-lspconfig.nvim'")
vim.cmd("Plug 'neovim/nvim-lspconfig'")
vim.cmd("Plug 'ray-x/go.nvim'")
vim.cmd("Plug 'ray-x/navigator.lua'")
vim.cmd("Plug 'ray-x/guihua.lua'")
vim.cmd("Plug 'hashivim/vim-terraform'")
vim.cmd("Plug 'mfussenegger/nvim-dap'")
vim.cmd("Plug 'nvim-neotest/nvim-nio'")
vim.cmd("Plug 'rcarriga/nvim-dap-ui'")
vim.cmd("Plug 'leoluz/nvim-dap-go'")

vim.cmd('call plug#end()')

-- ============================================================================
-- APPEARANCE SETTINGS
-- ============================================================================

vim.cmd('set background=dark')
vim.cmd('colorscheme nord')

-- Background toggle mappings
vim.keymap.set('n', '<F7>', ':highlight Normal guibg=none<CR>')
vim.keymap.set('n', '<F8>', ':highlight Normal guibg=#292D3E<CR>')

-- ============================================================================
-- CUSTOM MAPPINGS
-- ============================================================================

-- Basic navigation and commands
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>q', ':wa<CR>')
vim.keymap.set('n', '<space>', '/')

-- Exit insert mode
vim.keymap.set('i', 'jj', '<esc>')
vim.keymap.set('c', 'jj', '<c-c>')
vim.keymap.set('t', 'jj', '<C-\\><C-n>')
vim.keymap.set('t', '<C-k>', '<UP>')
vim.keymap.set('t', '<C-j>', '<DOWN>')

-- Buffer navigation
vim.keymap.set('n', '<C-l>', ':bn<CR>')
vim.keymap.set('n', '<C-h>', ':bp<CR>')
vim.keymap.set('n', '<F12>', '<Esc>:syntax sync fromstart<CR>')
vim.keymap.set('i', '<F12>', '<C-o>:syntax sync fromstart<CR>')

-- Maps backspace to last buffer
vim.keymap.set('n', '<BS>', '<C-^>')

-- Search under cursor
vim.keymap.set('n', '<leader>j', ':grep! "\\b<C-R><C-W>\\b"<CR>:cw<CR>')

-- QuickFix navigation
vim.keymap.set('n', ']q', ':cnext<CR>')
vim.keymap.set('n', '[q', ':cprevious<CR>')

-- Close current buffer and move to previous
vim.keymap.set('n', '<leader>bq', ':bp <BAR> bd #<CR>')

-- BufOnly command
vim.keymap.set('n', '<leader>bo', ':BufOnly<CR>')

-- Remove trailing whitespace
vim.keymap.set('n', '<F3>', ':let _s=@/<Bar>:%s/\\s\\+$//e<Bar>:let @/=_s<Bar><CR>')

-- Rename variable
vim.keymap.set('n', '<Leader>s', ':%s/\\<<C-r><C-w>\\>//g<Left><Left>')

-- Quickfix window
vim.keymap.set('n', '<F9>', ':cclose<cr>')
vim.keymap.set('n', '<F10>', ':copen 40<cr>')

-- H and L mappings
vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'L', '$')
vim.keymap.set('v', 'H', '^')
vim.keymap.set('v', 'L', 'g_')

-- Don't yank to default register when changing
vim.keymap.set('n', 'c', '"xc')
vim.keymap.set('x', 'c', '"xc')

-- Copy file path and line number
vim.keymap.set('n', '<leader>y', ':let @+=expand("%") . ":" . line(".")<CR>')

-- After block yank and paste, move cursor to end
vim.keymap.set('v', 'y', 'y`]')
vim.keymap.set('v', 'P', '"_dP`]')
vim.keymap.set('v', 'p', '"_dP`]')
vim.keymap.set('n', 'p', 'p`]')

-- Don't cancel visual select when shifting
vim.keymap.set('x', '<', '<gv')
vim.keymap.set('x', '>', '>gv')

-- Reselect last-pasted text
vim.keymap.set('n', 'gp', '`[v`]')

-- Keep cursor in place while joining lines
vim.keymap.set('n', 'J', 'mzJ`z')

-- Alternative tag jump
vim.keymap.set('n', 'tj', ':tjump<CR>')

-- Source configuration
vim.keymap.set('n', '<F5>', ':source $MYVIMRC<CR>')

-- Toggle search highlight
vim.keymap.set('n', '<CR>', ':noh<CR>')

-- ============================================================================
-- PLUGIN SETTINGS
-- ============================================================================

-- File type detection
vim.cmd('autocmd BufRead,BufNewFile *.ts setlocal filetype=typescript')

-- Go mappings
vim.keymap.set('n', '<leader>gt', ':GoAlt!<CR>')
vim.keymap.set('n', '<leader>rf', ':GoTestFile<CR>')
vim.keymap.set('n', '<leader>rn', ':GoTest -n<CR>')

-- Gutentags exclude filetypes
vim.g.gutentags_exclude_filetypes = {'gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git'}

-- Snippet completion
vim.keymap.set('i', '<c-x><c-k>', '<c-x><c-k>')

-- Lightline configuration
vim.opt.hidden = true
vim.opt.laststatus = 2
vim.opt.showtabline = 2

vim.g.lightline = {
  tabline = {
    left = {{ 'bufferbefore', 'buffercurrent', 'bufferafter' }}
  },
  component_expand = {
    buffercurrent = 'lightline#buffer#buffercurrent',
    bufferbefore = 'lightline#buffer#bufferbefore',
    bufferafter = 'lightline#buffer#bufferafter',
  },
  component_type = {
    buffercurrent = 'tabsel',
    bufferbefore = 'raw',
    bufferafter = 'raw',
  },
  component_function = {
    bufferinfo = 'lightline#buffer#bufferinfo',
  },
  component = {
    separator = '|',
  },
}

vim.g.lightline.colorscheme = 'nord'
vim.g.lightline_buffer_fname_mod = ':t'
vim.g.lightline_buffer_excludes = {'vimfiler'}
vim.g.lightline_buffer_maxflen = 30
vim.g.lightline_buffer_maxfextlen = 3
vim.g.lightline_buffer_minflen = 16
vim.g.lightline_buffer_minfextlen = 3

-- NERDTree configuration
vim.g.NERDTreeWinSize = 30
vim.keymap.set('n', '<Leader>m', ':NERDTreeToggle<CR>')
vim.keymap.set('n', '<Leader>n', ':NERDTreeFind<CR>')

-- FZF configuration
vim.keymap.set('n', '<leader><space>', ':Files<CR>')
vim.keymap.set('n', '<leader>a', ':Buffers<CR>')
vim.keymap.set('n', '<leader>.', ':FZF -e<CR>')

vim.env.FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
vim.env.FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
vim.g.fzf_layout = { down = '40%' }

vim.g.fzf_action = {
  ['ctrl-t'] = 'tab split',
  ['ctrl-x'] = 'split',
  ['ctrl-v'] = 'vsplit'
}

-- Quickfix settings
vim.cmd([[
  au FileType qf call AdjustWindowHeight(3, 10)
  function! AdjustWindowHeight(minheight, maxheight)
    exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
  endfunction
]])

-- ============================================================================
-- NEOVIM SPECIFIC SETTINGS
-- ============================================================================

vim.opt.clipboard:append('unnamedplus')

-- Enable true colors
if vim.fn.has('termguicolors') then
  vim.opt.termguicolors = true
end

-- Custom fold text function
vim.cmd([[
  function! MyFoldText()
      let nblines = v:foldend - v:foldstart + 1
      let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
      let line = getline(v:foldstart)
      let comment = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
      let expansionString = repeat(".", w - strwidth(nblines.comment.'"'))
      let txt = comment . expansionString . nblines
      return txt
  endfunction
]])

vim.opt.foldtext = 'MyFoldText()'
vim.opt.foldmethod = 'syntax'
vim.opt.foldlevel = 3
vim.cmd('hi FOLDED guifg=white')

-- JSON formatting
vim.keymap.set('n', '<C-c><C-j>', ':call FormatJSON()<CR>')
vim.cmd([[
  function! FormatJSON()
    silent exec "%!jq '.'"
  endfunction
]])

-- ============================================================================
-- LSP AND LANGUAGE-SPECIFIC CONFIGURATION
-- ============================================================================

-- Mason for installing binaries easily
require("mason").setup()
require("mason-lspconfig").setup()

-- Go plugin setup
require('go').setup()
require('dap-go').setup()

-- GitHub URL plugin
local github_url = require('github_url')
github_url.setup()

-- GitHub URL mapping
vim.keymap.set('n', '<leader>gy', github_url.copy_github_url, { desc = 'Copy GitHub URL' })

-- Setup LSP servers
local lspconfig = require('lspconfig')

-- gopls for general Go language features (including formatting)
lspconfig.gopls.setup{}

-- golangci_lint_ls for extra linting
require('lspconfig').golangci_lint_ls.setup({
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
vim.opt.updatetime = 100
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- ============================================================================
-- FORMATTING CONFIGURATION
-- ============================================================================

-- GCI command to organize imports (grouped)
vim.api.nvim_create_user_command('GCI', function()
  local current_file = vim.fn.expand('%:p')
  local cmd = string.format('gci write --skip-generated -s standard -s default -s prefix\\(github.com/truepay\\) %s', current_file)

  vim.fn.system(cmd)
  vim.cmd('e!') -- Reload buffer
end, {})

-- Autoformat and import organize on save
local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.cmd('GCI') -- Use the GCI command instead of duplicating code
  end,
  group = format_sync_grp,
})

-- ============================================================================
-- END OF CONFIGURATION
-- ============================================================================
