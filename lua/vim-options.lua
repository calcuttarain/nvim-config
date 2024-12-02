vim.g.mapleader = " "
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shortmess:append('c')
vim.cmd("set incsearch")
vim.api.nvim_set_keymap('n', '<leader>nh', ':nohlsearch<CR>', { noremap = true, silent = true })
vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
  pattern = "*",
  callback = function()
    vim.cmd("silent! w")
  end
})
vim.opt.termguicolors = true
vim.opt.mouse = ""

vim.api.nvim_set_keymap('n', '<leader>d', ':lua RunDockerPHP()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', ':lua RunPython()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ls', ':lua StartLiveServer()<CR>', { noremap = true, silent = true })


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.api.nvim_set_keymap('n', 'gg', 'gg^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'G', 'G$', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'gg', 'gg^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'G', 'G$', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>p', 'ggVG"_d"+p', { noremap = true, silent = true })

function RunDockerPHP()
  local filepath = vim.fn.expand('%:p')
  local filename = vim.fn.expand('%:t')
  local docker_cmd = "docker-compose exec php php /var/www/html/" .. filename

  vim.fn.system("tmux send-keys -t 1 C-c")
  vim.fn.system("sleep 0.1")

  local tmux_cmd = "tmux send-keys -t 1 \"" .. docker_cmd .. "\" Enter"
  vim.fn.system(tmux_cmd)

  require("notify")("Running " .. filepath .. " in Docker in tmux pane 1", "info", {
    title = "PHP Execution",
    timeout = 3000,
  })
end

function StartLiveServer()
  vim.fn.system("tmux send-keys -t 1 C-c")
  vim.fn.system("sleep 0.1")
  vim.fn.system(
  "tmux send-keys -t 1 'browser-sync start --proxy \"localhost:8080\" --files \"./public/*.php\" --no-notify' Enter")
  require("notify")("Live server started on http://localhost:3000", "info", { title = "Live Server", timeout = 3000 })
end

function RunPython()
  local filepath = vim.fn.expand('%:p')
  vim.fn.system("tmux send-keys -t 1 C-c")

  vim.fn.system("sleep 0.1")
  local tmux_cmd = "tmux send-keys -t 1 \"python3 '" .. filepath .. "'\" Enter"

  vim.fn.system(tmux_cmd)

  require("notify")("Running " .. filepath .. " in tmux pane 1", "info", {
    title = "Python Execution",
    timeout = 3000,
  })
end
