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

vim.opt.colorcolumn = "120"

vim.keymap.set("n", "<Space>", "<Nop>")
vim.keymap.set("v", "<Space>", "<Nop>")

vim.opt.iskeyword:remove("_")

--mapping for adding and changing tabs:
vim.keymap.set("n", "<C-t>", function()
    local path = vim.fn.getcwd()
    vim.cmd("tabnew | Explore " .. path)
end)

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
end)

-- set current file directory as nvim pwd:
vim.keymap.set("n", "<leader>cd", ":cd %:p:h<CR>")

vim.opt.signcolumn = "yes"
vim.cmd [[
  highlight GitSignsAdd gui=bold
  highlight GitSignsChange gui=bold
  highlight GitSignsDelete gui=bold
  ]]

--Git:
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", {})
vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>", {})

vim.keymap.set("n", "<leader>jq", ":%!jq . <CR>")
vim.keymap.set("v", "<leader>jq", "!jq . <CR>")

-- Toggle Quickfix Window
vim.keymap.set('n', '<leader>Q', function()
  local is_open = false
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(win), "buftype") == "quickfix" then
      is_open = true
      break
    end
  end
  if is_open then
    vim.cmd("cclose")
  else
    vim.cmd("copen")
  end
end, { desc = "Toggle Quickfix Window" })

-- Toggle Git Window
vim.keymap.set("n", "<leader>G", function()
  local fugitive_win = nil

  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local bufname = vim.api.nvim_buf_get_name(buf)

    if bufname:match("^fugitive://") then
      fugitive_win = win
      break
    end
  end

  if fugitive_win then
    vim.api.nvim_win_close(fugitive_win, true)
  else
    vim.cmd("Git")
  end
end, { desc = "Toggle Fugitive" })


vim.keymap.set("n", "<C-Left>", ":tabmove -1<CR>")
vim.keymap.set("n", "<C-Right>", ":tabmove +1<CR>")

vim.keymap.set("n", "<leader>cp", ":let @+ = expand('%:p')<CR>")
