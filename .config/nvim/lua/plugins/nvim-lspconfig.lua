return {
  "neovim/nvim-lspconfig",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, noremap=true, silent=true }

        -- Restart LSP
        vim.keymap.set('n', '<leader>lr', ":LspRestart<CR>", opts)

        -- Go to definition
        vim.keymap.set('n', 'gd', ":Telescope lsp_definitions<CR>", opts)

        -- Go to type definition
        vim.keymap.set('n', 'gt', ":Telescope lsp_type_definitions<CR>", opts)

        -- Go to declaration
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

        -- Float diagnostics
        vim.keymap.set('n', '<leader>D', ":Telescope diagnostics bufnr=0<CR>", opts)

        -- Show hover information
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

        -- Go to implementation
        vim.keymap.set('n', 'gi', ":Telescope lsp_implementations<CR>", opts)

        -- Show signature help
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

        -- Rename symbol
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

        -- Code actions
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

        -- Go to references
        vim.keymap.set('n', 'gr', ":Telescope lsp_references<CR>", opts)

        -- Show line diagnostics in a floating window
        vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, opts)

        -- Go to next diagnostic
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)

        -- Go to previous diagnostic
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
      end,
    })

    local signs = { Error = "", Warn = "", Hint = "", Info = "" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    vim.diagnostic.config({
      virtual_text = false,
      signs = true,
      underline = true,
      update_in_insert = true,
      severity_sort = true,
    })

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "cssls",
        "emmet_ls",
        "html",
        "lua_ls",
        "pyright",
        "tsserver",
        "eslint",
      },
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    mason_lspconfig.setup_handlers({
      -- default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ["tsserver"] = function()
        lspconfig["tsserver"].setup({
          capabilities = capabilities,
          filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
          on_attach = function(client, bufnr)
            vim.keymap.set('n', '<leader>oi', function()
              vim.lsp.buf.execute_command({
                command = "_typescript.organizeImports",
                arguments = {vim.api.nvim_buf_get_name(0)}
              })
            end, { buffer = bufnr, desc = "Organize Imports" })

            vim.keymap.set('n', '<leader>ri', function()
              vim.lsp.buf.code_action({
                apply = true,
                context = { only = { "source.removeUnusedImports.ts" } }
              })
            end, { buffer = bufnr, desc = "Remove unused imports" })

            vim.keymap.set('n', '<leader>ai', function()
              vim.lsp.buf.code_action({
                apply = true,
                context = { only = { "source.addMissingImports.ts" } }
              })
            end, { buffer = bufnr, desc = "Add missing imports" })
          end,
          handlers = {
            ["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
              local client = vim.lsp.get_client_by_id(ctx.client_id)
              local filtered_diagnostics = {}
              local ignored_codes = {
                -- Could not find a declaration file for...
                7016,
              }
              
              for _, diagnostic in ipairs(result.diagnostics) do
                -- Check if the diagnostic code is not in the ignored_codes list
                if not vim.tbl_contains(ignored_codes, diagnostic.code) then
                  table.insert(filtered_diagnostics, diagnostic)
                end
              end
              
              result.diagnostics = filtered_diagnostics
              vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
            end,
          },
        })
      end,
      ["eslint"] = function()
        lspconfig.eslint.setup({
          capabilities = capabilities,
          filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
          on_attach = function(client, bufnr)
            vim.keymap.set('n', '<leader>fa', function()
              vim.lsp.buf.code_action({
                apply = true,
                context = { only = { "source.fixAll.eslint" } }
              })
            end, { buffer = bufnr, desc = "Fix all ESLint issues" })
          end,
        })
      end,
      ["emmet_ls"] = function()
        lspconfig["emmet_ls"].setup({
          capabilities = capabilities,
          filetypes = { "html", "typescriptreact", "javascriptreact", "css", "scss" },
        })
      end,
      ["lua_ls"] = function()
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        })
      end,
    })
  end,
}
