return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
    require('neo-tree').setup({
      event_handlers = {
           {
            event = 'after_render',
            handler = function ()
              local state = require('neo-tree.sources.manager').get_state('filesystem')
              if not require('neo-tree.sources.common.preview').is_active() then
                state.config = { use_float = false }
                state.commands.toggle_preview(state)
              end
            end
          },
          {
            event = "file_open_requested",
            handler = function()
              require("neo-tree.command").execute({ action = "close" })
            end
          },
      },
      close_if_last_window = true,
      preview = {
          enabled = true,
        },
    })
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", { desc = "Open Neotree", silent = true })
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {desc = "Open Current Buffer", silent = true })
	end,
}
