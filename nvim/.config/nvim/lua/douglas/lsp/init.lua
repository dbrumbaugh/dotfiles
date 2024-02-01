require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "clangd" },
}

local status_ok, lsp_config = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("douglas.lsp.handlers").setup()

require("lspconfig").clangd.setup {
    on_attach = require("douglas.lsp.handlers").on_attach,
    capabilities = require("douglas.lsp.handlers").capabilities,
}
