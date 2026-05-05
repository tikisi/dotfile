return {
  "saghen/blink.cmp",
  version = "*",
  opts = {
    -- <C-y>で補完候補を確定（blink.cmp default preset の挙動）
    keymap = {
      preset = "default",
    },
    sources = {
      default = { "lsp", "path", "buffer" },
    },
  },
}
