vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Replacing all instances of higlighted text in the file:
vim.keymap.set("v", "<leader>s", function()
    vim.cmd('noau normal! "vy')
    local selected_text = vim.fn.getreg('v')

    selected_text = vim.fn.escape(selected_text, '/\\')

    local command = vim.api.nvim_replace_termcodes(":%s/\\V", true, true, true)
    local searchString = string.format("%s/%s/gc", selected_text, selected_text)
    local move_cursor_left = vim.api.nvim_replace_termcodes("<Left><Left><Left>", true, true, true)

    vim.fn.feedkeys(command .. searchString .. move_cursor_left)
end)


vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>qq", ":bd!<CR>")

-- When splitting window focus on the new split:
vim.keymap.set('n', '<C-w>v', ':vsplit<CR><C-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<C-w>s', ':split<CR><C-w>j', { noremap = true, silent = true })
