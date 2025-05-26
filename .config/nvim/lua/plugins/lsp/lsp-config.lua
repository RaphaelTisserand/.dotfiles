return {
	"neovim/nvim-lspconfig",

	config = function()
		local lspconfig = require("lspconfig")
		--[[ local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_lsp.default_capabilities(
			vim.lsp.protocol.make_client_capabilities()
		)
		capabilities.offsetEncoding = { "utf-16" } ]]

		lspconfig["clangd"].setup({
			cmd = { "clangd", "--enable-config" },
			filetypes = { "c", "cpp" },
			root_dir = function(fname)
				return require("lspconfig").util.root_pattern(".clangd", "compile_commands.json", ".git")(fname)
					or vim.fn.getcwd()
			end,
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
				local opts = { noremap = true, silent = true }

				buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
				buf_set_keymap("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
				buf_set_keymap("n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
				buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
				buf_set_keymap("n", "<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
				buf_set_keymap("n", "<space>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
				buf_set_keymap("n", "<space>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
			end,
			settings = {
				clangd = {
					semanticHighlighting = true,
					completion = {
						placeholder = true
					},
				},
			},
		})

		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					completion = {
						callSnippet = "Replace",
					}
				}
			}
		})
	end
}
