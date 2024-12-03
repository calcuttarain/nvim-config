return {
  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
      })
    end
  },

  {
    'shaunsingh/nord.nvim',
    priority = 1000,
    config = function()
      vim.cmd[[colorscheme nord]]
    end
  },

  {
    "fcancelinha/nordern.nvim", 
    branch = "master", 
  },

  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
  },

  {
    'frenzyexists/aquarium-vim'
  },

  {
    'aliqyan-21/darkvoid.nvim',
    config = function()
      require('darkvoid').setup()
    end
  }
}
