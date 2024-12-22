vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.keymap.set('n', '<leader>/', ':noh<CR>', { noremap = true, silent = true })


vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
-- vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.keymap.set("n", "<Space>", "<Nop>")
vim.keymap.set("v", "<Space>", "<Nop>")

vim.opt.iskeyword:remove("_")

--mapping for adding and changing tabs:
vim.keymap.set("n", "<C-t>", function()
    local path = vim.fn.getcwd()
    vim.cmd("tabnew | Explore " .. path)
end)
vim.keymap.set("n", "<C-Left>", ":tabp<CR>")
vim.keymap.set("n", "<C-Right>", ":tabn<CR>")
        
-- Sets the pwd to where the edditor was opened:
--vim.cmd([[
 -- autocmd VimEnter * silent! lcd %:p:h
--]])

-- setting custom command to get a full path of current position:
vim.api.nvim_create_user_command(
'Pwd',
function()
    local path
    if vim.fn.expand('%') == '' then
        -- No file is currently open; use the current working directory
        path = vim.fn.getcwd()
    else
        -- A file is open; use the full path of the file
        path = vim.fn.expand('%:p')
    end
    print(path)
end,
{ desc = "Print the full path of the current file or working directory" }
)

vim.keymap.set("n", "<leader>pwd", function()
    local path = vim.fn.getcwd()
    print(path)
    vim.cmd("Explore " ..path)
--end, { noremap = true, silent = true })
end)

-- set current file directory as nvim pwd:
vim.keymap.set("n", "<leader>cd", ":cd %:p:h<CR>")
