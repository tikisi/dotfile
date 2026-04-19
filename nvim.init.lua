-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        transparent = true,
      })
      vim.cmd.colorscheme("kanagawa")
    end,
  },
  {
    "saghen/blink.cmp",
    version = "*",
    opts = {
      keymap = { preset = "default" },
      sources = {
        default = { "lsp", "path", "buffer" },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "go", "gomod", "gosum", "lua", "vim", "vimdoc" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("gopls", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })
      vim.lsp.enable("gopls")
    end,
  },
  {
    "echasnovski/mini.icons",
    lazy = false,
    config = function()
      require("mini.icons").setup()
    end,
  },
  {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = { "echasnovski/mini.icons" },
    opts = {
      view_options = {
        show_hidden = true,
      },
    },
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    init = function()
      vim.g.tmux_navigator_no_mappings = 1
    end,
    config = function()
      local dirs = { h = "Left", j = "Down", k = "Up", l = "Right" }
      for key, dir in pairs(dirs) do
        local cmd = "<cmd>TmuxNavigate" .. dir .. "<cr>"
        vim.keymap.set({ "n", "v" }, "<C-q>" .. key, cmd, { silent = true })
        vim.keymap.set("i", "<C-q>" .. key, "<Esc>" .. cmd, { silent = true })
        vim.keymap.set("t", "<C-q>" .. key, "<C-\\><C-n>" .. cmd, { silent = true })
      end
    end,
  },
})

vim.opt.number = true
vim.opt.title = true
vim.opt.belloff = "all"

-- ファイルの末尾に改行を加えない
vim.opt.fixeol = false

-- バックアップファイルを作らない
vim.opt.backup = false
vim.opt.swapfile = false

-- 編集中に変更があったら再読み込み
vim.opt.autoread = true

-- clipboard
vim.opt.clipboard = "unnamedplus"

-- tab系
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- search
vim.opt.incsearch = true   -- インクリメンタルサーチ, 1文字入力ごとに検索を行う
vim.opt.ignorecase = true  -- 検索パターンに大文字小文字を区別しない
vim.opt.hlsearch = true    -- 検索結果をハイライト

-- backspaceでの文字削除に対応
vim.opt.backspace = { "indent", "eol", "start" }
vim.keymap.set({ "!", "i", "c" }, "<C-?>", "<C-h>")

-- Makefile時にexpandtabを停止
vim.api.nvim_create_autocmd("FileType", {
  pattern = "make",
  callback = function()
    vim.opt_local.expandtab = false
  end,
})

-- add filename status
vim.opt.laststatus = 2
vim.opt.statusline = "%F"
vim.api.nvim_set_hl(0, "StatusLine", { fg = "lightblue", bg = "black" })
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "white", bg = "black" })

-- ターミナルの背景透過を維持
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NonText", { bg = "NONE" })

-- 行番号列の背景を透過し、文字色を指定
vim.api.nvim_set_hl(0, "LineNr", { fg = "#7a8394", bg = "NONE" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#c0caf5", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
vim.api.nvim_set_hl(0, "FoldColumn", { bg = "NONE" })

-- コメントを見やすくする
vim.api.nvim_set_hl(0, "Comment", { fg = "#8a9aab", italic = true })
vim.api.nvim_set_hl(0, "@comment", { fg = "#8a9aab", italic = true })

-- ビジュアル選択の背景色を濃くする
vim.api.nvim_set_hl(0, "Visual", { bg = "#2d4f7c" })
