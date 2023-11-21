-- local util = require('lspconfig.util');

return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },
  -- Set colorscheme to use
  -- colorscheme = "astrodark",
  -- colorscheme = "catppuccin",
  -- colorscheme = "onedark",
  -- I kinda like this one, but the contrast is pretty high so not 100% sure yet
  -- https://github.com/Shatur/neovim-ayu
  -- colorscheme = "ayu",
  -- https://github.com/rebelot/kanagawa.nvim
  colorscheme = "kanagawa",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- Not only did this section not work but I prefer how it's done in mason.lua
      -- filter = function(client)
      --   -- Disable prettier for javascript files in favor of Rome
      --   if (client.name == "prettier" or client.name == "prettierd") and (vim.bo.filetype == "javascript" or vim.bo.filetype == "typescript") then
      --     return false
      --   end
      --
      --   -- enable all other clients
      --   return true
      -- end,
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
          -- "python",
          -- "html",
          -- "typescript",
          -- "javascript",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "prettier",
        -- "prettierd",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    -- servers = {
    --   "pyright"
    -- },
    config = {
      -- pyright = {
      --
      -- }
      rome = {
        -- root_dir = util.root_pattern("rome.json")
      },
    },
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Custom
    -- :verbose set formatoptions?
    -- formatoptions=jcroql
    -- Last set from /opt/homebrew/Cellar/neovim/0.8.3/share/nvim/runtime/ftplugin/lua.vim line 18
    -- vim.o.formatoptions = vim.o.formatoptions:gsub("c", "");
    -- vim.o.formatoptions = vim.o.formatoptions:gsub("r", "");
    -- vim.opt.formatoptions:remove "c"
    -- vim.opt.formatoptions:remove "r"
    -- vim.opt.formatoptions:remove "o"
    -- vim.opt_local.formatoptions:remove { "c", "r", "o" }
    -- set formatoptions-=cro

    -- https://github.com/AstroNvim/AstroNvim/issues/1593
    vim.api.nvim_create_autocmd("Filetype", {
      pattern = "*",
      command = [[set fo-=c fo-=r fo-=o]],
    })

    -- vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    -- vim.api.nvim_set_keymap("i", "<C-H>", 'copilot#Previous()', { silent = true, expr = true })
    -- vim.api.nvim_set_keymap("i", "<C-K>", 'copilot#Next()', { silent = true, expr = true })

    -- Make sure the just tree sitter is installed
    require("nvim-treesitter.parsers").get_parser_configs().just = {
      install_info = {
        url = "https://github.com/IndianBoy42/tree-sitter-just", -- local path or git repo
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main",
        use_makefile = true, -- this may be necessary on MacOS (try if you see compiler errors)
      },
      maintainers = { "@IndianBoy42" },
    }

    -- Enable list mode (display special characters)
    vim.opt.list = true

    -- Customize listchars
    -- set listchars=space:·,tab:->\
    vim.opt.listchars = {
      tab = "▸ ", -- Tab character
      trail = "·", -- Trailing whitespace
      extends = ">", -- Show in folded lines
      precedes = "<", -- Show in folded lines
      nbsp = "␣", -- Non-breaking space
    }

    -- Set up custom filetypes
    vim.filetype.add {
      -- extension = {
      --   foo = "fooscript",
      -- },
      filename = {
        ["justfile"] = "make",
        ["Jenkinsfile"] = "groovy",
        ["astro"] = "astro",
      },
      -- pattern = {
      --   ["~/%.config/foo/.*"] = "fooscript",
      -- },
    }
  end,
}
