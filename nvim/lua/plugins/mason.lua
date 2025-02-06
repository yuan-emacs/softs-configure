return {
  -- cmdline tools and lsp servers
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        -- formatters
        "prettier",
        "prettierd",
        -- code spell
        "codespell",
        "misspell",
        "cspell",
        -- markdown
        "markdownlint",
        -- rustywind for tailwindcss
        -- "rustywind",
        -- astro
        "astro-language-server",
        -- Solidity
        "solidity",
        "lua-language-server",
        "shellcheck",
        "shfmt",
        "php-debug-adapter",
        "debugpy",
        "python-lsp-server",
        "intelephense",
      },
    },
  },
}
