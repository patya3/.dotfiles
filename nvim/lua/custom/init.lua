vim.api.nvim_create_autocmd("TextYankPost", {
   command = "silent! lua vim.highlight.on_yank {higroup=(vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'), timeout=100}"
})
vim.opt_global.wrap=false
vim.opt_global.relativenumber=true
vim.opt_global.shiftwidth=2
vim.opt_global.expandtab=true
vim.opt_global.tabstop=2
vim.opt_global.softtabstop=2
vim.opt_global.smarttab=true
vim.opt_global.list = true
vim.opt.listchars:append("trail: ")
vim.api.nvim_create_autocmd('FileType', {
  pattern = "go",
  callback = function()
    vim.opt_local.shiftwidth=4
    vim.opt_local.tabstop=4
    vim.opt_local.relativenumber=true
  end
})
vim.g.floaterm_width = 0.99
vim.g.floaterm_height = 0.99
