---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
-- local highlights = require "custom.highlights"

M.ui = {
  tabufline = {
    enabled = true,
  },
  hl_override = {
    ["@operator"] = {
      fg = "pink",
      sp = "none",
    },
    ["@keyword.operator"] = {
      fg = "cyan",
    },
    ["@conditional"] = {
      fg = "baby_pink",
    },

    ["@character"] = {
      fg = "cyan",
    },
    ["@string.special"] = {
      fg = "cyan",
    },
    ["@tag.delimiter"] = {
      fg = "cyan",
    },
    ["@punctuation.delimiter"] = {
      fg = "baby_pink",
    },
    TelescopeSelection = {
      fg = "cyan",
      bg = "black",
    },
  },

  nvdash = {
    load_on_startup = true,
    header = {
      [[                               __                ]],
      [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
      [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
      [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
      [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
      [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    },
  },
  theme = "everforest",
  transparency = true,
  close_button = false,
  hl_add = {
    TreesitterContext = {
      fg = "cyan",
      bg = "black",
    },
    TreesitterContextLineNumber = {
      fg = "pink",
    },
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
