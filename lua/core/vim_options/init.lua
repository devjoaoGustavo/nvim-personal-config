vim.cmd [[
  autocmd FileType markdown,json,lua,terraform setlocal softtabstop=2 tabstop=2 shiftwidth=2
]]

if vim.filetype.match({ buf = vim.fn.bufnr() }) == 'ruby' then
  vim.cmd [[ autocmd FileType ruby set formatprg=rubyfmt\ -i\ % ]]
end

vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.autowriteall = true
vim.opt.backup = false
vim.opt.breakindent = false
vim.opt.cindent = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.cmdheight = 1
vim.opt.completeopt = 'preview,menuone,longest'
vim.opt.conceallevel = 0
vim.opt.copyindent = true
vim.opt.cursorcolumn = false
vim.opt.cursorline = true
vim.opt.encoding = 'UTF-8'
vim.opt.expandtab = true

vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 1
vim.opt.foldlevelstart = 94
vim.opt.foldmethod = "expr"
vim.opt.foldnestmax = 4

vim.opt.grepprg = "rg -i -n -w --vimgrep $*"
vim.opt.hidden = true
vim.opt.history = 500
vim.opt.hlsearch = true
vim.opt.inccommand = 'nosplit'
vim.opt.incsearch = true
vim.opt.joinspaces = false
vim.opt.laststatus = 2
vim.opt.linespace = 0
vim.opt.list = true
vim.opt.modeline = true
vim.opt.modelines = 3
vim.opt.mousescroll = "ver:1,hor:3"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.shiftround = true
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.sidescroll = 5
vim.opt.sidescrolloff = 0
vim.opt.signcolumn = 'auto'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.timeoutlen = 300
vim.opt.title = true
vim.opt.ttimeout = true
vim.opt.undofile = true
vim.opt.updatetime = 100
vim.opt.visualbell = false
vim.opt.wildmenu = true
vim.opt.wildmode = 'full'
vim.opt.syntax = 'off'
vim.opt.wrap = false
vim.opt.writebackup = false
vim.opt.fillchars = { stlnc = ' ', vert = '┃', fold = '-', diff = '-' }
vim.opt.listchars = { tab = '◁∙▷', trail = '∙', precedes = '<', extends = '>' }
vim.opt.path = '.,**/*,,'
vim.opt.shortmess:append { c = true, S = false }
vim.opt.tags:prepend { "./.git/tags" }
vim.opt.wildignore:append { "*.o", "*~", "*.pyc", "*/.git/*", "*/.hg/*", "*/.svn/*", "*/.DS_Store" }

if vim.filetype.match({ buf = vim.fn.bufnr() }) == 'elixir' then
  vim.opt.shiftwidth = 2
  vim.opt.softtabstop = 2
  vim.opt.tabstop = 2
  vim.opt.textwidth = 98
  vim.opt.formatprg = "mix format %"

  vim.cmd [[
      set cc=+1	  " highlight column after 'textwidth'
      set cc=+1,+2,+3  " highlight three columns after 'textwidth'
      hi ColorColumn ctermbg=lightgrey guibg=lightgrey
  ]]
end
