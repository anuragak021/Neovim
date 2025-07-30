--return {
--  {
--    "neovim/nvim-lspconfig",
--    dependencies = {
--      "williamboman/mason.nvim",
--      "williamboman/mason-lspconfig.nvim",
--    },
--    config = function()
--      local on_attach = function(client, bufnr)
----      vim.keymap.set('c' , 'K' , vim.lsp.buf.hover , {})
--      end
--
--      local servers = {
--        "lua_ls",
--        "clangd",
--        "ts_ls",
--      }
--
--      require("mason").setup()
--      require("mason-lspconfig").setup({
--        ensure_installed = servers,
--      })
--
--      for _, server in ipairs(servers) do
--        require("lspconfig")[server].setup({
--          on_attach = on_attach,
--        })
--      end
--    end,
--  },
--}
return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.ts_ls.setup({
        capabilities = capabilities
      })
      lspconfig.solargraph.setup({
        capabilities = capabilities
      })
      lspconfig.html.setup({
        capabilities = capabilities
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.clangd.setup({
                capabilities = capabilities
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})

      vim.keymap.set("n" ,"<leader>ca",  vim.lsp.buf.code_action, {})
    end,
  },
}
