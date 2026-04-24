return {
  "saghen/blink.cmp",
  version = "*",
  opts = {
    -- <CR>で補完候補を確定（選択中のみ、未選択なら通常の改行）
    keymap = { preset = "enter" },
    sources = {
      default = { "lsp", "path", "buffer" },
    },
  },
}
