return {
  {
    'tpope/vim-fugitive'
  },

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require("gitsigns").setup()

      vim.keymap.set('n', '<leader>gp', ':Gitsigns preview_hunk<CR>', {desc = "Preview Git Hunk", silent = true})
      vim.keymap.set('n', '<leader>gt', ':Gitsigns toggle_current_line_blame<CR>', {desc = "Current Line Git Blame", silent = true})
    end
  }
}
