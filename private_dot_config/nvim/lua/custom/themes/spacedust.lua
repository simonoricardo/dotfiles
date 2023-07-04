-- Dark green	#008080	Typedef
-- Light green	#4A9D8F	Strings, numbers, value types
-- Dark orange	#E35B00	Class, interface, protocol, module name
-- Light orange	#CB7636	Properties
-- Dark blue	#09699D	Macros
-- Light blue	#009FC5	Function and method names
-- Dark yellow	#EBC562	Keywords
-- Light yellow	#ECF0C1	Default foreground
-- Brown	#6E5346	Comments
-- Light Brown	#CA763C	Variables and consts
--	#041E23	Background
--	#0F2930	Gutter background
--	#244F61	Line number
--	#0F2930	Active row background
--	#06496F	Selection background

-- base00 - Default Background
-- base01 - Lighter Background (Used for status bars, line number and folding marks)
-- base02 - Selection Background
-- base03 - Comments, Invisibles, Line Highlighting
-- base04 - Dark Foreground (Used for status bars)
-- base05 - Default Foreground, Caret, Delimiters, Operators
-- base06 - Light Foreground (Not often used)
-- base07 - Light Background (Not often used)
-- base08 - Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
-- base09 - Integers, Boolean, Constants, XML Attributes, Markup Link Url
-- base0A - Classes, Markup Bold, Search Text Background
-- base0B - Strings, Inherited Class, Markup Code, Diff Inserted
-- base0C - Support, Regular Expressions, Escape Characters, Markup Quotes
-- base0D - Functions, Methods, Attribute IDs, Headings
-- base0E - Keywords, Storage, Selector, Markup Italic, Diff Changed
-- base0F - Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>

local M = {}

M.base_30 = {
  white = "#ECF0C1",
  darker_black = "#0A1E23", -- secondary bg
  black = "#0F2930", --  nvim bg
  black2 = "#1F3940", -- telescope header, tree selection
  one_bg = "#0A1E23",
  one_bg2 = "#0F2930",
  one_bg3 = "#1F3940",
  grey = "#33363c",
  grey_fg = "#49494f", -- comments
  grey_fg2 = "#f0df8a",
  light_grey = "#A9A9Af",
  red = "#E35B00",
  baby_pink = "#ff9445",
  pink = "#E35B00",
  line = "#1c3045", -- for lines like vertsplit
  green = "#AAD84C",
  vibrant_green = "#b9e75b",
  blue = "#009FC5",
  nord_blue = "#09699D",
  yellow = "#EBC562",
  sun = "#f0df8a",
  purple = "#c79bf4",
  dark_purple = "#A37ACC",
  teal = "#74c5aa",
  orange = "#E35B00",
  cyan = "#95E6CB",
  statusline_bg = "#1c3045",
  lightbg = "#0F2930",
  pmenu_bg = "#ff9445",
  folder_bg = "#98a3af",
}

M.base_16 = {
  base00 = "#0A1E23",
  base01 = "#0F2930",
  base02 = "#06496F",
  base03 = "#6E5346",
  base04 = "#E6E1CF",
  base05 = "#ECF0C1",
  base06 = "#E6E1CF",
  base07 = "#E6E1CF",
  base08 = "#CA763C", -- not sure here for base09
  base09 = "#4A9D8F",
  base0A = "#E35B00",
  base0B = "#4A9D8F", -- same as base09? shouldn't be
  base0C = "#09699D",
  base0D = "#009FC5",
  base0E = "#EBC562",
  base0F = "#008080",
}

M.polish_hl = {
  luaTSField = { fg = M.base_16.base0D },
  ["@tag.delimiter"] = { fg = M.base_30.cyan },
  ["@function"] = { fg = M.base_30.orange },
  ["@parameter"] = { fg = M.base_16.base0F },
  ["@constructor"] = { fg = M.base_16.base0A },
  ["@tag.attribute"] = { fg = M.base_30.orange },
}

M = require("base46").override_theme(M, "spacedust")

M.type = "dark"

return M
