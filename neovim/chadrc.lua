local M = {}


M.ui = {
   theme = "everforest",
   transparency = true,
   close_button = false,
   changed_themes = {
     kanagawa = {
       base_30 = {
         statusline_bg = "NONE",
         black2 = "NONE",
       },
    },
     everforest = {
       base_30 = {
         statusline_bg = "NONE",
         black2 = "NONE",
       },
    },
   },
   hl_override = {
     AlphaHeader = { fg = "purple"},
     AlphaButtons = { fg = "dark_purple"},

     Operator = {
       fg = "cyan",
       sp = "none",
     },
     Conditional = {
      fg = "teal"
     },

     Character = {
       fg = "cyan"
     },
     SpecialChar = {
       fg = "cyan"
     },
     Delimiter = {
       fg = "cyan"
     },
     TSTagDelimiter = {
       fg = "cyan"
     },
     TelescopeSelection = {
      fg = "cyan",
      bg = "black"
    },
  },
  hl_add = {
    TreesitterContext = {
      fg = "cyan",
      bg = "black"
    },
    TreesitterContextLineNumber = {
      fg = "pink"
    }
  }
}

M.plugins = {
   -- options = {
   --    lspconfig = {
   --       setup_lspconf = "custom.plugins.configs.lspconfig",
   --    },
   -- },
   user = require "custom.plugins.init",
   status = {
      alpha = true,
   },
   override = {
      ["nvim-treesitter/nvim-treesitter"] = {
		lazy_load = false,
        ensure_installed = {
          "typescript",
          "html",
          "css",
          "lua",
       },
       rainbow = {
        enable = true,
        extended_mode = true,
        colors = {
          "#b16286",
          "#a89984",
          "#9c86bf",
          "#d79921",
          "#689d6a",
          "#FF9E3B",
          "#458588",
        }

      },
       incremental_selection = {
        enable = true,
        keymaps = {
          -- init_selection = "gnn",
          node_incremental = "af",
          -- scope_incremental = "af",
          node_decremental = "fa",
        },
      },
      autotag = {
        enable = true
      }
     },
      ["goolord/alpha-nvim"] = {
         header = {
           val = {
             [[                               __                ]],
             [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
             [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
             [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
             [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
             [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
           },
--            val = {
-- [[               ______   _   _    _____               ]],
-- [[       /\     |  ____| | \ | |  / ____|              ]],
-- [[      /  \    | |__    |  \| | | (___    _   _   ___ ]],
-- [[     / /\ \   |  __|   | . ` |  \___ \  | | | | / __|]],
-- [[    / ____ \  | |____  | |\  |  ____) | | |_| | \__ \]],
-- [[   /_/    \_\ |______| |_| \_| |_____/   \__, | |___/]],
-- [[                                          __/ |      ]],
-- [[                                         |___/       ]],
--            }
       },
       },
     ["lukas-reineke/indent-blankline.nvim"] = {
      show_current_context = false,
      show_current_context_start = false,
      space_char_blankline = " ",
      use_treesitter = true,
     },
     ["NvChad/nvterm"] = {
       terminals = {
          type_opts = {
             float = {
                relative = "editor",
                width = 1.0,
                height = 1.0,
                border = "single",
             },
          },
       }
     },
     ["NvChad/ui"] = {
       tabufline = {
         lazyload = false,
         overriden_modules = function()
           return require "custom.plugins.configs.tabufline"
         end
       }
     },
    ["williamboman/mason"] = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "json-lsp",

        -- shell
        "shfmt",
        "shellcheck",
      },
    },
   },
}

M.mappings = require "custom.mappings"



return M
