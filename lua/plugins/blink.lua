-- Sometimes when updating this plugin, Neovim will start crashing when enter insert mode.
-- The solution I found is to delete its database and restart Neovim, which will resintall the plugin and recreate the DB.
-- `rm -rf ~/.local/share/newvim/blink/`
return {
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets', 'fang2hou/blink-copilot' },

    version = 'v0.*',
    opts = {
      keymap = { preset = 'default' },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },

      sources = {
        default = { 'copilot', 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
          },
        },
      },


      signature = { enabled = true }
    },
    opts_extend = { "sources.default" }
  },
}
