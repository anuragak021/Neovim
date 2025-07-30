return {
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          -- Lua
          null_ls.builtins.formatting.stylua,

          -- JavaScript / TypeScript
          null_ls.builtins.formatting.prettier,
          --null_ls.builtins.diagnostics.eslint_d,
          -- C++
          null_ls.builtins.formatting.clang_format,
        },
      })

      -- Keymap to format your code
      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format code" })
    end,
  },
}

