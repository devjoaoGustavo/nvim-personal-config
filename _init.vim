call plug#begin('~/.config/nvim/plugged')
Plug 'preservim/nerdtree'
Plug 'andymass/vim-matchup'
Plug 'christoomey/vim-tmux-navigator'
Plug 'elixir-editors/vim-elixir'
Plug 'hashivim/vim-terraform'
Plug 'jiangmiao/auto-pairs'
Plug 'jremmen/vim-ripgrep'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-ruby/vim-ruby', {  'for': 'ruby' }
Plug 'wakatime/vim-wakatime'

Plug 'sainnhe/gruvbox-material'
Plug 'patstockwell/vim-monokai-tasty'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'tpope/vim-eunuch'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'fannheyward/telescope-coc.nvim'

Plug 'nvim-treesitter/nvim-treesitter-textobjects'

Plug 'toppair/peek.nvim', { 'do': 'deno task --quiet build:fast' }

Plug 'folke/neodev.nvim'

call plug#end()

" let g:vim_monokai_tasty_italic = 1
" let g:vim_monokai_tasty_machine_tint = 1
" let g:vim_monokai_tasty_highlight_active_window = 1
" colorscheme vim-monokai-tasty

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd :Telescope coc definitions<cr>
nmap <silent> gy :Telescope coc type_definitions<CR>
nmap <silent> gi :Telescope coc implementations<cr>

nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-solargraph',
      \ 'coc-tsserver', 'coc-pairs', 'coc-git', 'coc-highlight', 'coc-emmet',
      \ 'coc-snippets', 'coc-rust-analyzer', 'coc-lua', 'coc-prettier', 'coc-go']

filetype plugin on
filetype indent on

syntax enable

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.erb'

set background=dark
colorscheme gruvbox-material

let g:mapleader = " "
let g:maplocalleader = ','

nnoremap <leader>x :!xdg-open %<cr><cr>
nnoremap <silent> <Esc><Esc> :w<cr>
nnoremap <silent> <leader>rr :so ~/.config/nvim/init.vim<cr>
nnoremap <silent> <leader><leader> <c-^>
nnoremap <silent> <leader>bd :bd<cr>
nnoremap <silent> <leader>hl :nohlsearch<CR>
nnoremap <silent> <leader>te :tabe %<cr>
nnoremap <silent> gb :G blame<cr>
nnoremap <silent> gs :G<cr>
nnoremap <silent> gy :let @+ = expand("%")<cr>
nnoremap <silent> gz :e ~/.config/nvim/init.vim<cr>
nnoremap <silent><c-p> :Telescope find_files<cr>
nnoremap <silent><c-g> :Telescope git_files<cr>
nnoremap <silent><leader>/ :Telescope live_grep<cr>
nnoremap <silent><leader>fb :Telescope buffers<cr>
nnoremap <silent><leader>s :Telescope coc document_symbols<cr>
nnoremap <silent> gr :Telescope coc references<cr>
nnoremap <silent><M-j> zj
nnoremap <silent><M-k> zk
nnoremap <silent><leader>hl :nohlsearch<CR>
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
nnoremap <silent> <leader>f :NERDTreeFind<CR>

lua << EOF
vim.api.nvim_set_keymap('n', '<leader>s', ':Telescope coc document_symbols<cr>', {})

vim.api.nvim_set_keymap('n', '<leader>bl', ':Telescope buffers<cr>', {})
EOF

let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalMenu = 1
let NERDTreeMinimalUI = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 0
let NERDTreeCascadeSingleChildDir = 0
let g:plug_window = 'noautocmd vertical topleft new'
let NERDTreeCreatePrefix='silent keepalt keepjumps'

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
let g:python3_host_prog = "/usr/bin/python3"
let g:ruby_host_prog = '~/.asdf/shims/neovim-ruby-host'
let g:terraform_binary_path="~/.asdf/shims/terraform"
let g:terraform_ft_on_save=1

lua require('joao')
