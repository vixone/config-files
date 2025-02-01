reload("user.config")

vim.g.neotree_auto_cd = 0
lvim.builtin.nvimtree.active = false -- NOTE: using neo-tree

lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.lua", "*.php", "*.js", "*.jsx", "*.ts", "*.tsx", "*.vue" }
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  {
    name = "pint",
    filetypes = { "php" },
  },
  {
    name = "eslint",
    filetypes = { "*.vue", "*.js", "*.jsx", "*.ts", "*.tsx" },
  },
})
-- KEYBINDINGS --
lvim.keys.normal_mode["<leader>ss"] = { ":w!<cr>", noremap = true, silent = true }
lvim.keys.normal_mode["<leader>qa"] = { ":q!<cr>", noremap = true, silent = true }
lvim.keys.normal_mode["<Escape>"] = { ":noh<cr>", noremap = true, silent = true }

lvim.builtin.which_key.mappings['e'] = {}

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
  { "christoomey/vim-tmux-navigator", lazy = false },
  { "lunarvim/colorschemes" },
  { "nvim-pack/nvim-spectre" },
  { "catppuccin/nvim" },
  { "sainnhe/gruvbox-material" },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup({
        suggestion = { enabled = false },
        panel = { enabled = false }
      })
    end
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    config = function()
      require("neo-tree").setup({
        close_if_last_window = false,
        window = {
          width = 30,
        },
        buffers = {
          follow_current_file = {
            enabled = true,
            leave_dirs_open = true,
          },
        },
        filesystem = {
          bind_to_cwd = false,
          follow_current_file = { enabled = true },
          use_libuv_file_watcher = true,
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = true,
            hide_by_name = {
              "node_modules",
            },
            never_show = {
              ".DS_Store",
              "thumbs.db",
            },
          },
        },
      })
    end,
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  },
}
-- Below config is required to prevent copilot overriding Tab with a suggestion
-- when you're just trying to indent!
local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end
local on_tab = vim.schedule_wrap(function(fallback)
  local cmp = require("cmp")
  if cmp.visible() and has_words_before() then
    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
  else
    fallback()
  end
end)
lvim.builtin.cmp.mapping["<Tab>"] = on_tab

lvim.keys.normal_mode["<leader>r"] = { ":NeoTreeReveal<cr>", noremap = true, silent = true }

lvim.colorscheme = "catppuccin"
vim.opt.background = "dark"
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 15
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50

vim.opt.cursorline = true

-- Define autocmd to disable cursorline in insert mode
vim.cmd([[
  au InsertEnter * set nocursorline
  au InsertLeave * set cursorline
]])

-- clang formatter style set --
vim.cmd([[autocmd FileType cpp,c,h setlocal formatprg=clang-format\ --style=Google]])

-- Disable virtual text diagnostics
vim.diagnostic.config({ virtual_text = false, signcolumn = true })

-- Next line comment continues
vim.cmd("autocmd Filetype * setlocal formatoptions-=ro")
