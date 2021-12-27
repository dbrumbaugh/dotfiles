local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("douglas.lsp.lsp-installer")
require("douglas.lsp.handlers").setup()
