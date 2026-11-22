return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      open_mapping = [[<c-\>]],
      direction = "tab",
    },
    keys = { [[<c-\>]], ":Toggleterm<CR>" },
    cmd = "Toggleterm",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<c-t>]],
        direction = "float",
        shade_terminals = true,
      })
    end,
  },
  {
    "folke/snacks.nvim",
    opts = {
      terminal = {
        win = {
          position = "float",
        },
      },
      picker = {
        sources = {
          explorer = {
            layout = {
              layout = {
                width = 25,
              },
            },
          },
        },
        hidden = true,
        ignored = true
      }
    },
  },
}
