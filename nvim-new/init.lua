vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "
vim.o.termguicolors = true

-- vim.highlight.priorities.semantic_tokens = 95
-- random

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

local map = vim.keymap.set
local nomap = vim.keymap.del
local autocmd = vim.api.nvim_create_autocmd

autocmd("LspAttach", {
  callback = function(args)
    vim.schedule(function()
      map("n", "gd", function()
        local function on_list()
          vim.api.nvim_command "Trouble lsp_definitions"
        end
        vim.lsp.buf.definition { on_list = on_list }
      end, { desc = "⚙️ lsp definition", buffer = args.buf })

      map("n", "gr", function()
        vim.api.nvim_command "Trouble lsp_references"
      end, { desc = "⚙️ workspace diagnostic", buffer = args.buf })

      map("n", "gi", function()
        vim.api.nvim_command "Trouble lsp_implementations"
      end, { desc = "⚙️ lsp implementation", buffer = args.buf })

      -- map("n", "gh", function()
      --   vim.lsp.buf.hover()
      -- end, { desc = "document diagnostic", buffer = args.buf })
      --
      -- map("n", "<leader>lf", function()
      --   vim.diagnostic.open_float { border = "rounded" }
      -- end, { desc = "document diagnostic", buffer = args.buf })

      map("n", "<leader>sh", function()
        return
      end, { buffer = args.buf })
    end)
    -- nomap("n", "gd", {buffer = args.buf});
  end,
})
