return {
  "vicentedpsantos/github-nvim",
  config = function()
    require('github-nvim')

    -- Normal mode mappings
    vim.keymap.set("n", "<leader>gho", ":OpenGitHub<cr>", { desc = "Open GitHub repository page of current repo." })
    vim.keymap.set("n", "<leader>ghf", ":OpenGitHubFile<cr>",
      { desc = "Open GitHub page of current repo at current file." })
    vim.keymap.set("n", "gH", ":OpenGitHubFileLine<cr>",
      { desc = "Open GitHub page of current repo at current file and line." })
    vim.keymap.set("n", "gY", ":CopyGitHubFileLine<cr>",
      { desc = "Copy GitHub URL of current file and line to clipboard." })

    -- Visual mode mappings
    vim.keymap.set("v", "gH", ":OpenGitHubFileLine<cr>",
      { desc = "Open GitHub page of current repo at current file at current range." })
    vim.keymap.set("v", "gY", ":CopyGitHubFileLine<cr>",
      { desc = "Copy GitHub URL of current file and range to clipboard." })
  end
}
