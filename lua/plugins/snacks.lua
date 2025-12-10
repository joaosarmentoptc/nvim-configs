-- ~/.config/nvim/lua/plugins/snacks.lua
return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      hidden = true,
      ignored = true,
    },
    dashboard = {
      formats = {
        key = function(item)
          return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
        end,
      },
      sections = {
        { section = "terminal", cmd = "fortune -s | cowsay", hl = "header", padding = 1, indent = 8 },
        -- { section = "header" },
        { icon = " ", title = "Bookmarks", padding = 1 },
        { section = "keys", indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", padding = 1 },
        { section = "recent_files", indent = 2, padding = 1 },
        { icon = " ", title = "Projects", padding = 1 },
        { section = "projects", indent = 2, padding = 1 },
        { section = "startup" },
      },
    },
  },
}
