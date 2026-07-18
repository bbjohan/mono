local M = {}

local c = {
  none = "NONE",
  
  -- La tua nuova palette
  bg = "#0F0F0F",           -- Sfondo Primario
  bg_alt = "#161616",       -- Superfici / Barre
  ui_details = "#494949",   -- Dettagli UI
  fg_secondary = "#5A5A5A", -- Testo Secondario / Commenti
  fg = "#D1D1D1",           -- Testo Primario / Accento

  -- Colori di fallback/utility per funzionalità specifiche (es. Diff, Spell)
  blue_rudy = "#87afd7",
  blue_picton = "#00afff",
  blue_france = "#0087d7",
  green_light_sea = "#00afaf",
  green_kelly = "#00af00",
  aquamarine = "#00ffaf",
  mauve_french = "#d787d7",
  orange_web = "#ffaf00",
  pink_ultra = "#ff5fff",
  rose_dogwood = "#d7005f",
  red_indian = "#d75f5f",
  red_folly = "#ff005f",
}

function M.highlight(group, color)
  if color.link then
    vim.api.nvim_command("highlight! link " .. group .. " " .. color.link)
  else
    local style = color.style and "gui=" .. color.style or color.preserve and "" or " gui=NONE cterm=NONE"
    local fg = color.fg and "guifg=" .. color.fg or color.preserve and "" or "guifg=NONE ctermfg=NONE"
    local bg = color.bg and "guibg=" .. color.bg or color.preserve and "" or "guibg=NONE ctermbg=NONE"
    local sp = color.sp and "guisp=" .. color.sp or color.preserve and "" or "guisp=NONE"
    vim.api.nvim_command("highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp)
  end
end

local default_fg_bg = { fg = c.fg, bg = c.bg }

-- LuaFormatter off
local groups = {
  Normal = default_fg_bg,
  -- stylua: ignore start
  ColorColumn =    { fg = c.none,            bg = c.bg_alt },
  Conceal =        { fg = c.none,            bg = c.none },
  CurSearch =      { fg = c.bg,              bg = c.fg },
  Cursor =         { fg = c.none,            bg = c.none,           style = "reverse" },
  CursorColumn =   { fg = c.none,            bg = c.bg_alt },
  CursorLine =     { fg = c.none,            bg = c.bg_alt },
  CursorLineNr =   { fg = c.fg,              bg = c.bg_alt },

  DiffAdd =        { fg = c.green_kelly,      bg = c.bg_alt,        style = "reverse" },
  DiffChange =     { fg = c.blue_rudy,       bg = c.bg_alt,        style = "reverse" },
  DiffDelete =     { fg = c.red_indian,      bg = c.bg_alt,        style = "reverse" },
  DiffText =       { fg = c.mauve_french,    bg = c.bg_alt,        style = "reverse" },
  SpellBad =       { fg = c.rose_dogwood,    bg = c.none,          sp = c.rose_dogwood,    style = "undercurl" },
  SpellCap =       { fg = c.blue_france,     bg = c.none,          sp = c.blue_france,     style = "undercurl" },
  SpellLocal =     { fg = c.mauve_french,    bg = c.none,          sp = c.mauve_french,    style = "undercurl" },
  SpellRare =      { fg = c.green_light_sea, bg = c.none,          sp = c.green_light_sea, style = "undercurl" },

  Directory =      { fg = c.fg,              bg = c.none },
  EndOfBuffer =    { fg = c.ui_details,      bg = c.none },
  ErrorMsg =       { fg = c.fg,              bg = c.bg_alt,        style = "reverse" },
  FoldColumn =     { fg = c.fg_secondary,    bg = c.none },
  Folded =         { fg = c.fg_secondary,    bg = c.bg_alt },
  IncSearch =      { fg = c.bg,              bg = c.fg },
  LineNr =         { fg = c.ui_details,      bg = c.none },
  MatchParen =     { fg = c.bg,              bg = c.fg,            style = "bold" },
  ModeMsg =        { fg = c.fg,              bg = c.none },
  MoreMsg =        { fg = c.fg,              bg = c.none },
  NonText =        { fg = c.ui_details,      bg = c.none },

  NormalFloat =    { fg = c.fg,              bg = c.bg_alt },
  FloatBorder =    { fg = c.ui_details,      bg = c.bg_alt },

  Pmenu =          { fg = c.fg,              bg = c.bg_alt },
  PmenuExtra =     { fg = c.fg_secondary,    bg = c.bg_alt },
  PmenuKind =      { fg = c.fg,              bg = c.bg_alt,        style = "bold" },
  PmenuSbar =      { fg = c.none,            bg = c.ui_details },
  PmenuSel =       { fg = c.bg,              bg = c.fg },
  PmenuExtraSel =  { fg = c.bg,              bg = c.fg },
  PmenuKindSel =   { fg = c.bg,              bg = c.fg },
  PmenuThumb =     { fg = c.none,            bg = c.fg_secondary },

  Question =       { fg = c.fg,              bg = c.none },
  QuickFixLine =   { fg = c.bg,              bg = c.fg },
  Search =         { fg = c.bg,              bg = c.fg },
  SignColumn =     { fg = c.fg,              bg = c.none },
  SpecialKey =     { fg = c.ui_details,      bg = c.none,          style = "bold" },

  Comment =        { fg = c.fg_secondary,    bg = c.none },
  Constant =       { fg = c.fg,              bg = c.none },
  CursorIM =       { fg = c.bg_alt,          bg = c.fg },
  Error =          { fg = c.red_folly,       bg = c.bg_alt,        style = "bold" },
  Identifier =     { fg = c.fg,              bg = c.none },
  Ignore =         { fg = c.fg,              bg = c.none },
  PreProc =        { fg = c.fg,              bg = c.none },
  Special =        { fg = c.fg,              bg = c.none },
  Statement =      { fg = c.fg,              bg = c.none },
  StatusLine =     { fg = c.fg,              bg = c.bg_alt,        style = "bold" },
  StatusLineNC =   { fg = c.fg_secondary,    bg = c.bg_alt },
  TabLine =        { fg = c.fg_secondary,    bg = c.bg_alt },
  TabLineFill =    { fg = c.none,            bg = c.bg_alt },
  TabLineSel =     { fg = c.bg,              bg = c.fg },
  Title =          { fg = c.none,            bg = c.none },
  Todo =           { fg = c.fg,              bg = c.none,          style = "bold" },
  ToolbarButton =  { fg = c.fg,              bg = c.bg_alt,        style = "bold" },
  ToolbarLine =    { fg = c.none,            bg = c.bg_alt },
  Type =           { fg = c.fg,              bg = c.none },
  Underlined =     { fg = c.fg,              bg = c.none },
  VertSplit =      { fg = c.ui_details,      bg = c.bg_alt },
  Visual =         { fg = c.none,            bg = c.ui_details },
  VisualNOS =      { fg = c.none,            bg = c.ui_details },
  WarningMsg =     { fg = c.orange_web,      bg = c.none },
  WildMenu =       { fg = c.bg,              bg = c.fg,            style = "bold" },
  -- stylua: ignore end

  -- =========================================================================
  -- File Tree Integrations (NvimTree & NeoTree)
  -- =========================================================================
  NvimTreeNormal = { fg = c.fg, bg = c.bg_alt },
  NvimTreeNormalNC = { fg = c.fg, bg = c.bg_alt },
  NvimTreeEndOfBuffer = { fg = c.ui_details, bg = c.bg_alt },
  NvimTreeSignColumn = { fg = c.fg, bg = c.bg_alt },
  NvimTreeWinSeparator = { fg = c.ui_details, bg = c.bg_alt },
  
  NeoTreeNormal = { fg = c.fg, bg = c.bg_alt },
  NeoTreeNormalNC = { fg = c.fg, bg = c.bg_alt },
  NeoTreeEndOfBuffer = { fg = c.ui_details, bg = c.bg_alt },
  NeoTreeSignColumn = { fg = c.fg, bg = c.bg_alt },
  NeoTreeWinSeparator = { fg = c.ui_details, bg = c.bg_alt },
  -- =========================================================================

  Terminal = { fg = c.fg, bg = c.bg },

  StatusLineTerm = { link = "StatusLine" },
  StatusLineTermNC = { link = "StatusLineNC" },
  MessageWindow = { link = "Pmenu" },
  PopupNotification = { link = "Todo" },
  Boolean = { link = "Constant" },
  Character = { link = "Constant" },
  Conditional = { link = "Statement" },
  Define = { link = "PreProc" },
  Debug = { link = "Special" },
  Delimiter = { link = "Special" },
  Exception = { link = "Statement" },
  Float = { link = "Constant" },
  Function = { link = "Identifier" },
  Include = { link = "PreProc" },
  Keyword = { link = "Statement" },
  Label = { link = "Statement" },
  Macro = { link = "PreProc" },
  Number = { link = "Constant" },
  Operator = { link = "Statement" },
  PreCondit = { link = "PreProc" },
  Repeat = { link = "Statement" },
  SpecialChar = { link = "Special" },
  SpecialComment = { link = "Special" },
  StorageClass = { link = "Type" },
  String = { link = "Constant" },
  Structure = { link = "Type" },
  Tag = { link = "Special" },
  Typedef = { link = "Type" },
  lCursor = { link = "Cursor" },
  debugBreakpoint = { link = "ModeMsg" },
  debugPC = { link = "CursorLine" },
}
-- LuaFormatter on

M.groups = groups
M.colors = c

function M.setup(opts)
  M.colorscheme()
end

function M.colorscheme()
  vim.api.nvim_command("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.api.nvim_command("syntax reset")
  end
  vim.o.termguicolors = true
  vim.g.colors_name = "quiet2"
  for group, color in pairs(M.groups) do
    M.highlight(group, color)
  end
end

return M
