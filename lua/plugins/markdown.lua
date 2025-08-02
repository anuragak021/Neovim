return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    config = function()
      require("render-markdown").setup({})
      -- CORRECTED: Keymap now calls the Lua function directly
      vim.keymap.set("n", "<leader>mp", function() require("render-markdown").toggle() end, { desc = "Toggle Markdown Render" })
    end,
  },
}

