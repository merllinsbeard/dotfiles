return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyonight").setup({
            style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
            transparent = true, -- Enable this to disable setting the background color
            terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
            styles = {
                -- Style to be applied to different syntax groups
                comments = { italic = true },
                keywords = { italic = true },
                functions = {},
                variables = {},
                -- Background styles. Can be "dark", "transparent" or "normal"
                sidebars = "transparent",
                floats = "transparent",
            },
            sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
            day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
            hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
            dim_inactive = false, -- dims inactive windows
            lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

            --- You can override specific color groups to use other groups or a hex color
            --- function will be called with a ColorScheme table
            on_colors = function(colors) end,

            --- You can override specific highlights to use other groups or a hex color
            --- function will be called with a Highlights and ColorScheme table
            on_highlights = function(highlights, colors) end,
        })

        vim.cmd([[
            augroup user_colors
                autocmd!
                autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
                autocmd ColorScheme * highlight NonText ctermbg=NONE guibg=NONE
                autocmd ColorScheme * highlight LineNr ctermbg=NONE guibg=NONE
                autocmd ColorScheme * highlight Folded ctermbg=NONE guibg=NONE
                autocmd ColorScheme * highlight EndOfBuffer ctermbg=NONE guibg=NONE
            augroup END
        ]])

        -- setup must be called before loading the colorscheme
        vim.cmd("colorscheme tokyonight")
    end
}
