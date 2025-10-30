return {
  --[[ "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp", -- optionnel
  },

  config = function()
    local mason_lspconfig = require("mason-lspconfig")
    local configs = vim.lsp.configs
    local util = require("lspconfig.util")

    -- local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local function on_attach(_, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }
      local keymap = vim.keymap.set
      keymap("n", "gd", vim.lsp.buf.definition, opts)
      keymap("n", "gr", vim.lsp.buf.references, opts)
      keymap("n", "gi", vim.lsp.buf.implementation, opts)
      keymap("n", "K", vim.lsp.buf.hover, opts)
      keymap("n", "<space>rn", vim.lsp.buf.rename, opts)
      keymap("n", "<space>ca", vim.lsp.buf.code_action, opts)
      keymap("n", "[d", vim.diagnostic.goto_prev, opts)
      keymap("n", "]d", vim.diagnostic.goto_next, opts)
    end

    ----------------------------------------------------------------
    -- Déclaration des serveurs
    ----------------------------------------------------------------
    local servers = {
      clangd = {
        cmd = { "clangd", "--enable-config" },
        filetypes = { "c", "cpp" },
        root_dir = function(fname)
          return util.root_pattern(".clangd", "compile_commands.json", ".git")(fname)
            or vim.fn.getcwd()
        end,
        on_attach = on_attach,
        -- capabilities = capabilities,
        settings = {
          clangd = {
            semanticHighlighting = true,
            completion = { placeholder = true },
          },
        },
      },

      lua_ls = {
        on_attach = on_attach,
        -- capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            completion = { callSnippet = "Replace" },
            workspace = { checkThirdParty = false },
          },
        },
      },
    }

    ----------------------------------------------------------------
    -- Mason + nouvelle API
    ----------------------------------------------------------------
    mason_lspconfig.setup({
      ensure_installed = vim.tbl_keys(servers),
      automatic_installation = true,
    })

    -- Pour chaque serveur installé, démarre avec la nouvelle API
    mason_lspconfig.on_server_ready(function(server_name)
      local config = servers[server_name]
      if config then
        if not configs[server_name] then
          configs[server_name] = config
        end
        vim.lsp.start(config)
      end
    end)
  end, ]]
}
