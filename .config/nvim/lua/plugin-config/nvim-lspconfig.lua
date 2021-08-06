local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.tsserver.setup {
  capabilities = capabilities,
  -- Disable diagnostics since we're currently using ALE
  handlers = {['textDocument/publishDiagnostics'] = function(...) end  },
}

lspconfig.html.setup {
  capabilities = capabilities,
}

lspconfig.cssls.setup {
  capabilities = capabilities,
}
