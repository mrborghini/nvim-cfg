-- Set up nvim-cmp.
local cmp = require 'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn == 1 then
        vim.fn.feedkeys(t("<Plug>(vsnip-expand-or-jump)"), "")
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        vim.fn.feedkeys(t("<Plug>(vsnip-jump-prev)"), "")
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Enable hover documentation
local on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true }

  -- Set keymap for manual hover documentation
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

  -- Automatically trigger hover on CursorHold
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.hover()
    end
  })
end

vim.opt.updatetime = 1000 -- Time in milliseconds (default is 4000)

-- Add 'on_attach' to each LSP setup
require('lspconfig')['rust_analyzer'].setup {
  capabilities = capabilities,
  on_attach = on_attach
}

require('lspconfig')['clangd'].setup {
  capabilities = capabilities,
  on_attach = on_attach
}

require('lspconfig')['lua_ls'].setup {
  capabilities = capabilities,
  on_attach = on_attach
}

require('lspconfig')['omnisharp'].setup {
  capabilities = capabilities,
  cmd = { "omnisharp" },
  on_attach = on_attach
}

require('lspconfig')['gopls'].setup {
  capabilities = capabilities,
  on_attach = on_attach
}

require('lspconfig')['pyright'].setup {
  capabilities = capabilities,
  on_attach = on_attach
}

require('lspconfig')['bashls'].setup {
  capabilities = capabilities,
  on_attach = on_attach
}
