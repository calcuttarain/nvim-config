vim.g.mapleader = " "
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shortmess:append('c')
vim.cmd("set incsearch")
vim.opt.termguicolors = true
vim.opt.mouse = ""

vim.api.nvim_set_keymap('n', '<leader>nh', ':nohlsearch<CR>', { desc = "No Highlight Search", noremap = true, silent = true })
vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
  pattern = "*",
  callback = function()
    vim.cmd("silent! w")
  end
})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line up" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank selection to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank current line to system clipboard" })
vim.keymap.set("n", "<leader>gy", ":%y+<CR>", { noremap = true, silent = true, desc = "Yank entire buffer to system clipboard" })
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search and replace word under cursor globally" })
vim.keymap.set("n", "gg", "gg^", { noremap = true, silent = true, desc = "Go to first non-blank character of the file" })
vim.keymap.set("n", "G", "G$", { noremap = true, silent = true, desc = "Go to end of line on last line" })
vim.keymap.set("v", "gg", "gg^", { noremap = true, silent = true, desc = "Go to first non-blank character in visual mode" })
vim.keymap.set("v", "G", "G$", { noremap = true, silent = true, desc = "Go to end of line in visual mode" })
vim.keymap.set("n", "<leader>p", 'ggVG"_d"+p', { noremap = true, silent = true, desc = "Replace whole buffer with system clipboard content" })

