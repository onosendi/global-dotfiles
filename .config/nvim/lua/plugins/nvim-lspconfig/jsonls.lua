local lspconfig = require'lspconfig'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local M = {}
M.setup = function(on_attach)
  lspconfig.jsonls.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false

      on_attach(client, bufnr)
    end,
    settings = {
      json = {
        -- Schemas https://www.schemastore.org
        schemas = {
          {
            fileMatch = {'package.json'},
            url = 'https://json.schemastore.org/package.json',
          },
          {
            fileMatch = {'tsconfig*.json'},
            url = 'https://json.schemastore.org/tsconfig.json',
          },
          {
            fileMatch = {
              '.prettierrc', '.prettierrc.json', 'prettier.config.json',
            },
            url = 'https://json.schemastore.org/prettierrc.json',
          },
          {
            fileMatch = {'.eslintrc', '.eslintrc.json'},
            url = 'https://json.schemastore.org/eslintrc.json',
          },
          {
            fileMatch = {
              '.babelrc', '.babelrc.json', 'babel.config.json',
            },
            url = 'https://json.schemastore.org/babelrc.json',
          },
          {
            fileMatch = {
              '.stylelintrc', '.stylelintrc.json','stylelint.config.json',
            },
            url = 'http://json.schemastore.org/stylelintrc.json',
          }
        }
      }
    },
  })
end

return M
