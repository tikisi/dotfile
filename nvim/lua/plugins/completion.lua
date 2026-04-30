return {
  "saghen/blink.cmp",
  version = "*",
  opts = {
    -- <CR>で補完候補を確定（選択中のみ、未選択なら通常の改行）
    -- <C-y>でも確定（blink.cmpのデフォルト挙動を併用）
    keymap = {
      preset = "enter",
      ["<C-y>"] = { "select_and_accept" },
    },
    sources = {
      default = { "lsp", "path", "buffer" },
    },
  },
}
