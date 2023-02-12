-- local M = {}
--
-- M.setup_lsp = function(attach, capabilities)
--    local lspconfig = require "lspconfig"
--
--    -- lspservers with default config
--    local servers = { "tsserver","html", "cssls"}
--    local root_dir = function() return vim.loop.cwd() end
--
--    for _, lsp in ipairs(servers) do
--       lspconfig[lsp].setup {
--          on_attach = attach,
--          capabilities = capabilities,
--       }
--    end
-- end
--
-- return M
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "tsserver", "gopls"}
local root_dir = function() return vim.loop.cwd() end


for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = root_dir
  }
end

-- local configs = require'lspconfig.configs'
--
-- capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
--
-- if not configs.ls_emmet then
--   configs.ls_emmet = {
--     default_config = {
--       cmd = { 'ls_emmet', '--stdio' };
--       filetypes = {
--         'html',
--         'css',
--         'scss',
--         'javascriptreact',
--         'typescriptreact',
--         'haml',
--         'xml',
--         'xsl',
--         'pug',
--         'slim',
--         'sass',
--         'stylus',
--         'less',
--         'sss',
--         'hbs',
--         'handlebars',
--       };
--       root_dir = function(fname)
--         return vim.loop.cwd()
--       end;
--       settings = {};
--     };
--   }
-- end
--
-- lspconfig.ls_emmet.setup { capabilities = capabilities }
