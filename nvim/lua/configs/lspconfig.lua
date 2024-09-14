-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers =
  { "html", "cssls", "clangd", "gopls", "ts_ls", "eslint", "bashls", "tailwindcss", "pylsp", "volar", "angularls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- TODO: install volar and angularls later

-- vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

local border = {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮", "FloatBorder" },
  { "│", "FloatBorder" },
  { "╯", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
  { "│", "FloatBorder" },
}

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
---@diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- lsps with default config
for _, lsp in ipairs(servers) do
  if lsp == "volar" then
    lspconfig[lsp].setup {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
      filetypes = { "vue" },
      init_options = {
        vue = {
          hybridMode = false,
        },
      },
    }
  else
    lspconfig[lsp].setup {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    }
  end
end

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
