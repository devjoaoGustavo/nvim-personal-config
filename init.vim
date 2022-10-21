call plug#begin('~/.config/nvim/plugged')
Plug 'alvan/vim-closetag'
Plug 'andymass/vim-matchup'
Plug 'christoomey/vim-tmux-navigator'
Plug 'elixir-editors/vim-elixir'
Plug 'hashivim/vim-terraform'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'jremmen/vim-ripgrep'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/vim-jsx-improve'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-ruby/vim-ruby', {  'for': 'ruby' }
Plug 'wakatime/vim-wakatime'
Plug 'preservim/vimux'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
call plug#end()

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

set guifont=JetBrainsMono\ NF:h11

" Right Click Context Menu (Copy-Cut-Paste)
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <f2> <Plug>(coc-rename)
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-solargraph',
      \ 'coc-tsserver', 'coc-pairs', 'coc-git', 'coc-highlight', 'coc-emmet',
      \ 'coc-snippets']

filetype plugin on
filetype indent on

set completeopt+=menuone,noselect,longest

syntax enable

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.erb'

set t_Co=256
set t_ut=

lua require('joao')

set magic
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set cmdheight=1
set mouse=a
set inccommand=nosplit
set encoding=UTF-8
set autoindent
set copyindent
set smartindent
set clipboard=unnamedplus

let g:lightline = {
      \   'active': {
      \     'left': [ [ 'mode', 'paste' ],
      \               [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \   },
      \   'inactive': {
      \   'left': [ [ 'filename' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ] ] },
      \   'enable': {
      \     'tabline': 1
      \   },
      \   'component_function': {
      \     'gitbranch': 'FugitiveHead'
      \   },
      \   'colorscheme': 'gruvbox_material',
      \   'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \   'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
      \ }

set termguicolors

let g:rooter_patterns = ['.git', 'Gemfile.lock']
colorscheme gruvbox-material

set background=dark

let g:mapleader = " "
let g:maplocalleader = ','

set linespace=0
set autoindent
set autoread
set autowrite
set autowriteall
set clipboard+=unnamedplus
set cmdheight=1
set copyindent
set expandtab
set fillchars=stlnc:\ ,vert:┃,fold:-,diff:-
set grepprg=rg\ -i\ -n\ -w\ --vimgrep\ $*
set hidden
set history=500
set hlsearch
set ignorecase
set inccommand=nosplit
set incsearch
set laststatus=2
set list
set listchars+=precedes:<,extends:>
set listchars=tab:◁∙▷,trail:∙,precedes:∙
set modeline
set modelines=3
set nobackup
set nocursorcolumn
set nocursorline
set nojoinspaces
set norelativenumber
set noshowmode
set noswapfile
set novisualbell
set nowrap
set nonumber
set path=.,,app-*/**,components/**,apps/**,lib/**,app/**,domains/**,plugins/**,deprecated_modules/**,modules/**,lib/**,vendor/**
set scrolloff=8
set shiftround
set shiftwidth=2
set shortmess+=cS
set showcmd
set showmatch
set showtabline=2
set sidescroll=5
set sidescrolloff=8
set signcolumn=auto
set smartcase
set smartindent
set softtabstop=2
set splitbelow
set splitright
set tags^=./.git/tags
set title
set ttimeout timeoutlen=500
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set wildignore=*.o,*~,*.pyc
set wildmenu
set wildmode=full

nnoremap <c-p> :Files .<cr>
nnoremap <c-s> :Buffers<cr>
nnoremap <leader>/ :Rg<space>
nnoremap <leader>x :!xdg-open %<cr><cr>
nnoremap <silent> <Esc><Esc> :w<cr>
nnoremap <silent> <M-r> :so ~/.config/nvim/init.vim<cr>
nnoremap <silent> <leader><leader> <c-^>
nnoremap <silent> <leader>bd :bd<cr>
nnoremap <silent> <leader>f :NERDTreeFind<CR>
nnoremap <silent> <leader>hl :nohlsearch<CR>
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
nnoremap <silent> <leader>te :tabe %<cr>
nnoremap <silent> gb :G blame<cr>
nnoremap <silent> gs :G<cr>
nnoremap <silent> gy :let @+ = expand("%")<cr>
nnoremap <silent> gz :e ~/.config/nvim/init.vim<cr>
nnoremap <silent><F4> :call VimuxRunLastCommand()<CR>
nnoremap <silent><F5> :call VimuxRunCommand("bundle exec rspec " . bufname("%") . ":" . line("."))<CR>
nnoremap <silent><F6> :call VimuxRunCommand("bundle exec rspec " . bufname("%"))<CR>
nnoremap <silent><F7> :call VimuxRunCommand("bundle exec rspec .")<CR>
nnoremap <silent><F8> :call VimuxRunCommand("rubocop " . bufname("%"))<CR>
nnoremap <silent><leader>. :Lines<cr>
nnoremap <silent><leader>bl :BLines<cr>
nnoremap <silent><leader>hl :nohlsearch<CR>
nnoremap <silent><M-j> zj
nnoremap <silent><M-k> zk

" git
nnoremap <silent>gs :G<cr>
nnoremap <silent>gb :G blame<cr>

" set guicursor=
set history=500
set listchars+=precedes:<,extends:>
set scrolloff=0
set sidescroll=0
set sidescrolloff=8

tnoremap <esc> <C-\><C-n>

fun! CleanTrailingSpaces()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfun

autocmd BufWritePre * :call CleanTrailingSpaces()
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

autocmd BufEnter * if &filetype == "" | setlocal ft=markdown | endif
autocmd TermOpen * startinsert

au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=100, on_visual=true}

let g:fzf_buffers_jump = 1
let g:go_doc_popup_window = 1
let g:go_fmt_autosave = 1
let g:go_imports_autosave = 1
let g:go_mod_fmt_autosave = 1
let g:python2_host_prog = "/usr/bin/python2"
let g:python3_host_prog = "/usr/bin/python3"
let g:ruby_host_prog = '~/.asdf/shims/neovim-ruby-host'
let g:terraform_binary_path="~/.asdf/shims/terraform"
let g:terraform_fmt_on_save=1
