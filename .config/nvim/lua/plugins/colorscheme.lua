return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    --config = function()
    opts = function()
      return {}
      -- vim.o.background = "dark"
      --vim.cmd.colorscheme("gruvbox")
    end,
  },
  -- Configure Lazyvim to load specific theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
