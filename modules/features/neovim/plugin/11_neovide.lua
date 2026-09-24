-- neovide settings
if vim.g.neovide then
  -- font
  vim.o.guifont = 'JetBrainsMono Nerd Font:h12'

  -- window animations
  vim.g.neovide_position_animation_length = 0

  -- scroll animations, etc
  vim.g.neovide_scroll_animation_length = 0.15
  vim.g.neovide_scroll_animation_far_lines = 2

  -- cursor animcations, etc
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_cursor_animate_command_line = true
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_smooth_blink = true
  vim.g.neovide_cursor_hack = true

  -- progress bar
  vim.g.neovide_progress_bar_enabled = true
  vim.g.neovide_progress_bar_height = 4.0
  vim.g.neovide_progress_bar_animation_speed = 200.0
  vim.g.neovide_progress_bar_hide_delay = 0.2

  -- padding
  vim.g.neovide_padding_top = 12
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 4
  vim.g.neovide_padding_left = 4

  -- profiler
  vim.g.neovide_profiler = false

  -- TODO: misc
  vim.g.neovide_theme = 'auto'
  vim.g.neovide_scale_factor = 1.0
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_confirm_quit = true
  vim.g.neovide_fullscreen = true
  vim.g.neovide_has_mouse_grid_detection = true
end
