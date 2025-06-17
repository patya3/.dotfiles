-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
  "html",
  "cssls",
  "clangd",
  "gopls",
  "ts_ls",
  "eslint",
  "bashls",
  "tailwindcss",
  "pylsp",
  "volar",
  "angularls",
  "jdtls",
  "intelephense",
}
local nvlsp = require "nvchad.configs.lspconfig"

local ngProbeLocation =
  "/home/pmeszaros/.local/share/nvim/mason/packages/angular-language-server/node_modules/@angular/language-server"
local tsProbeLocation =
  "/home/pmeszaros/.local/share/nvim/mason/packages/angular-language-server/node_modules/typescript/lib"
local angularls_cmd =
  { "ngserver", "--stdio", "--tsProbeLocations", tsProbeLocation, "--ngProbeLocations", ngProbeLocation }

local mason_registry = require "mason-registry"
local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
  .. "/node_modules/@vue/language-server"

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
  if lsp == "ts_ls" then
    lspconfig.ts_ls.setup {
      on_init = nvlsp.on_init,
      on_attach = nvlsp.on_attach,
      capabilities = nvlsp.capabilities,
      init_options = {
        plugins = {
          {
            name = "@vue/typescript-plugin",
            location = "/home/pmeszaros/.local/share/fnm/node-versions/v20.11.0/installation/lib/node_modules/@vue/typescript-plugin",
            languages = { "vue", "javascript", "typescript" },
          },
        },
      },
      filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
    }
  elseif lsp == "volar" then
    lspconfig[lsp].setup {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
      -- filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
      -- init_options = {
      --   vue = {
      --     hybridMode = false,
      --   },
      -- },
    }
  elseif lsp == "angularls" then
    lspconfig[lsp].setup {
      on_attach = nvlsp.on_attach,
      capabilities = nvlsp.capabilities,
      on_init = nvlsp.on_init,
      cmd = angularls_cmd,
      filetypes = { "typescript", "typescriptreact", "typescript.tsx", "htmlangular", "html" },
      on_new_config = function(new_config, new_root_dir)
        new_config.cmd = angularls_cmd
      end,
    }
  elseif lsp == "eslint" then
    lspconfig[lsp].setup {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
      settings = {
        format = false,
      },
    }
  elseif lsp == "jdtls" then
    require("java").setup {
      jdk = {
        auto_install = false,
      },
      notifications = {
        dap = false,
      },
    }
    lspconfig[lsp].setup {
      on_attach = nvlsp.on_attach,
      capabilities = nvlsp.capabilities,
      filetypes = { "java" },
      settings = {
        java = {
          configuration = {
            runtimes = {
              {
                name = "JavaSE-21",
                path = "/home/pmeszaros/.sdkman/candidates/java/21.0.4-tem",
                default = true,
              },
              {
                name = "JavaSE-14",
                path = "/home/pmeszaros/.sdkman/candidates/java/14.0.2-open",
              },
            },
          },
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
