local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

local format_on_save = function(client, buffer)
    vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = buffer,
        callback = function()
            vim.lsp.buf.format { async = false }
        end
    })
end

local servers = { "html", "cssls", "tsserver", "clangd", "elixirls", "efm" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

require("lspconfig").elixirls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
  filetypes = { "elixir", "eelixir", "exs", "eex", "heex", "leex" },
	cmd = { "/Users/simonricard/Documents/language_servers/elixir-ls/language_server.sh" },
})

require("lspconfig").efm.setup({
  on_attach = format_on_save,
	init_options = { documentFormatting = true },
	settings = {
		rootMarkers = { "mix.exs", "mix.lock", ".git/" },
	},
})
