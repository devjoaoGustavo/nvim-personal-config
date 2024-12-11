return {
  'vicentedpsantos/vio-nvim',
  path = '/Users/joao/code/vio-nvim',
  -- branch = "add-bovio-api-test-commands",
  opts = {},
  config = function()
    local vio = require 'vio-nvim'

    vim.keymap.set("n", "<leader>ss", vio.display_story, { desc = "📖 Display Story" })
    vim.keymap.set("n", "<leader>rt", "<cmd>RunFileTest<cr>", { desc = "🧪 Run all tests in the current file" })
    vim.keymap.set("n", "<leader>rc", "<cmd>RunClosestTest<cr>", { desc = "🧪 Run the closest test" })
  end
}
