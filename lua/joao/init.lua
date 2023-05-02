local vim = vim

require('nvim-autopairs').setup {}
require('Comment').setup()
require('fidget').setup()

require('joao.lualine')
require('joao.lsp')
require('joao.diagnostic')
require('joao.telescope')
require('joao.peek')
require('joao.keymaps')
require('joao.coc')

vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 300
vim.o.signcolumn = "yes"
vim.g.NERDTreeAutoDeleteBuffer = 1
vim.g.NERDTreeCascadeSingleChildDir = 0
vim.g.NERDTreeCreatePrefix = 'silent keepalt keepjumps'
vim.g.NERDTreeMinimalMenu = 1
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeQuitOnOpen = 0
vim.g.NERDTreeShowHidden = 0
vim.g.plug_window = 'noautocmd vertical topleft new'
vim.o.background = 'dark'
vim.o.breakindent = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.mouse = ''
vim.o.smartcase = true
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.updatetime = 250
vim.o.autoindent = true
vim.o.autoread = true
vim.o.autowrite = true
vim.o.autowriteall = true
vim.o.backup = false
vim.o.cindent = true
vim.o.clipboard = 'unnamedplus'
vim.o.cmdheight = 1
vim.o.completeopt = 'menuone,noselect,longest'
vim.o.conceallevel = 2
vim.o.copyindent = true
vim.o.cursorcolumn = false
vim.o.cursorline = false
vim.o.encoding = 'UTF-8'
vim.o.expandtab = true
vim.opt.fillchars = { stlnc = ' ', vert = '┃', fold = '-', diff = '-' }
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevelstart = 3
vim.o.foldmethod = "syntax"
vim.o.foldminlines = 2
vim.o.grepprg = "rg -i -n -w --vimgrep $*"
vim.o.guicursor = ''
vim.o.hidden = true
vim.o.history = 500
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.inccommand = 'nosplit'
vim.o.inccommand = nosplit
vim.o.incsearch = true
vim.o.joinspaces = false
vim.o.laststatus = 3
vim.o.linespace = 0
vim.o.list = true
vim.opt.listchars = { tab = '◁∙▷', trail = '∙', precedes = '∙' }
vim.opt.listchars:append { precedes = '<', extends = '>' }
vim.o.magic = true
vim.o.modeline = true
vim.o.modelines = 3
vim.o.mouse = 'a'
vim.o.number = true
vim.opt.path = { './**', '' }
vim.o.relativenumber = false
vim.o.scrolloff=0
vim.o.shiftround = true
vim.o.shiftwidth=2
vim.opt.shortmess:append { c = true, S = true }
vim.o.showcmd = true
vim.o.showmatch = true
vim.o.showmode = false
vim.o.showtabline = 1
vim.o.sidescroll = 5
vim.o.sidescrolloff = 4
vim.o.signcolumn = 'auto'
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.softtabstop = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.statusline= ''
vim.o.swapfile = false
vim.o.tabstop = 2
vim.opt.tags:prepend { "./.git/tags" }
vim.o.termguicolors = true
vim.o.timeoutlen = 300
vim.o.title = true
vim.o.ttimeout = true
vim.o.visualbell = false
vim.opt.wildignore:append { "*.o" , "*~" , "*.pyc" }
vim.opt.wildignore:append { "*/.git/*" , "*/.hg/*" , "*/.svn/*" , "*/.DS_Store" }
vim.o.wildmenu = true
vim.o.wildmode = 'full'
vim.o.wrap = false
vim.wo.number = true
vim.wo.signcolumn = 'yes'
