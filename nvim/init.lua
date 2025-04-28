local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)

require("mason").setup()
require("mason-lspconfig").setup()
require('go').setup()

require'lspconfig'.gopls.setup{}
-- require'lspconfig'.golangci_lint_ls.setup{}


vim.keymap.set('n', 'gd', vim.lsp.buf.definition)

vim.diagnostic.config({
  virtual_text = false
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 100
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Run gofmt + goimports on save
local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimports()
  end,
  group = format_sync_grp,
})

vim.api.nvim_create_user_command('GCI', function()
    local current_file = vim.fn.expand('%:p')
    local cmd = string.format('gci write --skip-generated -s standard -s default -s "prefix(github.com/truepay)" %s', current_file)
    
    vim.fn.system(cmd)
    -- Reload the buffer to show changes
    vim.cmd('e!')
end, {})
