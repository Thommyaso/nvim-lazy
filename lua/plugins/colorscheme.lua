return {
    -- the colorscheme should be available when starting Neovim
    {
        -- "thesimonho/kanagawa-paper.nvim",
        "rebelot/kanagawa.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("kanagawa").setup({})
            vim.cmd.colorscheme("kanagawa-wave")
            -- vim.api.nvim_set_hl(0, "Constant", { fg = "#cdd6f4" })
            -- Get the current style of let-vars (e.g., Identifier)
            local var_color = vim.api.nvim_get_hl(0, { name = "Identifier" })

            -- COLOR UPDATE:
            vim.api.nvim_set_hl(0, "Constant", {fg ='#DCD7BA'})
            -- vim.api.nvim_set_hl(0, "@variable", {fg ='#FF9E3B'})

            -- vim.cmd.colorscheme("kanagawa-paper")
            -- vim.api.nvim_set_hl(0, "@exception", { fg = "#ff5555", bold = true })
            -- vim.api.nvim_set_hl(0, "@keyword.exception", { fg = "#ff5555", bold = true })
            -- vim.api.nvim_set_hl(0, "Exception", { fg = "#ff5555", bold = true })
        end,
    },
}
