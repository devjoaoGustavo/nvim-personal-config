call plug#begin('~/.config/nvim/plugged')
Plug 'preservim/nerdtree'
Plug 'alvan/vim-closetag'
Plug 'andymass/vim-matchup'
Plug 'christoomey/vim-tmux-navigator'
Plug 'elixir-editors/vim-elixir'
Plug 'hashivim/vim-terraform'
" Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'jremmen/vim-ripgrep'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/vim-jsx-improve'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-ruby/vim-ruby', {  'for': 'ruby' }
Plug 'wakatime/vim-wakatime'
" Plug 'preservim/vimux'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
" Plug 'justinmk/vim-dirvish'
" Plug 'kristijanhusak/vim-dirvish-git'
" Plug 'roginfarrer/vim-dirvish-dovish', {'branch': 'main'}
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-eunuch'
" Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'fannheyward/telescope-coc.nvim'

" Plug 'folke/which-key.nvim'

Plug 'toppair/peek.nvim', { 'do': 'deno task --quiet build:fast' }

" LSP stuff
" Plug 'williamboman/mason.nvim'
" Plug 'williamboman/mason-lspconfig.nvim'
" Plug 'neovim/nvim-lspconfig'

" Plug 'hrsh7th/nvim-cmp'
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-vsnip'
" Plug 'hrsh7th/vim-vsnip'
" Plug 'onsails/lspkind-nvim'

call plug#end()

" let g:dirvish_mode = 1
" let g:dirvish_relative_paths = 1
" let g:dirvish_mode = ':sort ,^\v(.*[\/])|\ze,'
let g:sneak#label = 1


" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd :Telescope coc definitions<cr>
nmap <silent> gy :Telescope coc type_definitions<CR>
nmap <silent> gi :Telescope coc implementations<cr>
" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-solargraph',
      \ 'coc-tsserver', 'coc-pairs', 'coc-git', 'coc-highlight', 'coc-emmet',
      \ 'coc-snippets', 'coc-rust-analyzer', 'coc-lua', 'coc-prettier', 'coc-go']

filetype plugin on
filetype indent on

syntax enable

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.erb'

lua require('joao')

" let g:lightline = {
"       \   'active': {
"       \     'left': [ [ 'mode', 'paste' ],
"       \               [ 'gitbranch', 'readonly', 'filename', 'modified', 'bufnum' ] ],
"       \   'right': [ [ 'lineinfo' ],
"       \              [ 'percent' ],
"       \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
"       \   },
"       \   'inactive': {
"       \   'left': [ [ 'filename' ] ],
"       \   'right': [ [ 'lineinfo' ],
"       \              [ 'percent' ] ] },
"       \   'enable': {
"       \     'tabline': 1
"       \   },
"       \   'component_function': {
"       \     'gitbranch': 'FugitiveHead'
"       \   },
"       \   'colorscheme': 'gruvbox_material',
"       \   'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
"       \   'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
"       \ }

set termguicolors

let g:rooter_patterns = ['.git', 'Gemfile.lock']
colorscheme gruvbox-material

set background=dark

let g:mapleader = " "
let g:maplocalleader = ','

nnoremap <leader>x :!xdg-open %<cr><cr>
nnoremap <silent> <Esc><Esc> :w<cr>
nnoremap <silent> <M-r> :so ~/.config/nvim/init.vim<cr>
nnoremap <silent> <leader><leader> <c-^>
nnoremap <silent> <leader>bd :bd<cr>
nnoremap <silent> <leader>hl :nohlsearch<CR>
nnoremap <silent> <leader>te :tabe %<cr>
nnoremap <silent> gb :G blame<cr>
nnoremap <silent> gs :G<cr>
nnoremap <silent> gy :let @+ = expand("%")<cr>
nnoremap <silent> gz :e ~/.config/nvim/init.vim<cr>

" FZF settings
nnoremap <silent><c-p> :Telescope find_files<cr>
nnoremap <silent><c-g> :Telescope git_files<cr>
nnoremap <silent><leader>/ :Telescope live_grep<cr>
nnoremap <silent><leader>fb :Telescope buffers<cr>
nnoremap <silent><leader>s :Telescope coc document_symbols<cr>
nnoremap <silent> gr :Telescop coc references<cr>


nnoremap <silent><M-j> zj
nnoremap <silent><M-k> zk
nnoremap <silent><leader>hl :nohlsearch<CR>

" NERDTree
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
nnoremap <silent> <leader>f :NERDTreeFind<CR>

let NERDTreeShowHidden = 0
let NERDTreeMinimalUI = 1
let NERDTreeMinimalMenu = 1
let NERDTreeAutoDeleteBuffer = 1

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

let g:go_doc_popup_window = 1
let g:go_fmt_autosave = 1
let g:go_imports_autosave = 1
let g:go_mod_fmt_autosave = 1
" let g:python2_host_prog = "/usr/bin/python2"
let g:python3_host_prog = "/usr/bin/python3"
let g:ruby_host_prog = '~/.asdf/shims/neovim-ruby-host'
let g:terraform_binary_path="~/.asdf/shims/terraform"
let g:terraform_fmt_on_save=1

" let g:fzf_buffers_jump = 0
" let g:fzf_layout = { 'down': '40%' }
"     let g:fzf_action = {
"       \ 'esc': 'close' }
