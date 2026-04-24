return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = false,
  ft = "markdown",
  event = {
    "BufReadPre " .. vim.fn.expand("~") .. "/Obsidian/main/*.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/Obsidian/main/*.md",
  },
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>on", "<cmd>Obsidian new<cr>", desc = "Obsidian: new note" },
    { "gf", function()
        if require("obsidian").util.cursor_on_markdown_link() then
          return "<cmd>Obsidian follow_link<cr>"
        end
        return "gf"
      end, expr = true, desc = "Obsidian: follow link" },
  },
  opts = {
    legacy_commands = false,
    workspaces = {
      {
        name = "main",
        path = "~/Obsidian/main",
      },
    },
    completion = {
      nvim_cmp = false,
      blink = true,
      min_chars = 2,
    },
    daily_notes = {
      folder = "daily",
      date_format = "%Y/%Y-%m-%d",
    },
    templates = {
      folder = "template",
    },
    attachments = {
      folder = "assets",
    },
    ui = {
      enable = false,
    },
    picker = {
      name = "telescope.nvim",
    },
  },
}
