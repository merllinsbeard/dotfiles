-- lazy.nvim
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  version = "v4.4.7",
  opts = {
    notify = {
      setup = {
        enabled = false,
      },
    },
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
      },
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    }
}
