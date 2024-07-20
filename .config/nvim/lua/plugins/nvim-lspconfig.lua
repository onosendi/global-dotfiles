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

        -- Restart LSP
        vim.keymap.set('n', '<leader>lr', ":LspRestart<CR>", { buffer = ev.buf, noremap=true, silent=true, desc = "Restart LSP server" })

        -- Go to definition
        vim.keymap.set('n', 'gd', ":Telescope lsp_definitions<CR>", { buffer = ev.buf, noremap=true, silent=true, desc = "Go to definition" })

        -- Go to type definition
        vim.keymap.set('n', 'gt', ":Telescope lsp_type_definitions<CR>", { buffer = ev.buf, noremap=true, silent=true, desc = "Go to type definition" })

        -- Go to declaration
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf, noremap=true, silent=true, desc = "Go to declaration" })

        -- Float diagnostics
        vim.keymap.set('n', '<leader>D', ":Telescope diagnostics bufnr=0<CR>", { buffer = ev.buf, noremap=true, silent=true, desc = "Show diagnostics for current buffer" })

        -- Show hover information
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf, noremap=true, silent=true, desc = "Show hover information" })

        -- Go to implementation
        vim.keymap.set('n', 'gi', ":Telescope lsp_implementations<CR>", { buffer = ev.buf, noremap=true, silent=true, desc = "Go to implementation" })

        -- Show signature help
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = ev.buf, noremap=true, silent=true, desc = "Show signature help" })

        -- Rename symbol
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = ev.buf, noremap=true, silent=true, desc = "Rename symbol" })

        -- Code actions
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = ev.buf, noremap=true, silent=true, desc = "Show code actions" })

        -- Go to references
        vim.keymap.set('n', 'gr', ":Telescope lsp_references<CR>", { buffer = ev.buf, noremap=true, silent=true, desc = "Go to references" })

        -- Show line diagnostics in a floating window
        vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, { buffer = ev.buf, noremap=true, silent=true, desc = "Show line diagnostics" })

        -- Go to next diagnostic
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { buffer = ev.buf, noremap=true, silent=true, desc = "Go to previous diagnostic" })

        -- Go to previous diagnostic
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { buffer = ev.buf, noremap=true, silent=true, desc = "Go to next diagnostic" })
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
        "autotools_ls",
        "bashls",
        "cssls",
        "dockerls",
        "docker_compose_language_service",
        "emmet_ls",
        "eslint",
        "html",
        "jsonls",
        "lua_ls",
        "nginx_language_server",
        "pyright",
        "taplo",
        "tsserver",
        "yamlls",
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
          on_attach = function(_, bufnr)
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
          on_attach = function(_, bufnr)
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
