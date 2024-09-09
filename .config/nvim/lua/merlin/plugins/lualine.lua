return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local colors = {
      --bg       = '#00000080',  -- 50% прозрачный черный
      fg       = '#c3ccdc',
      yellow   = '#ECBE7B',
      cyan     = '#008080',
      darkblue = '#081633',
      green    = '#98be65',
      orange   = '#FF8800',
      violet   = '#a9a1e1',
      magenta  = '#c678dd',
      blue     = '#51afef',
      red      = '#ec5f67',
    }
    
    local nightfly_transparent = {
      normal = {
        a = { fg = colors.darkblue, bg = colors.blue, gui = 'bold' },
        b = { fg = colors.fg, bg = colors.bg },
        c = { fg = colors.fg, bg = colors.bg },
      },
      insert = { a = { fg = colors.darkblue, bg = colors.green, gui = 'bold' } },
      visual = { a = { fg = colors.darkblue, bg = colors.magenta, gui = 'bold' } },
      replace = { a = { fg = colors.darkblue, bg = colors.red, gui = 'bold' } },
      inactive = {
        a = { fg = colors.fg, bg = colors.bg, gui = 'bold' },
        b = { fg = colors.fg, bg = colors.bg },
        c = { fg = colors.fg, bg = colors.bg },
      },
    }

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = nightfly_transparent,
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {
          {
            'filename',
            path = 1,  -- Показывает относительный путь к файлу
          }
        },
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  end,
}
