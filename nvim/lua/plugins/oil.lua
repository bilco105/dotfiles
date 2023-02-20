return {
  {
    "stevearc/oil.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = true,
    event = "Syntax",
    keys = {
      {
        "-",
        function()
          require("oil").open()
        end,
        desc = "Document Diagnostics (Trouble)",
      },
    },
  },
}
