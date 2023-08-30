local vim = vim

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.termguicolors = true

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- vim.g.netrw_banner = 0
-- vim.g.netrw_liststyle = 0
-- vim.g.netrw_hide = 1
-- vim.g.netrw_browse_split = 0
--
-- vim.g.plug_window = 'noautocmd vertical topleft new'
vim.o.autoindent = true
vim.o.autoread = true
vim.o.autowrite = true
vim.o.autowriteall = true
vim.o.backup = false
vim.o.breakindent = true
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
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevelstart = 94
vim.o.foldmethod = "expr"
vim.o.foldminlines = 1
vim.o.grepprg = "rg -i -n -w --vimgrep $*"
vim.o.hidden = true
vim.o.history = 500
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.inccommand = 'nosplit'
vim.o.incsearch = true
vim.o.joinspaces = false
vim.o.laststatus = 3
vim.o.linespace = 0
vim.o.list = true
vim.o.magic = true
vim.o.modeline = true
vim.o.modelines = 3
vim.o.mouse = ''
vim.o.mouse = 'a'
vim.o.number = true
vim.o.relativenumber = false
vim.o.scrolloff=10
vim.o.shiftround = true
vim.o.shiftwidth=2
vim.o.showcmd = true
vim.o.showmatch = true
vim.o.showmode = true
vim.o.showtabline = 1
vim.o.sidescroll = 5
vim.o.sidescrolloff = 4
vim.o.signcolumn = 'no'
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.softtabstop = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.tabstop = 2
vim.o.timeoutlen = 300
vim.o.title = true
vim.o.ttimeout = true
vim.o.undofile = true
vim.o.updatetime = 250
vim.o.visualbell = false
vim.o.wildmenu = true
vim.o.wildmode = 'full'
vim.o.wrap = false
vim.o.writebackup = false
vim.opt.fillchars = { stlnc = ' ', vert = '┃', fold = '-', diff = '-' }
vim.opt.listchars = { tab = '◁∙▷', trail = '∙', precedes = '<', extends = '>' }
vim.opt.path = { './**', '' }
vim.opt.shortmess:append { c = true, S = true }
vim.opt.tags:prepend { "./.git/tags" }
vim.opt.wildignore:append { "*.o" , "*~" , "*.pyc", "*/.git/*" , "*/.hg/*" , "*/.svn/*" , "*/.DS_Store" }
-- vim.o.guicursor = '' -- cursor always as Block
-- vim.cmd('set guicursor=n-v-c:block,i-ci-ve:ver50,r-cr:hor20,o:hor50')

vim.cmd[[
let g:copilot_filetypes = {
      \ '*': v:false,
      \ 'lua': v:true,
      \ 'rust': v:true,
      \ 'elixir': v:true,
      \ 'erlang': v:true,
      \ 'ruby': v:true,
      \ 'ocaml': v:true,
      \ }
]]

vim.g.mix_format_on_save  = true
