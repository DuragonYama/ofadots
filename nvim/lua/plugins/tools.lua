local darkred = "#7a1a1a"
local dim     = "#222222"
local gray    = "#555555"
local fg      = "#d4d4d4"
local white   = "#ffffff"
local bg      = "#000000"

local claudedark_lualine = {
  normal   = { a = { fg = white, bg = darkred, gui = "bold" }, b = { fg = fg, bg = dim }, c = { fg = gray, bg = bg } },
  insert   = { a = { fg = white, bg = darkred, gui = "bold" }, b = { fg = fg, bg = dim }, c = { fg = gray, bg = bg } },
  visual   = { a = { fg = white, bg = darkred, gui = "bold" }, b = { fg = fg, bg = dim }, c = { fg = gray, bg = bg } },
  replace  = { a = { fg = white, bg = darkred, gui = "bold" }, b = { fg = fg, bg = dim }, c = { fg = gray, bg = bg } },
  command  = { a = { fg = white, bg = darkred, gui = "bold" }, b = { fg = fg, bg = dim }, c = { fg = gray, bg = bg } },
  inactive = { a = { fg = gray,  bg = bg },                    b = { fg = gray, bg = bg }, c = { fg = gray, bg = bg } },
}

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = { theme = claudedark_lualine },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {

      picker = {
        sources = {
          explorer = {
            jump = { close = true },
          },
        },
      },
    },
  },
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>y", "<cmd>Yazi<cr>", desc = "Open yazi" },
      { "-", "<cmd>Yazi<cr>", desc = "Open yazi" },
    },
    opts = {
      floating_window_scaling_factor = 1.0,
    },
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
    init = function()
      vim.g.lazygit_floating_window_scaling_factor = 1.0
    end,
  },
}
