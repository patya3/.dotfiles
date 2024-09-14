return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function()
        -- local gs = package.loaded.gitsigns
        --
        -- local function opts(desc)
        --   return { buffer = bufnr, desc = desc }
        -- end
        --
        -- local map = vim.keymap.set
        -- map("n", "<leader>rh", gs.reset_hunk, opts "Reset Hunk")
        -- map("n", "<leader>ph", gs.preview_hunk, opts "Preview Hunk")
        -- map("n", "<leader>bl", gs.blame_line, opts "Blame line")
        --
        -- map("n", "]c", function()
        --   if vim.wo.diff then
        --     return "]c"
        --   end
        --   vim.schedule(function()
        --     gs.next_hunk()
        --   end)
        --   return "<Ignore>"
        -- end, opts "Jump to next hunk")
        --
        -- map("n", "[c", function()
        --   if vim.wo.diff then
        --     return "[c"
        --   end
        --   vim.schedule(function()
        --     gs.prev_hunk()
        --   end)
        --   return "<Ignore>"
        -- end, opts "Jump to prev hunk")
      end,
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = {
        enable = false,
        ignore = true,
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local conf = require "nvchad.configs.telescope"

      conf.defaults.file_ignore_patterns = { "node_modules/", ".git/", "venv/" }
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

  {
    "github/copilot.vim",
    lazy = false,
    enabled = true,
    init = function()
      vim.g.copilot_no_tab_maps = true
      vim.g.copilot_assume_mapped = true
    end,
    config = function()
      vim.api.nvim_set_keymap("i", "<C-o>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end,
  },

  -- NOTE: maybe needed in the future
  {
    "nvim-pack/nvim-spectre",
    lazy = true,
    enabled = true,
    config = function()
      require("spectre").setup()
    end,
  },

  -- TODO: maybe copilot
  {
    "numToStr/Comment.nvim",
    lazy = true,
    keys = {
      { "gcc", mode = "n", desc = "Comment toggle current line" },
      { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n", desc = "Comment toggle current block" },
      { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
    },
    config = function(_, opts)
      require("Comment").setup(opts)
    end,
  },
}
