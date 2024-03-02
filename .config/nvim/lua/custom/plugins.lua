local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "golines",
        "black",
        "ruff",
        "mypy",
        "pyright",
        "rust-analyzer",
        "eslint-lsp",
        "js-debug-adapter",
        "prettier",
        "typescript-language-server",
        "lua-language-server",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
    {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"go", "python"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },

}
return plugins
