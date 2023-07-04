dofile(vim.g.base46_cache .. "lsp")
require "nvchad_ui.lsp"

local M = {}
local utils = require "core.utils"

-- export on_attach & capabilities for custom lspconfigs

M.on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  utils.load_mappings("lspconfig", { buffer = bufnr })

  if client.server_capabilities.signatureHelpProvider then
    require("nvchad_ui.signature").setup(client)
  end

  if not utils.load_config().ui.lsp_semantic_tokens then
    client.server_capabilities.semanticTokensProvider = nil
  end
  vim.keymap.set("n", "gD", "<cmd>Telescope lsp_type_definitions<cr>", map_opts)
  vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", map_opts)
  vim.keymap.set("n", "gs", "<cmd>Telescope lsp_document_symbols<cr>", map_opts)
  vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", map_opts)
  vim.keymap.set("n", "gw", "<cmd>Telescope lsp_workspace_symbols<cr>", map_opts)
  vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", map_opts)
  vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", map_opts)

  -- vim.keymap.set("n", "<space>df", "<cmd>lua vim.lsp.buf.format()<cr>", map_opts)
  vim.keymap.set("n", "<space>cd", "<cmd>lua vim.diagnostic.open_float()<cr>", map_opts)
  -- vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", map_opts)
  -- vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", map_opts)
  -- vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.implementation()<cr>", map_opts)
  -- vim.keymap.set("n", "1gD", "<cmd>lua vim.lsp.buf.type_definition()<cr>", map_opts)
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

require("lspconfig").lua_ls.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          [vim.fn.stdpath "data" .. "/lazy/extensions/nvchad_types"] = true,
          [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

return M
