return {
  "stevearc/oil.nvim",
  lazy = false,
  dependencies = { "echasnovski/mini.icons" },
  opts = {
    view_options = {
      show_hidden = true,
    },
    preview_win = {
      update_on_cursor_moved = true,
    },
  },
  keys = {
    { "-", "<cmd>Oil --preview<cr>", desc = "Open parent directory with preview" },
  },
}
