return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "debugloop/telescope-undo.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      },
    },
    keys = {
      { "<leader><leader>", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<leader>u", "<cmd>Telescope undo<cr>", desc = "Undo" },
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<c-t>"] = function(...)
              return require("trouble.providers.telescope").open_with_trouble(...)
            end,
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        buffers = {
          previewer = false,
          ignore_current_buffer = true,
          sort_lastused = true,
        },
      },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension "fzf"
      require("telescope").load_extension "undo"
    end,
  },
}
