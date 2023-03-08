local fn = vim.fn
local tabufline_modules = require "nvchad_ui.tabufline.modules"


local M = {}

M.buttons = function()
  return ""
end


M.tablist = function()
  local result, number_of_tabs = "", fn.tabpagenr "$"

  if number_of_tabs > 1 then
    for i = 1, number_of_tabs, 1 do
      local tab_hl = ((i == fn.tabpagenr()) and "%#TbLineTabOn# ") or "%#TbLineTabOff# "
      result = result .. ("%" .. i .. "@TbGotoTab@" .. tab_hl .. i .. " ")
      -- result = (i == fn.tabpagenr() and result .. "%#TbLineTabCloseBtn#" .. "%@TbTabClose@ %X") or result
    end

    local tabstoggleBtn = "%@TbToggleTabs@ %#TBTabTitle#"

    return  tabstoggleBtn .. result

  end
end

return M
