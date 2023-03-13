local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- overrde plugin configs
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "HiPhish/nvim-ts-rainbow2",
    lazy = false,
  },

  {
    "voldikss/vim-floaterm",
    lazy = false,
  },
  {
    "numToStr/Comment.nvim",
    lazy = false,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = overrides.blankline
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
    requires = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("treesitter-context").setup {
        patterns = {
          default = {
            'function',
            'method',
            'for',
            'while',
            'if',
            'switch',
            'case',
          },
          typescript = {
            "class_declaration",
            "abstract_class_declaration",
            "else_clause",
          },
        }
      }
    end
  },

  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function ()
     require("trouble").setup {
       action_keys = {
          jump_close = {"<cr>"},
          jump = {"o"}
       }
     }
    end

  },

  {
    "windwp/nvim-ts-autotag",
    lazy = false,
  }


  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- Uncomment if you want to re-enable which-key
  -- {
  --   "folke/which-key.nvim",
  --   enabled = true,
  -- },
}

return plugins
