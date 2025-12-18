require("mason").setup({
  ui = {
      icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
      }
  }
})

require("mason-lspconfig").setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    -- "lua_ls",
    "rust_analyzer",
    "pylsp",
    "clangd",
  },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- vim.lsp.config('lua_ls', {
--   capabilities = capabilities,
-- })
vim.lsp.config('rust_analyzer', {
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false;
      }
    }
  }
})

vim.lsp.config('pylsp', {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W391'},
          maxLineLength = 100
        }
      }
    }
  }
})

vim.lsp.config('clangd', {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer = bufnr}); -- 跳转到定义处
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, {buffer = bufnr}); -- 跳转到引用处
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = "悬停文档" }); -- 显示悬停文档
  end
})
