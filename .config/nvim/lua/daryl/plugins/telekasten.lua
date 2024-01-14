-- Telekasten configuration
-- Need telescope and plenary
local home = vim.fn.expand("~/Documents/tk")
require("telekasten").setup({
  home = home,
  take_over_my_home = true,
  auto_set_filetype = true,

  -- dir names for special notes (absolute path or subdir name)
  dailies = home .. "/" .. "dailies",
  weeklies = home .. "/" .. "weeklies",
  templates = home .. "/" .. "templates",

  -- image (sub)dir for pasting
  image_subdir = "img",

  -- markdown file extension
  extension = ".md",

  -- following a link to a non-existing note will create it
  follow_creates_nonexisting = true,
  dailies_create_nonexisting = true,
  weeklies_create_nonexisting = true,

  -- template for new notes (new_note, follow_link)
  template_new_note = home .. "/" .. "templates/new_note.md",
  template_new_daily = home .. "/" .. "templates/daily.md",
  template_new_weekly = home .. "/" .. "templates/weekly.md",

  -- image link style, wiki:v![[image name]], markdown: ![](image_subdir/xxxxx.png)
  image_link_style = "markdown",

  -- integrate with calendar-vim
  plug_into_calendar = true,
  calendar_opts = {
    -- calendar week display mode: 1 .. 'WK01', 2 .. 'WK 1', 3 .. 'KW01', 4 .. 'KW 1', 5 .. '1'
    weeknm = 2,
    -- use monday as first day of week: 1 .. true, 0 .. false
    calendar_monday = 4,
    -- calendar mark: where to put mark for marked days: 'left', 'right', 'left-fit'
    calendar_mark = "left-fit",
  },
  -- telescope actions behavior
  close_after_yanking = false,
  insert_after_inserting = true,
  -- tag notation: '#tag', ':tag:', 'yaml-bare'
  tag_notation = "#tag",

  command_palette_theme = "dropdown",
  show_tags_theme = "dropdown",
  subdirs_in_links = false,
  template_handling = "smart",
  new_note_location = "smart",
  -- should all links be updated when a file is renamed
  rename_update_links = true,
})
