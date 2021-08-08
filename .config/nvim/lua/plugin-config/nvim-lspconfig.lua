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
  filetypes = {'html', 'htmldjango'},
}

lspconfig.cssls.setup {
  capabilities = capabilities,
}

lspconfig.pyright.setup {
  -- Disable diagnostics since we're currently using ALE
  handlers = {['textDocument/publishDiagnostics'] = function(...) end  },
}

lspconfig.bashls.setup {}

lspconfig.jsonls.setup {}
