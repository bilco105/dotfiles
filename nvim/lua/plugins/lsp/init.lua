return {
  {
    "williamboman/mason.nvim",
    config = true,
    command = ":Mason",
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
        eslint = {},
        graphql = {},
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

      -- Formatting
      require("lsp-format").setup(opts.formatting)

      -- LSP Attachment Configuration
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local buffer = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)

          require("lsp-format").on_attach(client)
          require("plugins.lsp.keymaps").on_attach(client, buffer)
        end,
      })

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
    config = function()
      local null_ls = require "null-ls"

      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettierd.with {
            extra_filetypes = { "astro" },
          },
        },
      }

      require("mason-null-ls").setup {
        ensure_installed = nil,
        automatic_installation = true,
        automatic_setup = false,
      }
    end,
  },
  { "j-hui/fidget.nvim", event = { "BufReadPre", "BufNewFile" }, config = true },
}
