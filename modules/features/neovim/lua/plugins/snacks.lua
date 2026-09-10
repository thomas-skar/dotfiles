vim.pack.add { 'https://github.com/folke/snacks.nvim' }

require('snacks').setup {
  explorer = {
    enabled = true,
    replace_netrw = true,
    trash = true,
  },
  indent = {
    enabled = true,
  },
  scroll = {
    enabled = true,
  },
  picker = {
    focus = 'input',
    actions = {
      file_picker = function()
        --@diagnostic disable-next-line
        Snacks.picker.files()
      end,
    },
    sources = {
      -- file explorer (tree)
      explorer = {
        finder = 'explorer',
        tree = true,
        watch = true,
        follow_file = true,
        auto_close = false,
        layout = { preset = 'sidebar', preview = 'main' },
        win = {
          input = {
            keys = {
              -- don't close explorer with <Esc>
              ['<Esc>'] = { '', mode = 'n' },
              -- open file picker with <Ctrl-P>
              ['<C-p>'] = { 'file_picker' },
            },
          },
          list = {
            keys = {
              -- don't close explorer with <Esc>
              ['<Esc>'] = { '', mode = 'n' },
              -- open file picker with <Ctrl-P>
              ['<C-p>'] = { 'file_picker' },
            },
          },
        },
      },
      -- file picker (telescope)
      files = {
        hidden = true,
        layout = { preset = 'telescope' },
        win = {
          input = {
            keys = {
              -- close window with <Esc>
              ['<Esc>'] = { 'close', mode = 'i' },
            },
          },
        },
      },
      -- find in files
      grep = {
        layout = { preset = 'telescope' },
      },
      -- help picker
      help = {
        layout = { preset = 'telescope' },
      },
    },
  },
}
