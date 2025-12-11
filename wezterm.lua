-- Pull in the wezterm API
local wezterm = require 'wezterm'

local mux = wezterm.mux

local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- font info
config.font = wezterm.font('FiraCode Nerd Font Mono')
config.font_size = 14

-- color scheme
config.color_scheme = 'OneHalfDark'
config.window_background_opacity = 1
config.text_background_opacity = 1

-- framerate
config.max_fps = 120

-- launch size
config.initial_cols = 100
config.initial_rows = 40

-- window settings
config.window_decorations = "RESIZE"

config.window_padding = {
  left = 2,
  right =2,
  top = 2,
  bottom = 2,
}

-- tab bar
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

-- Leader key
config.leader = { key = 'Space', mods = 'CTRL|META', timeout_milliseconds = 1000 }

-- Key bindings
config.keys = {
    -- key combos to ignore
  {
    key = 'm',
    mods = 'SUPER',
    action = wezterm.action.DisableDefaultAssignment,
  },

  {
    key = 'Enter',
    mods = 'META',
    action = wezterm.action.DisableDefaultAssignment,
  },

  -- Tab management
  {
    key = 't',
    mods = 'META',
    action = act.SpawnTab('DefaultDomain'),
  },
  {
    key = 'w',
    mods = 'META',
    action = act.CloseCurrentPane({ confirm = false }),
  },

  -- Tab navigation 
  {
    key = 'h',
    mods = 'META|SHIFT',
    action = act.ActivateTabRelative(-1),
  },
  {
    key = 'l',
    mods = 'META|SHIFT',
    action = act.ActivateTabRelative(1),
  },

  -- Pane splitting 
  {
    key = 'v',
    mods = 'LEADER',
    action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
  },
  {
    key = 's',
    mods = 'LEADER',
    action = act.SplitVertical({ domain = 'CurrentPaneDomain' }),
  },

  -- Pane navigation 
  {
    key = 'h',
    mods = 'CTRL|META',
    action = act.ActivatePaneDirection('Left'),
  },
  {
    key = 'j',
    mods = 'CTRL|META',
    action = act.ActivatePaneDirection('Down'),
  },
  {
    key = 'k',
    mods = 'CTRL|META',
    action = act.ActivatePaneDirection('Up'),
  },
  {
    key = 'l',
    mods = 'CTRL|META',
    action = act.ActivatePaneDirection('Right'),
  },

  -- Command palette
  {
    key = 'p',
    mods = 'LEADER',
    action = act.ActivateCommandPalette,
  },

  -- Workspaces
  -- Show launcher with workspaces
  {
    key = 'w',
    mods = 'LEADER',
    action = act.ShowLauncherArgs({ flags = 'FUZZY|WORKSPACES' }),
  },
  -- Prompt for workspace name and switch to it
  {
    key = 'W',
    mods = 'LEADER|SHIFT',
    action = act.PromptInputLine({
      description = wezterm.format({
        { Attribute = { Intensity = 'Bold' } },
        { Foreground = { Color = '#7DCFB6' } },
        { Text = 'Enter name for new workspace' },
      }),
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:perform_action(
            act.SwitchToWorkspace({ name = line }),
            pane
          )
        end
      end),
    }),
  },
  -- Switch to next/previous workspace
  {
    key = 'n',
    mods = 'LEADER',
    action = act.SwitchWorkspaceRelative(1),
  },
  {
    key = 'N',
    mods = 'LEADER|SHIFT',
    action = act.SwitchWorkspaceRelative(-1),
  },

}


-- default shell
config.default_prog = {'powershell.exe'}

-- misc
-- local mouse_bindings = {}
-- local launch_menue = {}
-- config.background = { }


local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup({
  options = {
    icons_enabled = true,
    theme = 'OneHalfDark',
    tabs_enabled = true,
    theme_overrides = {
      normal_mode = {
      },
      copy_mode = {
      },
      search_mode = {
      },
      tab = {
      }
    },
    section_separators = {
      left = wezterm.nerdfonts.ple_right_half_circle_thick,
      right = wezterm.nerdfonts.ple_left_half_circle_thick,
    },
    component_separators = {
      left = wezterm.nerdfonts.ple_right_half_circle_thin,
      right = wezterm.nerdfonts.ple_left_half_circle_thin,
    },
    tab_separators = {
      left = wezterm.nerdfonts.pl_left_hard_divider,
      right = wezterm.nerdfonts.pl_right_hard_divider,
    },
  },
  sections = {
    tabline_a = { 'mode' },
    tabline_b = { 'workspace' },
    tabline_c = { ' ' },
    tab_active = {
      'index',
      { 'parent', padding = 0 },
      '/',
      { 'cwd', padding = { left = 0, right = 1 } },
      { 'zoomed', padding = 0 },
    },
    tab_inactive = { 'index', { 'process', padding = { left = 0, right = 1 } } },
    tabline_x = { 'ram', 'cpu' },
    tabline_y = { 'datetime', 'battery' },
    tabline_z = { 'domain' },
  },
  extensions = {},
})

-- Workspace init plugin
local wsinit = wezterm.plugin.require("https://github.com/JuanraCM/wsinit.wezterm")

wsinit.setup({
  workspaces_dir = "C:\\Users\\awodzins\\.config\\wezterm\\workspaces",
  init_workspace_keys = {
    key = "i",
    mods = "LEADER",
  },
})

wsinit.apply_to_config(config)

return config
