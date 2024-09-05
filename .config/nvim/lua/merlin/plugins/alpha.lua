math.randomseed(os.time())

local merlin_hat = {
    "   *    .  *       *    *   . *   *            ",
    " *  *  .    *    *   ★    *   .   *           ",
    ".    *        *    *    .    *   *            ",
    "               /\\                              ",
    "              /  \\                             ",
    "             /    \\                            ",
    "            /      \\                           ",
    "           /________\\                          ",
    "          /\\        /\\                         ",
    "         /  \\      /  \\                        ",
    "        /    \\    /    \\                       ",
    " ███╗   ███╗███████╗██████╗ ██╗     ██╗███╗   ██╗",
    " ████╗ ████║██╔════╝██╔══██╗██║     ██║████╗  ██║",
    " ██╔████╔██║█████╗  ██████╔╝██║     ██║██╔██╗ ██║",
    " ██║╚██╔╝██║██╔══╝  ██╔══██╗██║     ██║██║╚██╗██║",
    " ██║ ╚═╝ ██║███████╗██║  ██║███████╗██║██║ ╚████║",
    " ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═══╝",
    " ᛗ       ᛖ       ᚱ       ᛚ       ᛁ       ᚾ      ",
}

local quotes = {
    "It does not do to dwell on bugs and forget to live... and code.",
    "Happiness can be found, even in the darkest of code, if one only remembers to refactor.",
    "Do not pity the dead, Harry. Pity the living, and, above all those who code without comments.",
    "I solemnly swear that I am up to no good... in my codebase.",
    "Wit beyond measure is man's greatest treasure... except for a well-organized Git repository.",
    "Just because you have the emotional range of a teaspoon doesn't mean we all have to write spaghetti code.",
    "The wand chooses the wizard, Harry... and the right framework chooses the developer.",
    "Turn to page 394... of the documentation.",
    "Mischief Managed... and all tests are passing!",
    "You're a wizard, Harry... I mean, a programmer.",
    "Nitwit! Blubber! Oddment! Tweak! Four essential steps in any code review.",
    "Every programmer remembers where they were when they wrote their first 'Hello, World!'",
}

local function get_random_quote()
    return quotes[math.random(#quotes)]
end

return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    
    dashboard.section.header.val = merlin_hat
    
    dashboard.section.buttons.val = {
      dashboard.button("SPC ff", "🔎 Find file", "<cmd>Telescope find_files hidden=true no_ignore=true<CR>"),
      dashboard.button("SPC wr", "⏳ Restore Session", "<cmd>SessionRestore<CR>"),
      dashboard.button("q", "🌙 Exit the Tower", "<cmd>qa<CR>"),
    }
    
    local function footer()
        return {
        get_random_quote()
      }
    end

    dashboard.section.footer.val = footer()
    
    alpha.setup(dashboard.opts)
    
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
