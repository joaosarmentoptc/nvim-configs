-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-Right>", "2<C-w>>")
vim.keymap.set("n", "<C-Left>", "2<C-w><")
vim.keymap.set("n", "<C-Up>", "2<C-w>+")
vim.keymap.set("n", "<C-Down>", "2<C-w>-")

vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume" }
)

-- move line up/down in normal mode
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")

-- move selected lines in visual mode
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- vim.keymap.set(
--   "n",
--   "<leader>cD",
--   require("snacks").dashboard.open,
--   { noremap = true, silent = true, desc = "Open Snacks Dashboard" }
-- )
--
vim.keymap.set("n", "<leader>cD", function()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].filetype == "snacks_dashboard" then
      return
    end
  end

  require("snacks").dashboard.open()
end, { noremap = true, silent = true, desc = "Open Snacks Dashboard" })

vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>")
