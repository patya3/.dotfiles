
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
-- vim.g.clipboard = "unnamedplus"
-- vim.g.shell="C:\\Users\\hulye\\AppData\\Local\\Microsoft\\WindowsApps\\Microsoft.PowerShell_8wekyb3d8bbwe\\pwsh.exe"
-- vim.api.nvim_command('autocmd VimEnter * let &shellcmdflag = \'-c\'')
-- vim.api.nvim_command('autocmd VimEnter * let &shellcmdfla = \'-NoProfile\'')
vim.cmd([[
  " let &shell = 'pwsh'
  " let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
  " let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  " let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  " set shellquote= shellxquote=
  set clipboard=unnamedplus
  " if has('wsl')
  "   let g:clipboard = {
  "     \   'name': 'wslclipboard',
  "     \   'copy': {
  "     \      '+': '/usr/local/bin/win32yank.exe -i --crlf',
  "     \      '*': '/usr/local/bin/win32yank.exe -i --crlf',
  "     \    },
  "     \   'paste': {
  "     \      '+': '/usr/local/bin/win32yank.exe -o --lf',
  "     \      '*': '/usr/local/bin/win32yank.exe -o --lf',
  "     \   },
  "     \   'cache_enabled': 1,
  "     \ }
  " endif
]])
vim.g.floaterm_width = 0.99
vim.g.floaterm_height = 0.99
-- vim.g.floaterm_shell = 'pwsh'
  -- augroup FormatAutogroup
  --   autocmd!
  --   autocmd BufWritePost * FormatWrite
  -- augroup END

