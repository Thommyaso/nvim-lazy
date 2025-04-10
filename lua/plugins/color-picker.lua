return {
  "eero-lehtinen/oklch-color-picker.nvim",
  event = "VeryLazy",
  version = "*",
  keys = {
    -- One handed keymap recommended, you will be using the mouse
    {
      "<C-f>",
      function() require("oklch-color-picker").pick_under_cursor({ fallback_open = {} }) end,
      desc = "Color pick under cursor",
    },
  },
  ---@type oklch.Opts
  opts = {},
}
