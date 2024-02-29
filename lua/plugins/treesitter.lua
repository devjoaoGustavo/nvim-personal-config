return {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require 'nvim-treesitter.configs'.setup {
      ensure_installed = {
        'lua', 'elixir', 'javascript', 'typescript', 'html', 'css', 'json', 'yaml', 'toml', 'ruby',
        'terraform', 'rust', 'go', 'bash', 'vim', 'vimdoc', 'python'
      },
      auto_install = true,
      highlight = { enable = false },
      additional_vim_regex_highlighting = false,
      textobjects = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-n>",
          node_incremental = "<C-n>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    }
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
}
