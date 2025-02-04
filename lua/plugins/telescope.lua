return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            "nvim-tree/nvim-web-devicons",
            "folke/todo-comments.nvim",
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local transform_mod = require("telescope.actions.mt").transform_mod

            local trouble = require("trouble")
            local trouble_telescope = require("trouble.sources.telescope")

            -- or create your custom action
            local custom_actions = transform_mod({
                open_trouble_qflist = function(prompt_bufnr)
                    trouble.toggle("quickfix")
                end,
            })

            telescope.setup({
                defaults = {
                    path_display = { "smart" },
                    mappings = {
                        i = {
                            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                            ["<C-j>"] = actions.move_selection_next, -- move to next result
                            ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
                            ["<C-t>"] = trouble_telescope.open,
                        },
                    },
                },
            })

            telescope.load_extension("fzf")

            -- set keymaps
            local keymap = vim.keymap -- for conciseness

            keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
            keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
            keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
            keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
            keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
        end,
    },

    {
        "folke/todo-comments.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local todo_comments = require("todo-comments")

            -- set keymaps
            local keymap = vim.keymap -- for conciseness

            keymap.set("n", "]t", function()
                todo_comments.jump_next()
            end, { desc = "Next todo comment" })

            keymap.set("n", "[t", function()
                todo_comments.jump_prev()
            end, { desc = "Previous todo comment" })

            todo_comments.setup()
        end,
    },

    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
        opts = {
            focus = true,
        },
        cmd = "Trouble",
        keys = {
            { "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>",              desc = "Open trouble workspace diagnostics" },
            { "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Open trouble document diagnostics" },
            { "<leader>xq", "<cmd>Trouble quickfix toggle<CR>",                 desc = "Open trouble quickfix list" },
            { "<leader>xl", "<cmd>Trouble loclist toggle<CR>",                  desc = "Open trouble location list" },
            { "<leader>xt", "<cmd>Trouble todo toggle<CR>",                     desc = "Open todos in trouble" },
        },
    }
}
