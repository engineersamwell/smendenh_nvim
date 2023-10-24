return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- { import = "astrocommunity.colorscheme.catppuccin" },
  -- https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/completion/copilot-lua-cmp/init.lua
  -- Tested this on 10/24/2023 and it works great
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
}
