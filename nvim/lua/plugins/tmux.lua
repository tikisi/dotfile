return {
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
}
