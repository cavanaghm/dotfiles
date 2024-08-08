local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'gopls',
  'templ',

  -- Python
  'pylsp',
  'ruff',
})

-- Fix Undefined global 'vim'
lsp.configure('lua-language-server', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

vim.filetype.add({ extension = { templ = "templ" } })

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

local mappings = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
        cmp.complete()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
        cmp.complete()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
}
local cmp_mappings = lsp.defaults.cmp_mappings(mappings)

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
  completion = {
      completeopt = 'menu,menuone,noinsert,noselect'
  },
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
