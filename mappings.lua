-- custom.mappings

local M = {}

M.general = {
   n = {
      ["<leader>s"] = { "<cmd> w <CR>" ,"﬚   save file"},
      ["<leader><leader>s"] = { "<cmd> wa <CR>" ,"﬚   save all file"},
      ["<leader><leader>q"] = { "<cmd> bufdo bwipeout <CR>","   close all buffer"},
      ["c"] = { "\"_c", "Change without yanking"},
      ["s"] = { "\"_s", "Swap without yanking"},
      ["x"] = { "\"_x", "Del Char withour yanking"},
      ["<leader>d"] = { "\"_d", "Delete without yanking"},
      ["<S-CR>"] = { "O<ESC>", "Add line before"},
      ["<CR>"] = { "o<ESC>", "Add line after"},
      ["<leader>g"] = {"<cmd> FloatermNew lazygit<CR>", "  git status" },
      ["<leader>fm"] = {
        function()
          vim.lsp.buf.formatting()
        end,
        "   lsp formatting",
      },
      ["<A-q>"] = {
        function()
          local second_tab = vim.api.nvim_list_tabpages()[2]
          if not second_tab then
            local Terminal  = require('toggleterm.terminal').Terminal
            local t = Terminal:new({direction = 'tab'})
            t:toggle()
          else
            vim.api.nvim_command("tabnext 2") 
          end
        end,
        "kecske mecske"
      }

      -- ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "   focus nvimtree" },
      -- ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "   focus nvimtree" },
   },
  v = {
    ["<leader>d"] = { "\"_d", "Delete without yanking"},
  },
  i = {
    ["<C-Space>"] = { function() require('cmp').complete() end},
    ["<C-x><C-o>"] = { function() require('cmp').complete() end},
  },
}
M.tabufline = {
   n = {
      ["<leader>q"] = {
        "<cmd> bd <CR>",
         "   close buffer",
      },
      ["<leader>0"] = {"<cmd> tabnext 0 <CR>", "Go to tab 0"},
      ["<leader>1"] = {"<cmd> tabnext 1 <CR>", "Go to tab 1"},
      ["<leader>2"] = {"<cmd> tabnext 2 <CR>", "Go to tab 2"},
      ["<leader>3"] = {"<cmd> tabnext 3 <CR>", "Go to tab 3"},
      ["<leader>4"] = {"<cmd> tabnext 4 <CR>", "Go to tab 4"},
      ["<leader>5"] = {"<cmd> tabnext 5 <CR>", "Go to tab 5"},
      ["<leader>6"] = {"<cmd> tabnext 6 <CR>", "Go to tab 6"},
      ["<leader>7"] = {"<cmd> tabnext 7 <CR>", "Go to tab 7"},
      ["<leader>8"] = {"<cmd> tabnext 8 <CR>", "Go to tab 8"},
      
   }
}
M.lspconfig = {
   n = {
      ["gh"] = {
         function()
           vim.lsp.buf.hover()
         end,
         "   lsp hover",
      },
      ["d["] = {
        function()
          vim.diagnostic.goto_prev()
        end,
        "   goto prev",
      },
      ["gd"] = {
        function()
          local function on_list()
            vim.api.nvim_command("Trouble lsp_definitions")
          end
          vim.lsp.buf.definition{on_list=on_list}
        end,
        "   lsp definition",
      },
      ["gp"] = {
        function()
          vim.api.nvim_command("Trouble document_diagnostics")
        end,
        "   document diagnostic",
      },
      ["gP"] = {
        function()
          vim.api.nvim_command("Trouble workspace_diagnostics")
        end,
        "   workspace diagnostic",
      },
      ["gr"] = {
        function()
          vim.api.nvim_command("Trouble lsp_references")
        end,
        "   lsp references",
      },
   }
}
M.nvimtree = {
n = {
    ["<leader>n"] = { "<cmd> NvimTreeFocus <CR>", "   focus nvimtree" },
    ["<C-n>"] = {
      function()
        local api = require('nvim-tree.api')
        api.tree.toggle()
      end,
      "toggle nvimtree",
    },
  },

}
M.telescope = {
  n = {
    ["<leader>o"] = { "<cmd> Telescope lsp_document_symbols<CR>", "  find symbols" },
    ["<leader>e"] = { "<cmd> Telescope find_files hidden=true<CR>", "  find files" },
    ["<leader>pt"] = { "<cmd> Telescope terms <CR><ESC>", "   pick hidden term" },
 }
}
M.disabled = {
  n = {
      ["<leader>n"] = "",
      ["<leader>rn"] = "",
      ["<leader>gt"] = "",
      ["<leader>q"] = "",
  }
}
M.nvterm = {
  n = {
    -- ["<A-q>"] = {
    --   function()
    --     require("nvterm.terminal").toggle "float"
    --   end,
    --   "   toggle floating term",
    -- },
    ["<leader>0"] = {"<cmd> tabnext 0 <CR>", "Go to tab 0"},
    ["<leader>1"] = {"<cmd> tabnext 1 <CR>", "Go to tab 1"},
    ["<leader>2"] = {"<cmd> tabnext 2 <CR>", "Go to tab 2"},
    ["<leader>3"] = {"<cmd> tabnext 3 <CR>", "Go to tab 3"},
    ["<leader>4"] = {"<cmd> tabnext 4 <CR>", "Go to tab 4"},
    ["<leader>5"] = {"<cmd> tabnext 5 <CR>", "Go to tab 5"},
    ["<leader>6"] = {"<cmd> tabnext 6 <CR>", "Go to tab 6"},
    ["<leader>7"] = {"<cmd> tabnext 7 <CR>", "Go to tab 7"},
    ["<leader>8"] = {"<cmd> tabnext 8 <CR>", "Go to tab 8"},
  },
}


return M
