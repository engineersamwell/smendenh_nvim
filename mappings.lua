-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<S-l>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer"
    },
    ["<S-h>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end, desc = "Previous buffer",
    },
    ["<leader>an"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>a"] = { name = "Actions" },
    -- *********************************
    -- Extending the lsp info
    -- *********************************

    -- Mimic lunarvim for a quick jump to next dianostic
    ["<leader>lj"] = {
      function() vim.diagnostic.goto_next({ noremap=true, silent=true}) end,
      desc = "Next Diagnostic"
    },
    ["<leader>lk"] = {
      function() vim.diagnostic.goto_prev({ noremap=true, silent=true}) end,
      desc = "Prev Diagnostic"
    },
    ["<leader>le"] = {
      function() vim.diagnostic.open_float({ noremap=true, silent=true}) end,
      desc = "Open Diagnostic"
    },
    -- https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/Recipes
    -- Neo-tree sometimes opens in buff or git vs filesystem, we always want it to open in filesystem
    -- ["<leader>e"] = {
    --   function() vim.api.nvim_exec('Neotree focus filesystem left', true) end,
    --   desc = "Open Neo-Tree FS"
    -- },

  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
