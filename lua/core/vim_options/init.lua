vim.o.termguicolors = true
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'
vim.o.background = 'dark'
vim.o.autoindent = true
vim.o.autoread = true
vim.o.autowrite = true
vim.o.autowriteall = true
vim.o.backup = false
vim.o.breakindent = false
vim.o.cindent = true
vim.o.clipboard = 'unnamedplus'
vim.o.cmdheight = 1
vim.o.completeopt = 'preview,menuone,longest'
vim.o.conceallevel = 0
vim.o.copyindent = true
vim.o.cursorcolumn = false
vim.o.cursorline = false
vim.o.encoding = 'UTF-8'
vim.o.expandtab = true
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevelstart = 94
vim.o.foldmethod = "expr"
vim.o.foldminlines = 1
vim.o.grepprg = "rg -i -n -w --vimgrep $*"
vim.o.hidden = true
vim.o.history = 500
vim.o.hlsearch = true
vim.o.inccommand = 'nosplit'
vim.o.incsearch = true
vim.o.joinspaces = false
vim.o.laststatus = 2
vim.o.linespace = 0
vim.o.list = true
vim.o.modeline = true
vim.o.modelines = 3
vim.o.mousescroll = "ver:1,hor:3"
vim.o.number = true
vim.o.relativenumber = false
vim.o.scrolloff = 5
vim.o.shiftround = true
vim.o.showcmd = true
vim.o.showmatch = true
vim.o.showmode = false
vim.o.sidescroll = 5
vim.o.sidescrolloff = 4
vim.o.signcolumn = 'auto'
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.timeoutlen = 300
vim.o.title = true
vim.o.ttimeout = true
vim.o.undofile = true
vim.o.updatetime = 250
vim.o.visualbell = false
vim.o.wildmenu = true
vim.o.wildmode = 'full'
vim.o.syntax = 'off'
vim.o.wrap = false
vim.o.writebackup = false
vim.opt.fillchars = { stlnc = ' ', vert = '┃', fold = '-', diff = '-' }
vim.opt.listchars = { tab = '◁∙▷', trail = '∙', precedes = '<', extends = '>' }
vim.o.path = '.,**/*,,'
vim.opt.shortmess:append { c = true, S = false }
vim.opt.tags:prepend { "./.git/tags" }
vim.opt.wildignore:append { "*.o" , "*~" , "*.pyc", "*/.git/*" , "*/.hg/*" , "*/.svn/*" , "*/.DS_Store" }

-- set tabwidth to 2 for elixir and lua
vim.cmd[[autocmd FileType elixir setlocal cc=99]]
vim.cmd[[autocmd FileType elixir,markdown,json,lua,terraform setlocal softtabstop=2 tabstop=2 shiftwidth=2]]
