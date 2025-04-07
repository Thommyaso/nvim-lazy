local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>RR', builtin.reloader)

vim.keymap.set('n', '<leader>fa', builtin.lsp_workspace_symbols)
vim.keymap.set('n', '<leader>fb', builtin.current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>fr', builtin.registers)
vim.keymap.set('n', '<leader>gt', builtin.lsp_definitions)
vim.keymap.set('n', '<leader>q', builtin.quickfix)
vim.keymap.set('n', '<leader>of', builtin.oldfiles)
vim.keymap.set('n', '<leader>ac', builtin.commands)
vim.keymap.set('n', '<leader>fm', builtin.marks)
vim.keymap.set('n', '<leader>mp', builtin.man_pages)
vim.keymap.set('n', '<leader>jl', builtin.jumplist)
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fe', builtin.lsp_document_symbols, { desc = 'Telescope find in file' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find git files' })
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set('n', '<leader>lg', builtin.live_grep)

vim.keymap.set('v', '<leader>fs', function()
    vim.cmd('noau normal! "vy')
    local selected_text = vim.fn.getreg('v')
    builtin.grep_string({ search = selected_text });
end)

-- Finding all directiories inside pwd:
-- install: <sudo apt install fd-find> for this to work
vim.keymap.set('n', '<leader>fd', function()
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
