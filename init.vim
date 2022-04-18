filetype off

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'vim-ruby/vim-ruby', {  'for': 'ruby' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'andymass/vim-matchup'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'sainnhe/gruvbox-material'
Plug 'tomasiser/vim-code-dark'
Plug 'wakatime/vim-wakatime'
Plug 'jremmen/vim-ripgrep'
" Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'hashivim/vim-terraform'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'alvan/vim-closetag'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
call plug#end()

filetype plugin on
filetype indent on

syntax enable

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.erb'

set t_Co=256
set t_ut=

lua require('joao')

function GitBranch()
  let branch_name = trim(system('git rev-parse --abbrev-ref HEAD 2&> /dev/null'))
  if branch_name != ''
    return '[' . branch_name . ']'
  else
    return ""
  endif
endfunction
set statusline=%<%f\ %h%m%r\ %{GitBranch()}\ %=%-14.(%l,%c%V%)\ %P

let g:gruvbox_material_disable_italic_comment = 1
" let g:coc_global_extensions = [
"                         \ 'coc-clang-format-style-options',
"                         \ 'coc-clangd',
"                         \ 'coc-elixir',
"                         \ 'coc-emmet',
"                         \ 'coc-erlang_ls',
"                         \ 'coc-fzf-preview',
"                         \ 'coc-git',
"                         \ 'coc-go',
"                         \ 'coc-golines',
"                         \ 'coc-highlight',
"                         \ 'coc-html',
"                         \ 'coc-html-css-support',
"                         \ 'coc-json',
"                         \ 'coc-lightbulb',
"                         \ 'coc-lua',
"                         \ 'coc-rls',
"                         \ 'coc-sh',
"                         \ 'coc-solargraph',
"                         \ 'coc-sql',
"                         \ 'coc-stylua',
"                         \ 'coc-vimlsp',
"                         \ 'coc-docker',
"                         \ 'coc-emoji',
"                         \ 'coc-dictionary',
"                         \ ]

set termguicolors
set background=dark
nnoremap <leader>l :set background=light<cr><leader>gZ
nnoremap <leader>d :set background=dark<cr><leader>gZ
colorscheme gruvbox-material


let g:colors_off_a_little = 1
let g:mapleader = " "
let g:maplocalleader = ','

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
set expandtab
set fillchars=stlnc:\ ,vert:┃,fold:-,diff:-
set laststatus=2
set grepprg=rg\ -i\ -n\ -w\ --vimgrep\ $*
set hidden
set ignorecase
set smartcase
set modeline
set modelines=3
set nojoinspaces
set noswapfile
set nocursorline
set nocursorcolumn
set shortmess+=cS
set shiftround
set softtabstop=2
set shiftwidth=2
set nobackup
set path=.,,app-*/**,components/**,apps/**,lib/**,app/**,domains/**,plugins/**,deprecated_modules/**,modules/**,lib/**,vendor/**
set number
set norelativenumber
set showmatch
set signcolumn=auto
set splitbelow
set splitright
set ttimeout timeoutlen=500
set nowrap
set autoread
set autowrite
set autowriteall
set wildmenu
set wildmode=full
set showtabline=1
set showmode
set incsearch
set hlsearch
set showcmd
set list
set listchars=tab:◁∙▷,trail:∙,precedes:∙
set tags^=./.git/tags
set title
set novisualbell
set history=500
set sidescroll=5
set scrolloff=8
set sidescrolloff=8
set listchars+=precedes:<,extends:>
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
      \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
      \,sm:block-blinkwait175-blinkoff150-blinkon175

nnoremap <silent> <leader>bd :bd<cr>
nnoremap <silent> <Esc><Esc> :w<cr>
nnoremap <leader>/ :Rg<space>
nnoremap <silent> <leader><leader> <c-^>
nnoremap <silent> gz :e ~/.config/nvim/init.vim<cr>
nnoremap <silent> <M-r> :so ~/.config/nvim/init.vim<cr>
nnoremap <silent> gy :let @+ = expand("%")<cr>
nnoremap <silent><leader>hl :nohlsearch<CR>
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
nnoremap <silent> <leader>te :tabe %<cr>
nnoremap <c-p> :Files .<cr>
nnoremap <c-s> :Buffers<cr>
nnoremap <silent><leader>bl :BLines<cr>
nnoremap <silent><leader>. :Lines<cr>
nnoremap <leader>x :!xdg-open %<cr><cr>

" git
nnoremap <silent>gs :G<cr>
nnoremap <silent>gb :G blame<cr>

" coc
" nnoremap <silent> gx :CocAction<cr>

"
" nnoremap <c-h> <c-w>h
" nnoremap <c-j> <c-w>j
" nnoremap <c-k> <c-w>k
" nnoremap <c-l> <c-w>l

nmap + mz:m+<cr>`z
nmap - mz:m-2<cr>`z
vmap + :m'>+<cr>`<my`>mzgv`yo`z
vmap - :m'<-2<cr>`>my`<mzgv`yo`z

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

" au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}

let g:go_fmt_autosave = 1
let g:go_imports_autosave = 1
let g:go_mod_fmt_autosave = 1
let g:go_doc_popup_window = 1

let g:ruby_host_prog = '/home/joao/.asdf/shims/neovim-ruby-host'

let g:python3_host_prog = "/usr/bin/python3"
let g:python2_host_prog = "/usr/bin/python2"

let g:terraform_fmt_on_save=1
let g:terraform_binary_path="/home/joao/.asdf/shims/terraform"

let g:fzf_buffers_jump = 1
