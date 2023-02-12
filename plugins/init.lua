return {
  ["goolord/alpha-nvim"] = {
    disable = false,
  },
  ["voldikss/vim-floaterm"] = {},

  ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require "custom.plugins.configs.null-ls"
      end,
   },
  -- ["mhartington/formatter.nvim"] = {
  --   config = function ()
  --     require "custom.plugins.configs.formatter"
  --   end
  -- },
  ["p00f/nvim-ts-rainbow"] = {},
  ["folke/trouble.nvim"] = {
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
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.configs.lspconfig"
    end,
  },
  ["nvim-treesitter/nvim-treesitter-context"] ={
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
  -- ["windwp/nvim-ts-autotag"] = {
  -- }
}
