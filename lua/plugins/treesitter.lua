return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      auto_install = true,
      -- ensure_installed = {"asm", "c", "cpp", "rust", "go", "python", "lua", "vim", "vimdoc", "heex", "javascript", "typescript", "html" },
      sync_install = false,
      highlight = {
        enable = true,
        disable = { "gitcommit" },
      },
      indent = { enable = true },
    })
  end,
}
