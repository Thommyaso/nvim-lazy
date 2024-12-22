local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find git files' })
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set('v', '<leader>ps', function()
    vim.cmd('noau normal! "vy')
    local selected_text = vim.fn.getreg('v')
    builtin.grep_string({ search = selected_text });
end)

-- Finding all directiories inside pwd:
-- install: <sudo apt install fd-find> for this to work
vim.keymap.set('n', '<leader>pd', function()
    builtin.find_files({
        find_command = { 'fdfind', '--type', 'd' },
        cwd = vim.fn.getcwd(),
        attach_mappings = function(_, map)
            local actions = require('telescope.actions')
            local action_state = require('telescope.actions.state')
            map('n', '<CR>', function(prmopt_bufnr)
                local entry = action_state.get_selected_entry()
                vim.cmd('tabedit ' .. entry.path)
            end)
            return true
        end,
    })
end, {noremap = true, silent = true})
