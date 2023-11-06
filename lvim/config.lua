reload("user.config")

vim.g.neotree_auto_cd = 0
lvim.builtin.nvimtree.active = false -- NOTE: using neo-tree

lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.lua", "*.php" }
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  {
    name = "pint",
    filetypes = { "php" },
  },
})
-- KEYBINDINGS --
lvim.keys.normal_mode["<leader>ss"] = { ":w!<cr>", noremap = true, silent = true }
lvim.keys.normal_mode["<leader>qa"] = { ":q!<cr>", noremap = true, silent = true }
lvim.keys.normal_mode["<Escape>"] = { ":noh<cr>", noremap = true, silent = true }

lvim.builtin.which_key.mappings['e'] = {}

lvim.keys.normal_mode["<leader>r"] = { ":NeoTreeReveal<cr>", noremap = true, silent = true }
lvim.keys.normal_mode["<leader>e"] = {
  function()
    require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
  end,
  noremap = true,
  silent = true
}

local function visual_paste_without_yank()
  vim.fn.setreg("x", vim.fn.getreg("*"))
  vim.api.nvim_paste(vim.fn.getreg("*"), false, -1)
  vim.fn.setreg("*", vim.fn.getreg("x"))
end

lvim.keys.visual_mode["p"] = { visual_paste_without_yank, noremap = true, silent = true }

-- delete doens't replace paste registry
lvim.keys.normal_mode["d"] = { '"_d', noremap = true, silent = true }
lvim.keys.visual_mode["d"] = { '"_d', noremap = true, silent = true }

lvim.keys.normal_mode["<leader><Right>"] =
{ ':exe "vertical resize " . (winwidth(0) * 2/3)<CR>', noremap = true, silent = true }
lvim.keys.normal_mode["<leader><Left>"] =
{ ':exe "vertical resize " . (winwidth(0) * 3/2)<CR>', noremap = true, silent = true }

lvim.keys.normal_mode["|"] = ":vsplit<CR>"
lvim.keys.normal_mode["-"] = ":split<CR>"

lvim.keys.normal_mode["L"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["H"] = ":BufferLineCyclePrev<CR>"


-- PLUGINS --

lvim.plugins = {
  { "lunarvim/colorschemes" },
  { "catppuccin/nvim" },
  { "sainnhe/gruvbox-material" },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  },
}

lvim.colorscheme = "gruvbox-material"
vim.opt.background = "light"
