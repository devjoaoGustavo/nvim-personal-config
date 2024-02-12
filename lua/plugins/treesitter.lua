return {
  'nvim-treesitter/nvim-treesitter',
  build = function()
    pcall(require('nvim-treesitter.install').update { with_sync = true })
  end,
  config = function ()
    require'nvim-treesitter.configs'.setup {
      ensure_installed = 'all',
      auto_install = true,
      highlight = { enable = true }
    }
  end
}
