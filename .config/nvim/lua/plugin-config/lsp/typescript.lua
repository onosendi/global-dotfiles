local lsp_config = require('lspconfig')
local on_attach = require('plugin-config/lsp/on_attach')

_G.lsp_organize_imports_sync = function(bufnr)
  -- gets the current bufnr if no bufnr is passed
  if not bufnr then bufnr = vim.api.nvim_get_current_buf() end

  -- params for the request
  local params = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(bufnr)},
    title = ""
  }

  -- perform a syncronous request
  -- 500ms timeout depending on the size of file a bigger timeout may be needed
  vim.lsp.buf_request_sync(bufnr, "workspace/executeCommand", params, 500)
end

lsp_config.tsserver.setup({
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = true
    on_attach(client)
  end,
  commands = {
    OrganizeImports = {
      lsp_organize_imports_sync,
      description = "Organize Imports"
    }
  }
})
