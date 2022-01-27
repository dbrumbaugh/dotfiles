local M = {}

M.setup = function()
    local status_ok, _ = pcall(require, "metals")
    if not status_ok then
      return
    end

    vim.opt_global.shortmess:remove("F")

    --vim.cmd [[augroup lsp]]
    --vim.cmd [[au!]]
    --vim.cmd [[au FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc)]]
    --vim.cmd [[au FileType java,scala,sbt lua require("metals").initialize_or_attach(metals_config)]]
    --vim.cmd [[augroup end]]

    local metals_config = require("metals").bare_config()
    metals_config.init_options.statusBarProvider = "on"
    metals_config.settings = {
        showImplicitArguments = true,
        showInferredType = true,
        excludedPackages = {}
    }

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    metals_config.capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

    require("metals").initialize_or_attach {metals_config}
end

return M
