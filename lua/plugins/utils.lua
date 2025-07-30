return {
  { "windwp/nvim-autopairs", event = "InsertEnter", config = true },
  {
    "numToStr/Comment.nvim",
    config = function()
        require('Comment').setup()
        vim.keymap.set("v", "<C-/>", "<Plug>(comment_toggle_linewise_visual)" , {noremap = true , silent = true , desc = "Toggle comment"})   
    end
  },
}

