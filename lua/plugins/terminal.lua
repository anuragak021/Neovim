return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      local toggleterm = require("toggleterm")
      local Terminal = require("toggleterm.terminal").Terminal
      local api = vim.api

      -- Setup global plugin options
      toggleterm.setup({
        size = 15,
        hide_numbers = true,
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = 'horizontal',
        close_on_exit = true,
        shell = vim.o.shell,
      })

      -- Table to hold terminal instances and an index
      local terminals = {}
      local current_index = 0

      -- Function to open a new horizontal terminal
      local function new_terminal()
        local term = Terminal:new({ direction = "horizontal" })
        table.insert(terminals, term)
        return term, #terminals
      end

      -- Helper to focus or open terminal window
      local function focus_term(term)
        local win = term.window
        if win and api.nvim_win_is_valid(win) then
          api.nvim_set_current_win(win)
        else
          term:toggle()
        end
      end

      -- Open or focus terminal by index
      local function open_term_by_index(i)
        local term = terminals[i]
        if term then
          focus_term(term)
        else
          local new_term, idx = new_terminal()
          current_index = idx
          new_term:toggle()
        end
      end

      -- Standard keymaps
      vim.keymap.set({"n", "t"}, "<C-`>", function()
        local term, idx = new_terminal()
        current_index = idx
        term:toggle()
      end, { desc = "New Horizontal Terminal" })

      vim.keymap.set({"n", "t"}, "<C-Right>", function()
        if #terminals == 0 then return end
        current_index = (current_index % #terminals) + 1
        focus_term(terminals[current_index])
      end, { desc = "Next Terminal" })

      vim.keymap.set({"n", "t"}, "<C-Left>", function()
        if #terminals == 0 then return end
        current_index = (current_index - 2) % #terminals + 1
        focus_term(terminals[current_index])
      end, { desc = "Previous Terminal" })

      -- Exit terminal mode
      vim.keymap.set('t', '<C-t>', [[<C-\><C-n>]], { desc = "Terminal to Normal Mode" })
      -- Directly switch from terminal back to editor window
      -- Exit to normal mode and move cursor up to the editor split
      vim.keymap.set('t', '<C-e>', [[<C-\><C-n><C-w>k]], { desc = "Go to Editor Window" })

      -- Toggle all terminals
      vim.keymap.set({"n", "t"}, "<C-b>", function()
        vim.cmd("ToggleTermToggleAll")
      end, { desc = "Toggle All Terminals" })

      -- Map <leader>1..9 to open (not toggle) specific terminal
      for i = 1, 9 do
        vim.keymap.set('n', '<leader>' .. i, function()
          open_term_by_index(i)
        end, { desc = 'Open Terminal #' .. i })
      end
    end
  }
}

