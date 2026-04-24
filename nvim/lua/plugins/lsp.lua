return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.config("gopls", {
      capabilities = require("blink.cmp").get_lsp_capabilities(),
    })
    vim.lsp.enable("gopls")
  end,
}
