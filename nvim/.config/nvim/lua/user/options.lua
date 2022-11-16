-- options
local options = {

    -- Spaces and TABs
    expandtab = true,       -- converts TABs to spaces
    smarttab = true,        -- TAB key will insert blanks according to other places in the file 
    autoindent = true,      -- Copy indent from current line when starting a new line
    tabstop = 4,            -- width of tabstop measured in spaces.
    shiftwidth = 4,         -- size of an indent. shiftwidth = tabstop
    softtabstop = 4,        -- sets the number of columns for a TAB

    -- Visual
    hlsearch = false,       -- search highlighting
    number = true,          -- set numbered lines
    relativenumber = true,  -- set relative numbered lines
    scrolloff = 8,
    termguicolors = true,   -- enables terminal gui colors

}

-- Sets options specified in 'options'
for key, value in pairs (options) do
    vim.opt[key] = value
end

-- Other options
vim.opt.formatoptions:remove { "c", "r", "o" }  -- disables auto comment insertion on new lines
