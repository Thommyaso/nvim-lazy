return {
    'nvim-telescope/telescope.nvim',branch = '0.1.x',

    dependencies = { 
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },
        "nvim-telescope/telescope-live-grep-args.nvim"
    },
    config = function()
        local telescope = require("telescope")

        -- first setup telescope
        telescope.setup({
            -- your config
        })

        -- then load the extension
        telescope.load_extension("live_grep_args")
    end
}
