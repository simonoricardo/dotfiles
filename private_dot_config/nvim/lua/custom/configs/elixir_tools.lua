local elixir = require "elixir"
local elixirls = require "elixir.elixirls"

elixir.setup {
  credo = {},
  elixirls = {
    cmd = "/Users/simonricard/Documents/language_servers/elixir-ls/language_server.sh",
    settings = elixirls.settings {
      dialyzerEnabled = true,
      fetchDeps = false,
      enableTestLenses = false,
      suggestSpecs = false,
    },
    -- filetypes = { "elixir", "eelixir", "heex", "surface" },
    on_attach = function(client, buffer)
      local map_opts = { buffer = true, noremap = true }
      -- run the codelens under the cursor
      vim.keymap.set("n", "<space>ct", vim.lsp.codelens.run, { buffer = true, noremap = true, desc = "Run codelens" })
      -- remove the pipe operator
      vim.keymap.set(
        "n",
        "<space>cp",
        ":ElixirFromPipe<cr>",
        { buffer = true, noremap = true, desc = "Elixir: Remove pipe operator" }
      )
      -- add the pipe operator
      vim.keymap.set(
        "n",
        "<space>cP",
        ":ElixirToPipe<cr>",
        { buffer = true, noremap = true, desc = "Elixir: Add pipe operator" }
      )
      vim.keymap.set(
        "v",
        "<space>cE",
        ":ElixirExpandMacro<cr>",
        { buffer = true, noremap = true, desc = "Elixir: Expand macro" }
      )

      vim.keymap.set("n", "gD", "<cmd>Telescope lsp_type_definitions<cr>", map_opts)
      vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", map_opts)
      vim.keymap.set("n", "gs", "<cmd>Telescope lsp_document_symbols<cr>", map_opts)
      vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", map_opts)
      vim.keymap.set("n", "gw", "<cmd>Telescope lsp_workspace_symbols<cr>", map_opts)
      vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", map_opts)
      vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", map_opts)
      vim.keymap.set("n", "<space>cd", "<cmd>lua vim.diagnostic.open_float()<cr>", map_opts)

      -- update capabilities for nvim-cmp: https://github.com/hrsh7th/nvim-cmp
      require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
    end,
  },
}
