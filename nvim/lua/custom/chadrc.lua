---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
-- local highlights = require "custom.highlights"

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

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
