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

vim.api.nvim_set_keymap('n', '<leader>nh', ':nohlsearch<CR>', { noremap = true, silent = true })
vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
  pattern = "*",
  callback = function()
    vim.cmd("silent! w")
  end
})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "<leader>gy", ":%y+<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.api.nvim_set_keymap('n', 'gg', 'gg^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'G', 'G$', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'gg', 'gg^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'G', 'G$', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>p', 'ggVG"_d"+p', { noremap = true, silent = true })
