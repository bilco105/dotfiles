return {
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "SmiteshP/nvim-navic",
    opts = {
      separator = " ",
      highlight = true,
      depth_limit = 5,
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "lukas-reineke/lsp-format.nvim",
      { "folke/neodev.nvim", config = true },
    },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      },
      format = {
        lua = {
          exclude = {
            "lua_ls",
          },
        },
        html = {
          exclude = {
            "html",
          },
        },
      },
      servers = {
        astro = {},
        cssls = {},
        emmet_ls = {},
        html = {},
        jsonls = {},
        lua_ls = {},
        tailwindcss = {},
        terraformls = {},
        tflint = {},
        tsserver = {},
        yamlls = {},
      },
    },
    config = function(_, opts)
      local mason = require "mason-lspconfig"

      -- Diagnostic configuration
      for name, icon in pairs(require("config.icons").diagnostics) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end
      vim.diagnostic.config(opts.diagnostics)

      -- LSP Attachment Configuration
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local buffer = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)

          require("lsp-format").on_attach(client)
          require("plugins.lsp.keymaps").on_attach(client, buffer)

          if client.server_capabilities.documentSymbolProvider then
            require("nvim-navic").attach(client, buffer)
          end
        end,
      })

      -- Formatting
      require("lsp-format").setup(opts.formatting)

      -- Mason
      mason.setup { ensure_installed = vim.tbl_keys(opts.servers) }
      mason.setup_handlers {
        function(server_name)
          require("lspconfig")[server_name].setup {
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
            settings = opts.servers[server_name],
          }
        end,
      }
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "jay-babu/mason-null-ls.nvim",
    },
    opts = {
      servers = {
        "black",
        "eslint",
        "flake8",
        "prettier",
        "stylua",
      },
    },
    config = function(_, opts)
      local mason = require "mason-null-ls"

      mason.setup {
        ensure_installed = opts.servers,
        automatic_setup = true,
      }

      mason.setup_handlers {}
    end,
  },
  { "j-hui/fidget.nvim", event = { "BufReadPre", "BufNewFile" }, config = true },
}
