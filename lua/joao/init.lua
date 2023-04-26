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

vim.opt.statusline= ''

vim.opt.foldmethod = "syntax"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldminlines = 2
vim.opt.foldlevelstart = 3

vim.opt.guicursor = ''
vim.opt.termguicolors = true
vim.opt.conceallevel = 2
vim.opt.linespace = 0
vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.autowriteall = true
vim.opt.clipboard = { "unnamedplus" }
vim.opt.cmdheight = 1
vim.opt.copyindent = true
vim.opt.expandtab = true
vim.opt.fillchars = { stlnc = ' ', vert = '┃', fold = '-', diff = '-' }
vim.opt.grepprg = "rg -i -n -w --vimgrep $*"
vim.opt.hidden = true
vim.opt.history = 500
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.inccommand = nosplit
vim.opt.incsearch = true
vim.opt.laststatus = 3
vim.opt.list = true
vim.opt.listchars:append { precedes = '<', extends = '>' }
vim.opt.listchars = { tab = '◁∙▷', trail = '∙', precedes = '∙' }
vim.opt.modeline = true
vim.opt.modelines = 3
vim.opt.backup = false
vim.opt.cursorline = false
vim.opt.cursorcolumn = false
vim.opt.joinspaces = false
vim.opt.relativenumber = false
vim.opt.showmode = false
vim.opt.swapfile = false
vim.opt.visualbell = false
vim.opt.wrap = false
vim.opt.number = true
vim.opt.path = { './**', '' }
vim.opt.scrolloff=0
vim.opt.shiftround = true
vim.opt.shiftwidth=2
vim.opt.shortmess:append { c = true, S = true }
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.showtabline = 1
vim.opt.sidescroll = 5
vim.opt.sidescrolloff = 4
vim.opt.signcolumn = 'auto'
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tags:prepend { "./.git/tags" }
vim.opt.title = true
vim.opt.ttimeout = true
vim.opt.timeoutlen = 300
vim.opt.wildignore:append { "*/.git/*" , "*/.hg/*" , "*/.svn/*" , "*/.DS_Store" }
vim.opt.wildignore:append { "*.o" , "*~" , "*.pyc" }
vim.opt.wildmenu = true
vim.opt.wildmode = 'full'

vim.opt.completeopt:append { 'menuone', 'noselect', 'longest' }

vim.opt.magic = true
vim.opt.cmdheight = 1
vim.opt.mouse = 'a'
vim.opt.inccommand = 'nosplit'
vim.opt.encoding = 'UTF-8'
vim.opt.copyindent = true
vim.opt.clipboard = 'unnamedplus'

vim.opt.cindent = true


NERDTreeAutoDeleteBuffer = 1
NERDTreeMinimalMenu = 1
NERDTreeMinimalUI = 1
NERDTreeQuitOnOpen = 1
NERDTreeShowHidden = 0
NERDTreeCascadeSingleChildDir = 0
NERDTreeCreatePrefix='silent keepalt keepjumps'
