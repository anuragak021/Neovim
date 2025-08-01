return {
  -- Snippet Engine
  {
    "L3MON4D3/LuaSnip",
    event = "VeryLazy",
    config = function()
      -- This now loads snippets from the new `lua/snippets` directory
      require("luasnip.loaders.from_lua").load({ paths = { vim.fn.stdpath("config") .. "/lua/snippets" } })
    end,
  },
  -- Completion Engine
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "saadparwaiz1/cmp_luasnip" },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      cmp.setup({
        snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4), ['<C-f>'] = cmp.mapping.scroll_docs(4), ['<C-Space>'] = cmp.mapping.complete(), ['<C-e>'] = cmp.mapping.abort(), ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback) if cmp.visible() then cmp.select_next_item() elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump() else fallback() end end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback) if cmp.visible() then cmp.select_prev_item() elseif luasnip.jumpable(-1) then luasnip.jump(-1) else fallback() end end, { "i", "s" }),
        }),
        sources = cmp.config.sources({ { name = "nvim_lsp" }, { name = "luasnip" }, { name = "buffer" }, { name = "path" } }),
      })
    end,
  },
}
