-- Sometimes when updating this plugin, Neovim will start crashing when enter insert mode.
-- The solution I found is to delete its database and restart Neovim, which will resintall the plugin and recreate the DB.
-- `rm -rf ~/.local/share/newvim/blink/`
return {
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',

    version = 'v0.*',
    opts = {
      keymap = { preset = 'default' },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      signature = { enabled = true }
    },
    opts_extend = { "sources.default" }
  },
}
