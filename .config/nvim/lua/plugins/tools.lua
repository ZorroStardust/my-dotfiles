return {
  --[[  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "basedpyright",
        "ruff",
        "cmakelint",
        "shfmt",
        "lua-language-server",
        "json-lsp",
        "yamlls",
        "taplo",
        "marksman",
        "dockerfile-language-server",
      },
    },
  },
--]]

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      automatic_installation = false,
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "cmake",
        "python",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "json",
        "yaml",
        "toml",
        "markdown",
        "markdown_inline",
        "dockerfile",
        "regex",
      },
    },
  },
}
