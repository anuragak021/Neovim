-- ~/.config/nvim/lua/options.lua

-- Core Neovim settings
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

-- General keymaps
vim.keymap.set("v", "<C-c>", '":w !wl-copy<CR><CR>"', { noremap = true, silent = true, expr = true })
-- ADDED: Keymap to clear search highlights with <leader><Esc>
vim.keymap.set("n", "<leader><Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })


-- Transparent background autocommand
vim.api.nvim_create_augroup("TransparentBG", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
  group = "TransparentBG",
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
  end,
})

--print("options.lua loaded successfully!")
