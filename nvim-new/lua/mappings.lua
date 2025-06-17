require "nvchad.mappings"
local harpoon = require "harpoon"

-- add yours here

local map = vim.keymap.set
local nomap = vim.keymap.del

local insert_current_filename = function()
  local filename = vim.fn.expand "%"
  vim.cmd("normal! oconsole.log('" .. filename:gsub(".*%/", "") .. "', )")
end

-- unmap
nomap("n", "<leader>/")
nomap("n", "<leader>b")
-- nomap("n", "<leader>gb")
nomap("n", "<leader>gt")
-- nomap("n", "<leader>sh")

-- default mappings
map("n", "<leader>s", "<cmd>w<CR>", { desc = "﬚  save file" })
map("n", "<leader><leader>s", "<cmd>wa<CR>", { desc = "﬚  save all file" })
map("n", "<leader><leader>w", "<cmd>noautocmd w<CR>", { desc = "﬚  save file" })
map("n", "<leader><leader>q", "<cmd>bufdo bwipeout<CR>", { desc = "﬚  close all buffer" })
map(
  "n",
  "<leader>e",
  "<cmd>Telescope find_files hidden=true no_ignore=false previewer=false<CR>",
  { desc = "🔍 find files" }
)
map("n", "<leader>q", "<cmd>bd<CR>", { desc = "close buffer" })
map("n", "gh", function()
  vim.lsp.buf.hover()
end, { desc = "document diagnostic" })
map("n", "<leader>lf", function()
  vim.diagnostic.open_float { border = "rounded" }
end, { desc = "document diagnostic" })

-- Telescope
map("n", "<leader>o", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "🔍 find symbols" })
map("n", "<leader><S-o>", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", { desc = "🔍 find workspace symbols" })
map("n", "<leader>co", "<cmd>Telescope command_history<CR>", { desc = "🔍 command history" })
map("n", "<leader>re", "<cmd>Telescope resume<CR>", { desc = "🔍 telescope resume" })
map("n", "<leader>lj", "<cmd>Telescope jumplist<CR>", { desc = "🔍 jumplist" })
map("n", "<leader>fc", "<cmd>Telescope flutter commands<CR>", { desc = "🔍 jumplist" })
map("n", "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find previewer=false<CR>", { desc = "close buffer" })

-- zen
map("n", "<leader>z", "<cmd>Zenmode<CR>", { desc = "zen mode" })

map("n", "<leader>pj", "<cmd>Easypick java_commands<CR>", { desc = "Easypick java" })

-- other
map("n", "<leader>nc", function()
  insert_current_filename()
end, { desc = " 󱓞 console log js" })
map("n", "<leader>nt", "<cmd>TSContextToggle<CR>", { desc = "toggle TS context" })
map("n", "c", '"_c', { desc = "change without yanking" })
map("v", "c", '"_c', { desc = "change without yanking" })
map("v", "p", '"_dP', { noremap = true }) -- NOTE: im not sure if i need this forever
-- map("v", "p", '"_p', { desc = "copy in visual mode without yanking" })
map("n", "x", '"_x', { desc = "del char without yanking" })
map("n", "s", '"_s', { desc = "swap without yanking" })
map("n", "<leader>d", '"_d', { desc = "delete without yanking" })
map("n", "<leader>bb", "<cmd>enew<CR>", { desc = "🗒️new buffer" })
map("n", "<leader>tt", "<cmd>TodoTrouble<CR>", { desc = "Todo comments" })
map("n", "<leader>tt", "<cmd>TodoTrouble<CR>", { desc = "Todo comments" })

map("v", "<leader>d", '"_d', { desc = "delete without yanking" })
-- map("v", "<leader>js", "<cmd>")
map("i", "<C-Space>", function()
  require("cmp").complete()
end)
map("n", "<leader>g", "<cmd>FloatermNew lazygit<CR>", { desc = " Lazygit" })
-- random

-- TODO: do spectre commands
map("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
  desc = "Toggle Spectre",
})
map("n", "<leader>rp", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
  desc = "Search current word",
})
map("v", "<leader>rp", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
  desc = "Search current word",
})
map("n", "<leader>rf", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = "Search on current file",
})

-- gitsigns
map("n", "<leader>rh", function()
  package.loaded.gitsigns.reset_hunk()
end, { desc = "Reset Hunk" })
map("n", "<leader>ph", function()
  package.loaded.gitsigns.preview_hunk()
end, { desc = "Preview Hunk" })

map("n", "<leader>bl", function()
  package.loaded.gitsigns.blame_line()
end, { desc = "Blame line" })

map("n", "]c", function()
  if vim.wo.diff then
    return "]c"
  end
  vim.schedule(function()
    package.loaded.gitsigns.next_hunk()
  end)
  return "<Ignore>"
end, { desc = "Jump to next hunk" })

map("n", "[c", function()
  if vim.wo.diff then
    return "[c"
  end
  vim.schedule(function()
    package.loaded.gitsigns.prev_hunk()
  end)
  return "<Ignore>"
end, { desc = "Jump to next hunk" })

-- copilot
-- ["<leader>pc"] = { "<cmd> Copilot panel <CR>", "Show Copilot panel" }

-- harpoon
map("n", "<leader>na", function()
  harpoon:list():add()
  print "Added to harpoon"
end, { desc = "Add to harpoon" })
map("n", "<leader>1", function()
  harpoon:list():select(1)
end, { desc = "Harpoon 1" })
map("n", "<leader>2", function()
  harpoon:list():select(2)
end, { desc = "Harpoon 2" })
map("n", "<leader>3", function()
  harpoon:list():select(3)
end, { desc = "Harpoon 3" })
map("n", "<leader>4", function()
  harpoon:list():select(4)
end, { desc = "Harpoon 4" })
map("n", "<leader>5", function()
  harpoon:list():select(5)
end, { desc = "Harpoon 5" })
map("n", "<leader>6", function()
  harpoon:list():select(6)
end, { desc = "Harpoon 6" })
map("n", "<leader>7", function()
  harpoon:list():select(7)
end, { desc = "Harpoon 7" })
map("n", "<leader>8", function()
  harpoon:list():select(8)
end, { desc = "Harpoon 8" })
map("n", "<leader>9", function()
  harpoon:list():select(9)
end, { desc = "Harpoon 9" })
map("n", "<leader>0", function()
  harpoon:list():select(10)
end, { desc = "Harpoon 10" })

-- nvimtree
map("n", "<leader>nf", "<cmd>NvimTreeFocus<CR>", { desc = "🔍 jumplist" })

-- lsp mappings
map("n", "<leader>lr", "<cmd>LspRestart<CR>", { desc = "LSP restart" })

map("n", "gd", function()
  local function on_list()
    vim.api.nvim_command "Trouble lsp_definitions"
  end
  vim.lsp.buf.definition { on_list = on_list }
end, { desc = "⚙️ lsp definition" })

map("n", "gp", function()
  vim.api.nvim_command "Trouble diagnostics filter.buf=0"
end, { desc = "⚙️ document diagnostic" })

map("n", "gP", function()
  vim.api.nvim_command "Trouble diagnostics"
end, { desc = "⚙️ workspace diagnostic" })

map("n", "gr", function()
  vim.api.nvim_command "Trouble lsp_references"
end, { desc = "⚙️ workspace diagnostic" })

map("n", "<leader>ls", vim.lsp.buf.signature_help, { desc = "LSP signature help" })
