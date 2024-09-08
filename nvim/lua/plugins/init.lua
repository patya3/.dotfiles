return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local conf = require "nvchad.configs.telescope"

      conf.defaults.file_ignore_patterns = { "node_modules/", ".git/" }
      return conf
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "voldikss/vim-floaterm",
    lazy = false,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
    enabled = true,
    requires = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("treesitter-context").setup {
        patterns = {
          default = {
            "function",
            "method",
            "for",
            "while",
            "if",
            "switch",
            "case",
          },
          typescript = {
            "class_declaration",
            "abtract_class_declaration",
            "else_clause",
          },
        },
      }
    end,
  },

  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        keys = {
          ["<cr>"] = "jump_close",
          o = "jump",
        },
        focus = true,
        follow = false,
        max_items = 20,
      }
    end,
    enabled = true,
    lazy = false,
  },
  {
    "windwp/nvim-ts-autotag",
    lazy = false,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false, -- NOTE: helloka
    config = function()
      require("todo-comments").setup()
    end,
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<C-e>",
        function()
          local harpoon = require "harpoon"
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon toogle quick menu",
      },
    },
  },

  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      require("flutter-tools").setup {}
      require("telescope").load_extension "flutter"
    end,
  },

  -- NOTE: maybe needed in the future
  -- {
  --   "nvim-pack/nvim-spectre",
  --   lazy = true,
  --   enabled = true,
  --   config = function()
  --     require("spectre").setup()
  --   end
  -- }

  -- TODO: maybe copilot
  -- {
  --   "numToStr/Comment.nvim",
  --   lazy = false,
  -- }
}
