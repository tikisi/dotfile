return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = false,
  ft = "markdown",
  event = {
    "BufReadPre " .. vim.fn.expand("~") .. "/obsidian/*.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/obsidian/*.md",
  },
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>on", "<cmd>Obsidian new<cr>", desc = "Obsidian: new note" },
    { "gf", function()
        if require("obsidian.api").cursor_link() then
          return "<cmd>Obsidian follow_link<cr>"
        end
        return "gf"
      end, expr = true, desc = "Obsidian: follow link" },
  },
  opts = {
    legacy_commands = false,
    workspaces = {
      {
        name = "obsidian",
        path = "~/obsidian",
      },
    },
    notes_subdir = "inbox",
    new_notes_location = "notes_subdir",
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
    checkbox = {
      create_new = false,
    },
    ui = {
      enable = false,
    },
    sync = {
      enabled = true,
    },
    picker = {
      name = "telescope.nvim",
    },
  },
}
