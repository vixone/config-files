require("neo-tree").setup({
  close_if_last_window = false,
  window = {
    width = 30,
  },
  buffers = {
    follow_current_file = { enabled = false },
  },
  filesystem = {
    bind_to_cwd = false,
    follow_current_file = { enabled = true },
    use_libuv_file_watcher = true,
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
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
