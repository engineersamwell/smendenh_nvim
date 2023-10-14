-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      -- ensure_installed = { "lua_ls" },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      -- ensure_installed = { "prettier", "stylua" },
      debug = true,
      -- I don't love this way of disabling prettier as it means prettier could still be enabled
      -- if the user has a prettier config.  Ultimately we only want to disable it for specific files
      -- not globally.
      handlers = {
        -- for prettier
        prettier = function()
          require("null-ls").register(require("null-ls").builtins.formatting.prettier.with {
            disabled_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
            -- condition = function(utils)
            --   -- Ensure prettier is disabled as we want to use Rome
            --   -- return utils.root_has_file "package.json"
            --   return utils.root_has_file ".prettierrc"
            --     or utils.root_has_file ".prettierrc.json"
            --     or utils.root_has_file ".prettierrc.js"
            -- end,
          })
        end,
        -- for prettierd
        prettierd = function()
          require("null-ls").register(require("null-ls").builtins.formatting.prettierd.with {
            disabled_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
            -- condition = function(utils)
            --   -- Ensure prettier is disabled as we want to use Rome
            --   -- return utils.root_has_file "package.json"
            --   return utils.root_has_file ".prettierrc"
            --     or utils.root_has_file ".prettierrc.json"
            --     or utils.root_has_file ".prettierrc.js"
            -- end,
          })
        end,
        -- For eslint_d:
        eslint_d = function()
          require("null-ls").register(require("null-ls").builtins.diagnostics.eslint_d.with {
            disabled_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
            -- condition = function(utils)
            --   -- Ensure prettier is disabled as we want to use Rome
            --   -- return false
            --   -- return utils.root_has_file "package.json"
            --   return utils.root_has_file ".eslintrc.json"
            --     or utils.root_has_file ".eslintrc.js"
            -- end,
          })
        end,
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      -- ensure_installed = { "python" },
    },
  },
}
