return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    enabled = false,
    branch = "main",
    dependencies = {
      "zbirenbaum/copilot.vim",   -- or zbirenbaum/copilot.vim
      "nvim-lua/plenary.nvim",    -- for curl, log wrapper
    },
    opts = {
      debug = true,
    },
    -- See Commands section for default commands if you want to lazy load on them
    config = function()
      require('CopilotChat').setup()

      vim.keymap.set('n', '<F1>', ':CopilotChatToggle<cr>', { silent = true, noremap = true })
    end
  }
}
