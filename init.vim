set nocompatible
let mapleader = ' '
set number
set guicursor=
set autoindent
set smartindent

"Autocompletion
filetype plugin on
set omnifunc=syntaxcomplete#Complete


call plug#begin('~/.config/nvim/autoload/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'luochen1990/rainbow'
Plug 'scrooloose/NERDTree'
Plug 'jiangmiao/auto-pairs'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'natebosch/dartlang-snippets'
Plug 'morhetz/gruvbox'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'vim-airline/vim-airline'
"Plug 'junegunn/fzf'
Plug 'preservim/tagbar'
Plug 'akinsho/flutter-tools.nvim'
Plug 'nvim-lua/plenary.nvim'
"Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
"Plug 'fatih/vim-go', {'do':':GoUpdateBinaries'}
Plug 'nvim-lua/popup.nvim'
"Plug 'nvim-telescope/telescope.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'

"Debugging
Plug 'liuchengxu/vim-clap'
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
"Plug 'puremourning/vimspector'

"JS stuff
Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
Plug 'jparise/vim-graphql'

"navigation: see youtube and github for navigator
"Plug 'neovim/nvim-lspconfig'
"Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
"Plug 'ray-x/navigator.lua'
"Plug 'nvim-treesitter/nvim-treesitter'

call plug#end()

"lua require'navigator'.setup()

"Remaps from https://www.youtube.com/watch?v=hSHATqh8svM
nnoremap Y y$
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <ESC>:m .+1<CR>==
inoremap <C-k> <ESC>:m .-2<CR>==


"create vimscript that gets the current file name, sends it to g++

let g:airline_powerline_fonts = 1
"let g:airline_left_sep='>'
"let g:airline_left_sep='<'
let g:airline#extensions#tabline#enabled = 1

let g:rainbow_active = 1 

noremap <leader>b :ls<cr>:b<Space>
"for some reason this doesn't work
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected) 

noremap <leader>t :Tagbar<CR>
noremap <leader>o :CocCommand flutter.toggleOutline<CR>

"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
map <leader>, :CtrlPBuffer<cr>
"map <leader>. :Clap files<cr>
map <leader>m :nohl<cr>
"map <leader>. :Telescope file_browser<cr>

nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>
nnoremap <leader>fD :FlutterVisualDebug<cr>



nmap<silent> gd <Plug>(coc-definition)
nmap<silent> gy <Plug>(coc-type-definition)
nmap<silent> gi <Plug>(coc-implementation)
nmap<silent> gr <Plug>(coc-references)

colorscheme gruvbox
"colorscheme palenight

imap jk <Esc>
"map <leader>. :FZF ~<CR>
map <leader>n :NERDTree<CR>
map <leader>q :q<CR>
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
map <leader>s :wincmd s<CR>
map <leader>v :wincmd v<CR>

"imap <tab> <Plug>(coc-snippets-expand)
"let g:UltiSnipsExpandTrigger = '<Nop>'
"let g:coc_snippet_next = '<TAB>'
"let g:coc_snippet_prev = '<S-TAB>' 
"

"CoC config
set updatetime=300

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)









