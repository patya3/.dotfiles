local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettierd" },
    html = { "prettierd" },
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    htmlangular = { "prettierd" },
    vue = { "prettierd" },
    python = { "flake8", "black" },
    json = { "prettierd" },
    typescriptreact = { "prettierd" },
    javascriptreact = { "prettierd" },
  },

  format_on_save = function(bufnr)
    local ignore_filetypes = { "vue" }

    if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
      return
    end

    return {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_format = "fallback",
    }
  end,
}

return options
