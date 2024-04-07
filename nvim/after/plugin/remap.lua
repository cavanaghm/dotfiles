vim.keymap.set("n", 'gI', vim.lsp.buf.implementation)
vim.keymap.set("n", '<leader>d', vim.lsp.buf.type_definition)
vim.keymap.set("n", '<leader>ds', require('telescope.builtin').lsp_document_symbols)
vim.keymap.set("n", '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols)

vim.keymap.set("n", '<leader>e', '<Cmd>Ex<CR>')

-- Alt-Y yanks to clipboard
vim.keymap.set("v", "<M-y>", '"+y<ESC>')
-- Alt-D kills to clipboard
vim.keymap.set("v", "<M-d>", '"+c<ESC>')
-- Alt-P pastes from clipboard
vim.keymap.set("n", "<M-p>", '"+p<ESC>')

vim.keymap.set("n", 'K', vim.lsp.buf.hover)
vim.keymap.set("n", '<C-k>', vim.lsp.buf.signature_help)

-- Lesser used LSP functionality
vim.keymap.set("n", 'gD', vim.lsp.buf.declaration)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end)
vim.keymap.set("n", '<leader>wa', vim.lsp.buf.add_workspace_folder)
vim.keymap.set("n", '<leader>wr', vim.lsp.buf.remove_workspace_folder)
vim.keymap.set("n", '<leader>rn', function() vim.lsp.buf.rename() end)
vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end)
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end)
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
vim.keymap.set("n", 'gr', require('telescope.builtin').lsp_references)
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end)
vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end)
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end)
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end)
