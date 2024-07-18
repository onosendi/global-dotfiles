return {
  "neovim/nvim-lspconfig",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local lspconfig = require("lspconfig")
    --
    lspconfig.eslint.setup({
      on_attach = function(client, bufnr)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lf', '<cmd>lua vim.lsp.buf.code_action({ apply = true, context = { only = { "source.fixAll.eslint" } } })<CR>', {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lr', '<cmd>lua vim.lsp.buf.code_action({ apply = true, context = { only = { "source.removeUnusedImports.ts" } } })<CR>', {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>li', '<cmd>lua vim.lsp.buf.code_action({ apply = true, context = { only = { "source.addMissingImports.ts" } } })<CR>', {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lo', '<cmd>lua vim.lsp.buf.execute_command({command = "_typescript.organizeImports", arguments = {vim.api.nvim_buf_get_name(0)}})<CR>', {noremap = true, silent = true})
      end,
    })

    -- import mason_lspconfig plugin
    local mason_lspconfig = require("mason-lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        -- show definition, references
        opts.desc = "Show LSP references"
        keymap.set("n", "<leader>lR", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Go to declaration"
        keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definitions"
        keymap.set("n", "<leader>ld", "<cmd>Telescope lsp_definitions<CR>", opts)

        opts.desc = "Show LSP implementations"
        keymap.set("n", "<leader>li", "<cmd>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "<leader>lt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts)

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>ln", vim.lsp.buf.rename, opts)

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>lb", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>lh", vim.diagnostic.open_float, opts)

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "<leader>lp", vim.diagnostic.goto_prev, opts)

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "<leader>ln", vim.diagnostic.goto_next, opts)

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "<leader>lk", vim.lsp.buf.hover, opts)

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>lr", ":LspRestart<CR>", opts)
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = "", Warn = "", Hint = "", Info = "" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    local function filter_diagnostics(diagnostics)
      local filtered_diagnostics = {}
      for _, diagnostic in ipairs(diagnostics) do
          if diagnostic.severity ~= vim.lsp.protocol.DiagnosticSeverity.Hint then
              table.insert(filtered_diagnostics, diagnostic)
          end
      end
      return filtered_diagnostics
    end

    vim.lsp.handlers["textDocument/publishDiagnostics"] = function(uri, result, ctx, config)
      result.diagnostics = filter_diagnostics(result.diagnostics)
      vim.lsp.diagnostic.on_publish_diagnostics(uri, result, ctx, config)
    end

    vim.diagnostic.config({
      virtual_text = false,
      signs = true,
      underline = true,
      update_in_insert = true,
      severity_sort = true,
    })

    mason_lspconfig.setup_handlers({
      -- default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
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
