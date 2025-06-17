local java_command_list = [[
<< EOF
JavaRunnerRunMain
JavaRunnerStopMain
JavaRunnerToggleLogs
JavaRunnerSwitchLogs
JavaProfile
JavaBuildBuildWorkspace
JavaBuildCleanWorkspace
JavaDapConfig
JavaRefactorExtractConstant
JavaRefactorExtractField
JavaRefactorExtractMethod
JavaRefactorExtractVariable
JavaRefactorExtractVariableAllOccurrence
JavaSettingsChangeRuntime
JavaTestDebugCurrentClass
JavaTestDebugCurrentMethod
JavaTestRunCurrentClass
JavaTestRunCurrentMethod
JavaTestViewLastReport
EOF
]]
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
      view = {
        width = 50,
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = {
          "node_modules/",
          ".git/",
          "venv/",
          "%.class",
          ".next/",
          "dist/",
          "build/",
        },
        layout_strategy = "vertical",
        layout_config = {
          width = 0.9,
          height = 0.95,
          prompt_position = "top",
          vertical = {
            mirror = true,
            preview_cutoff = 0,
            preview_height = 0.4,
          },
        },
      },
    },
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
    "nvim-tree/nvim-web-devicons",
    opts = function()
      return {
        override = {
          default = "",
          symlink = "",
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
    opts = {
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = true,
      },

      per_filetype = {
        ["html"] = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = true,
        },
      },
    },
  },
  {
    "windwp/nvim-autopairs",
    enabled = true,
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
      require("flutter-tools").setup {
        dev_tools = {
          autostart = true,
          auto_open_browser = true,
        },
      }
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
      local ft = require "Comment.ft"

      ft({ "htmlangular" }, ft.get "html")
    end,
  },

  {
    "nvim-java/nvim-java",
    lazy = true,
    dependencies = {
      "nvim-java/lua-async-await",
      "nvim-java/nvim-java-refactor",
      "nvim-java/nvim-java-core",
      "nvim-java/nvim-java-test",
      "nvim-java/nvim-java-dap",
      "MunifTanjim/nui.nvim",
      "neovim/nvim-lspconfig",
      "MunifTanjim/nui.nvim",
      "mfussenegger/nvim-dap",

      {
        "JavaHello/spring-boot.nvim",
        commit = "218c0c26c14d99feca778e4d13f5ec3e8b1b60f0",
      },
      {
        "williamboman/mason.nvim",
        opts = {
          registries = {
            "github:nvim-java/mason-registry",
            "github:mason-org/mason-registry",
          },
        },
      },
    },
    -- config = function()
    -- end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
  },
  {
    "axkirillov/easypick.nvim",
    requires = "nvim-telescope/telescope.nvim",
    lazy = false,
    config = function()
      local easypick = require "easypick"
      easypick.setup {
        pickers = {
          {
            name = "java_commands",
            command = "cat " .. java_command_list,
            action = easypick.actions.nvim_commandf ":%s",
            opts = require("telescope.themes").get_dropdown {},
          },
        },
      }
    end,
  },

  -- {
  --   "mfussenegger/nvim-lint",
  --   event = "BufWritePost",
  --   config = function()
  --     local lint = require "lint"
  --     lint.linters_by_ft = {
  --       javascript = { "eslint" },
  --       typescript = { "eslint" },
  --       typescriptreact = { "eslint" },
  --       javascriptreact = { "eslint" },
  --       vue = { "eslint" },
  --     }
  --
  --     vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  --       callback = function()
  --         -- try_lint without arguments runs the linters defined in `linters_by_ft`
  --         -- for the current filetype
  --         require("lint").try_lint()
  --       end,
  --     })
  --   end,
  -- },
  {
    "Snikimonkd/yazmp",
    lazy = false,
  },
  -- {
  --   "pmizio/typescript-tools.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --   enabled = true,
  --   opts = {
  --     filetypes = {
  --       "javascript",
  --       "javascriptreact",
  --       "javascript.jsx",
  --       "typescript",
  --       "typescriptreact",
  --       "typescript.tsx",
  --       "vue",
  --     },
  --     settings = {
  --       tsserver_max_memory = "auto",
  --       tsserver_plugins = {
  --         "@vue/typescript-plugin",
  --       },
  --       tsserver_file_preferences = {
  --         "javascript",
  --         "javascriptreact",
  --         "javascript.jsx",
  --         "typescript",
  --         "typescriptreact",
  --         "typescript.tsx",
  --         "vue",
  --         includeInlayParameterNameHints = "all",
  --         includeCompletionsForModuleExports = true,
  --         quotePreference = "auto",
  --       },
  --       tsserver_preferences = {},
  --       expose_as_code_action = "all",
  --     },
  --   },
  -- },
}
