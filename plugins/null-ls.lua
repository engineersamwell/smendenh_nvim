return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call

    local nls = require("null-ls").builtins

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {

      nls.formatting.rome.with { command = "biome" },

      -- 12/14/2023 This didn't work as expected
      -- nls.formatting.biome,
      -- -- or if you like to live dangerously like me:
      -- nls.formatting.biome.with {
      --   args = {
      --     "check",
      --     "--apply-unsafe",
      --     "--formatter-enabled=true",
      --     "--organize-imports-enabled=true",
      --     "--skip-errors",
      --     "$FILENAME",
      --   },
      -- },

      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.formatting.prettier,
      -- null_ls.builtins.formatting.ruff
      -- formatting
      -- null_ls.builtins.formatting.ruff
      -- format on save works without this
      -- null_ls.builtins.formatting.black,

      -- diagnostics
      -- null_ls.builtins.diagnostics.ruff,
    }
    return config -- return final config table
  end,
}
