return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = { enabled = false },
      },
    },
    config = function()
      require "configs.lspconfig"
      require "configs.lspconfigs.pyright"
    end,
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    opts = {
      adapters = {
        ["rustaceanvim.neotest"] = {},
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "marksman",
        "nil",
        "stylua",
        "pyright",
      },
    },
  },
  --{
  --  "jose-elias-alvarez/null-ls.nvim",
  --  ft = "go",
  --  opts = function ()
  --    return require "configs.null-ls"
  --  end,
  --},
  {
    "fatih/vim-go",
    ft = "go",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "go",
        "nix",
        "markdown",
        "markdown_inline",
        "rust",
        "ron",
        "kdl",
      },
    },
  },
  {
    "rmagatti/auto-session",
    keys = {
      -- Will use Telescope if installed or a vim.ui.select picker otherwise
      { "<leader>ur", "<cmd>SessionSearch<CR>", desc = "Session search" },
      { "<leader>us", "<cmd>SessionSave<CR>", desc = "Save session" },
      { "<leader>ua", "<cmd>SessionToggleAutoSave<CR>", desc = "Toggle autosave" },
    },
    lazy = false,
    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { "~/", "~/Downloads", "~/Documents" },
      close_unsupported_windows = false,
    },
  },
  {
    "direnv/direnv.vim",
  },
  {
    "gbprod/yanky.nvim",
    desc = "Better Yank/Paste",
    opts = {
      highlight = { timer = 150 },
    },
    keys = {
      {
        "<leader>i",
        function()
          require("telescope").extensions.yank_history.yank_history {}
        end,
        mode = { "n", "x" },
        desc = "Open Yank History",
      },
      { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor" },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before cursor" },
      { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after selection" },
      { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before selection" },
      { "<c-p>", "<Plug>(YankyPreviousEntry)", desc = "Select previous entry through yank history" },
      { "<c-n>", "<Plug>(YankyNextEntry)", desc = "Select next entry through yank history" },
      { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
      { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
      { "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
      { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
      { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put after applying a filter" },
      { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put before applying a filter" },
    },
  },
  {
    "echasnovski/mini.surround",
    version = "*",
    lazy = false,
    config = function()
      require("mini.surround").setup()
    end,
  },
  { "echasnovski/mini.icons", version = "*" },
}
