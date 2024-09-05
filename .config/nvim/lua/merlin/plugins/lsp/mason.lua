return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls",     -- Lua
        "pyright",    -- Python
        "gopls",      -- Go
        "dockerls",   -- Dockerfile
        "docker_compose_language_service", -- Docker Compose
        "bashls",     -- Bash
        "jsonls",     -- JSON
        "yamlls",     -- YAML
      },
      automatic_installation = true,
      automatic_uninstall = true,
    })
  end,
}
