local formatters = {
  javascript = { "prettier" },
  javascriptreact = { "prettier" },
  typescript = { "prettier" },
  typescriptreact = { "prettier" },
  astro = { "prettier" },
  json = { "prettier" },
  jsonc = { "prettier" },
  html = { "prettier" },
  yaml = { "prettier" },
  css = { "stylelint", "prettier" },
  sh = { "shellcheck", "shfmt" },
  lua = { "stylua" },
}

return {
  {
    "liuchengxu/vista.vim",
    lazy = true,
    cmd = "Vista",
    cond = not vim.g.vscode,
    config = function()
      vim.g.vista_default_executive = "nvim_lsp"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    cond = not vim.g.vscode,
    dependencies = {
      -- Helpers to install LSPs and maintain them
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("nisi.plugins.lsp.config").setup()
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = {
        timeout_ms = 2000,
        lsp_fallback = false,
      },
      formatters_by_ft = formatters,
    },
  },

  {
    "folke/trouble.nvim",
    config = true,
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle<cr>" },
      { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>" },
      { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>" },
      { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>" },
      { "<leader>xl", "<cmd>TroubleToggle loclist<cr>" },
    },
  },
  {
    "vuki656/package-info.nvim",
    config = true,
  },
}
