return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  -- https://github.com/zbirenbaum/copilot.lua/discussions/99#discussioncomment-4483942
  -- DO NOT USE THIS github/copilot.vim, see the plugins/community.lua
  -- {
  --   "github/copilot.vim",
  --   event = "VeryLazy",
  --   autoStart = true,
  -- },
  -- {
  --   "Equilibris/nx.nvim",
  --   requires = {
  --     "nvim-telescope/telescope.nvim",
  --   },
  --   config = function() require("nx").setup {} end,
  -- },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function() require("todo-comments").setup() end,
  },
  -- {
  --   "jackMort/ChatGPT.nvim",
  --   event = "VeryLazy",
  --   config = function() require("chatgpt").setup() end,
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim",
  --   },
  -- },
  -- { "catppuccin/nvim", name = "catppuccin" }
  -- {
  --   "navarasu/onedark.nvim",
  --   config = function()
  --     require("onedark").setup {
  --       style = 'darker'
  --     }
  --   end,
  -- },
  -- I like the colors here but the contrast is very high, will take a lot to get used to it
  -- https://github.com/Shatur/neovim-ayu
  -- {
  --   'Shatur/neovim-ayu',
  --   config = function()
  --     require("ayu").setup {
  --       options = {
  --         -- theme 'ayu'
  --       }
  --     }
  --   end,
  -- },
  -- https://github.com/rebelot/kanagawa.nvim
  {
    "rebelot/kanagawa.nvim",
  },
  -- TODO: Try https://github.com/morhetz/gruvbox
  -- Consider People rave about https://github.com/rebelot/kanagawa.nvim
  -- Consider: https://github.com/nyoom-engineering/oxocarbon.nvim
  -- Consider: - https://github.com/srcery-colors/srcery-vim
  -- Consider https://github.com/whatyouhide/vim-gotham
  {
    "IndianBoy42/tree-sitter-just",
    config = function() require("tree-sitter-just").setup() end,
  },
  {
    "wuelnerdotexe/vim-astro",
    ft = "astro",
  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     --- other options
  --     servers = {
  --       tsserver = {
  --         on_attach = function(client)
  --           -- this is important, otherwise tsserver will format ts/js
  --           -- files which we *really* don't want.
  --           client.server_capabilities.documentFormattingProvider = false
  --         end,
  --       },
  --       biome = {},
  --       -- other language servers
  --     },
  --   },
  -- },
}
