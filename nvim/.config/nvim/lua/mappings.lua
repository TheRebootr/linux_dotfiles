require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- convert the following to use `vim.keymap.set`
-- vim.keymap.set({ "n", "t" }, "<A-t>", function()V
--   require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
-- end, { desc = "terminal toggle floating term" })
-- vim.keymap.set({ "n", "t" }, "<C-t>", "<cmd>ToggleTerm direction=float<cr>", { desc = "terminal toggle floating term" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
--
  -- keys = {
  --   { "<c-right>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
  --   { "<c-down>", "<cmd><C-U>TmuxNavigateDown<cr>" },
  --   { "<c-up>", "<cmd><C-U>TmuxNavigateUp<cr>" },
  --   { "<c-left>", "<cmd><C-U>TmuxNavigateRight<cr>" },
  -- },
