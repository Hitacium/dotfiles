-- Line numbers
vim.opt.number = true -- Show line numbers

-- Tabs & indentation
vim.opt.tabstop = 2        -- Number of spaces a <Tab> counts for
vim.opt.softtabstop = 2    -- Number of spaces in editing operations
vim.opt.shiftwidth = 2     -- Indent width
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart auto-indenting on new lines
vim.opt.autoindent = true  -- Copy indent from current line

-- Search
vim.opt.ignorecase = true -- Ignore case in search
vim.opt.smartcase = true  -- Override ignorecase if search contains uppercase
vim.opt.hlsearch = false  -- Don't highlight all matches
vim.opt.incsearch = true  -- Show matches while typing

-- Appearance
vim.opt.termguicolors = true -- True color support
vim.opt.cursorline = true    -- Highlight the current line
vim.opt.signcolumn = "yes"   -- Always show sign column (for LSP, git, etc.)
vim.opt.wrap = false         -- Disable line wrapping

-- Splits
vim.opt.splitbelow = true -- Horizontal splits open below
vim.opt.splitright = true -- Vertical splits open to the right

-- Scrolling
vim.opt.scrolloff = 8 -- Keep cursor 8 lines from screen edge
vim.opt.sidescrolloff = 8

-- Clipboard
vim.opt.clipboard = "unnamedplus" -- Use system clipboard

-- Spelling
vim.opt.spell = false
vim.opt.spelllang = { "en_us", "fr" }

-- Undo & backup
vim.opt.undofile = true -- Persistent undo
vim.opt.swapfile = false
vim.opt.backup = false
