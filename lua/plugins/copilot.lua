return {
  "github/copilot.vim",
  config = function ()
    vim.g.copilot_enabled = true
    vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false
    })
    vim.g.copilot_no_tab_map = true
    vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)')
  end
}
