local M = {}

function M.on_attach(client, buffer)
  local bufopts = { noremap = true, silent = true, buffer = buffer }
  -- Open Code Diagnostics in a floating window
  vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, bufopts)

  -- Displays hover information about the symbol under the cursor
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)

  -- Jump to the definition
  vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", bufopts)

  -- Jump to declaration
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)

  -- Lists all the implementations for the symbol under the cursor
  vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", bufopts)

  -- Jumps to the definition of the type symbol
  vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", bufopts)

  -- Lists all the references
  vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", bufopts)

  -- Displays a function's signature information
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)

  -- Move to the previous diagnostic
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)

  -- Move to the next diagnostic
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)

  -- Rename all references to the symbol under the cursor.
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)

  --Select a code action available at the current cursor position.
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
end

return M
