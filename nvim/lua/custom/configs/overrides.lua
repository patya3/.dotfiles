local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "graphql",
    "c",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    disable = {
      "python"
    },
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
  autotag = {
    enable = true
  }

}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "eslint-lsp",
    "prettierd",

    "shfmt",
    "shellcheck",

  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.blankline = {
  show_current_context = false,
  show_current_context_start = false,
  space_char_blankline = " ",
  use_treesitter = true,
}

return M
