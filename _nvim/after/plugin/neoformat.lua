local augroup = vim.api.nvim_create_augroup
local neoformat_group = augroup('Neoformat', {})

vim.api.nvim_create_autocmd('BufWritePre', {
    group = neoformat_group,
    pattern = '*',
    command = [[Neoformat]],
})
