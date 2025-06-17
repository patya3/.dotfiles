-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "everforest",
  transparency = true,
}

M.ui = {
  tabufline = {
    enabled = true,
  },
  hl_override = {
    TelescopeMatching = {
      fg = "orange",
      bg = "NONE",
    },
    NvDashAscii = {
      fg = "white",
    },
    NvDashButtons = {
      fg = "white",
    },
    ["@operator"] = {
      fg = "pink",
      sp = "none",
    },
    ["@keyword.operator"] = {
      fg = "pink",
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

    ["Type.java"] = {
      fg = "cyan",
    },
    -- TelescopeSelection = {
    --   fg = "cyan",
    --   bg = "black",
    -- },
    -- TelescopeResultsDiffAdd = { fg = "sun" },
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
    ["@lsp.type.modifier.java"] = {
      fg = "red",
    },
    ["@attribute.java"] = {
      fg = "blue",
    },
    ["@attribute.typescript"] = {
      fg = "blue",
    },
  },
}

return M
