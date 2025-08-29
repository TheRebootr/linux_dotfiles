return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },


  {
    'christoomey/vim-tmux-navigator',
       cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious",
        "TmuxNavigatorProcessList",
      },
        keys = {
          { "<c-left>", "<cmd>TmuxNavigateLeft<cr>" },
          { "<c-down>", "<cmd>TmuxNavigateDown<cr>" },
          { "<c-up>", "<cmd>TmuxNavigateUp<cr>" },
          { "<c-right>", "<cmd>TmuxNavigateRight<cr>" },
      },
  },

  {
    'github/copilot.vim',
    lazy=false
  },
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
