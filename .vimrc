" ---------------------- USABILITY CONFIGURATION ----------------------
"  Basic and pretty much needed settings to provide a solid base for
"  source code editting

" don't make vim compatible with vi 
set nocompatible

syntax on
" and show line numbers
set number

" make vim try to detect file types and load plugins for them
filetype on
filetype plugin on
filetype indent on

" reload files changed outside vim
set autoread         

" encoding is utf 8
set encoding=utf-8
set fileencoding=utf-8

" enable matchit plugin which ships with vim and greatly enhances '%'
runtime macros/matchit.vim

" by default, in insert mode backspace won't delete over line breaks, or 
" automatically-inserted indentation, let's change that
set backspace=indent,eol,start

" no bells
set noerrorbells
set vb t_vb=
autocmd GUIEnter * set vb t_vb=

" dont't unload buffers when they are abandoned, instead stay in the
" background
set hidden

" set unix line endings
set fileformat=unix
" when reading files try unix line endings then dos, also use unix for new
" buffers
set fileformats=unix

" save up to 100 marks, enable capital marks
set viminfo='100,f1

" set our desired autocompletion
set complete=.,w,b,u

" screen will not be redrawn while running macros, registers or other
" non-typed comments
set lazyredraw
" ---------------------- CUSTOMIZATION ----------------------
"  The following are some extra mappings/configs to enhance my personal
"  VIM experience

" set , as mapleader
let mapleader = ","

" map <leader>q and <leader>w to buffer prev/next buffer
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>
nmap <Leader>ev :tabedit $MYVIMRC
nmap <Leader>es :e ~/.vim/snippets/

" ---------------------- Split Manager ----------------------
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>


" H K L J should move the cursor
noremap J <C-d>
noremap K <C-U>
noremap H ^
noremap L g$

" Enter to insert commands
noremap <CR> :

" Merge
noremap M J

" To be consistent with ge and gE
noremap gw b
noremap gW B

" Redo
nnoremap U <C-r>


" ---------------------- Split Manager ----------------------
" ---------------------- NERDTREE      ----------------------
nmap <leader>t :NERDTreeToggle<cr>
nmap <C-r> :CtrlPBufTag<cr>
nmap <C-E> :CtrlPMRUFiles<cr>

" windows like clipboard
" yank to and paste from the clipboard without prepending "* to commands
let &clipboard = has('unnamedplus') ? 'unnamedplus' : 'unnamed'
" map c-x and c-v to work as they do in windows, only in insert mode
vm <c-x> "+x
vm <c-c> "+y
cno <c-v> <c-r>+
exe 'ino <script> <C-V>' paste#paste_cmd['i']

" save with ctrl+s
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" hide unnecessary gui in gVim
if has("gui_running")
    set guioptions-=m  " remove menu bar
    set guioptions-=T  " remove toolbar
    set guioptions-=r  " remove right-hand scroll bar
    set guioptions-=L  " remove left-hand scroll bar
end


" allow Tab and Shift+Tab to
" tab  selection in visual mode
vmap <Tab> >gv
vmap <S-Tab> <gv 

" remove the .ext~ files, but not the swapfiles
set nobackup
set writebackup
set noswapfile

" search settings
set incsearch        " find the next match as we type the search
set hlsearch         " hilight searches by default
" use ESC to remove search higlight
nnoremap <esc> :noh<return><esc>

" most of the time I should use ` instead of ' but typing it with my keyabord
" is a pain, so just toggle them
nnoremap ' `
nnoremap ` '

" suggestion for normal mode commands
set wildmode=list:longest

" keep the cursor visible within 3 lines when scrolling
set scrolloff=3

" indentation
set autoindent      " autoindent based on line above, works most of the time
set tabstop=4 expandtab shiftwidth=4

" no lines longer than 80 cols
set textwidth=80

" use <C-Space> for Vim's keyword autocomplete
"  ...in the terminal
inoremap <Nul> <C-n>
"  ...and in gui mode
inoremap <C-Space> <C-n>

" On file types...
"   .md files are markdown files
autocmd BufNewFile,BufRead *.md setlocal ft=markdown
"   .twig files use html syntax
autocmd BufNewFile,BufRead *.twig setlocal ft=html

" when pasting over SSH it's a pain to type :set paste and :set nopaste
" just map it to <f9>
set pastetoggle=<f9>

" if windows...
if has('win32')
    " start maximized
    autocmd GUIEnter * simalt ~x
    " also use .vim instead of vimfiles, make sure to run the following command
    " once this was copied to /Users/<user>/.vim
    "  mklink %homepath%/.vimrc %homepath%/.vim/.vimrc
    let &runtimepath.=',$HOME/.vim'
endif

" Visual
set guifont=Source\ Code\ Pro\ for\ Powerline\ 10
highlight ColorColumn ctermbg=lightgray guibg=lightgray
syntax enable


" Enable 256 colors on gnome-terinal
set t_Co=256

colorscheme atom-dark-256
if has("gui_running")
    colorscheme atom-dark
endif

" select all mapping
noremap <leader>a ggVG

" ---------------------- PLUGIN CONFIGURATION ----------------------
" initiate Vundle
let &runtimepath.=',$HOME/.vim/bundle/Vundle.vim'
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" start plugin defintion
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/L9'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'itchyny/lightline.vim'      
Plugin 'Lokaltog/vim-easymotion'    
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-commentary'

" Snippets 
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tobyS/pdv'
Plugin 'tobyS/vmustache'

" -- Front End
Plugin 'mattn/emmet-vim'            
Plugin 'jelera/vim-javascript-syntax'
Plugin 'hail2u/vim-css3-syntax'     
Plugin 'rking/ag.vim'     
Plugin 'skwp/greplace.vim'     

" -- Back end
Plugin 'StanAngeloff/php.vim'     
Plugin 'arnaud-lb/vim-php-namespace'     
Plugin 'ervandew/supertab'     
Plugin 'ludovicchabant/vim-gutentags'

Plugin 'Shougo/vimproc.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-syntastic/syntastic'
Plugin 'fatih/vim-go'

" end plugin definition
call vundle#end()            " required for vundle

" map FuzzyFinder
noremap <leader>b :FufBuffer<cr>
noremap <leader>f :FufFile<cr>

" ---------------------- Plugins ----------------------
"  CTRLP
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>

autocmd FileType php inoremap <Leader>s <Esc>:call PhpSortUse()<CR>
autocmd FileType php noremap <Leader>s :call PhpSortUse()<CR>

vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['php'] = 'laravel'

" Syntastic

let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd', 'phplint']
nmap <leader>sc :SyntasticCheck<CR>
nmap <leader>se :Errors<CR>
let g:ctrlp_show_hidden = 1

" Sane ignore for ctrlp
set wildignore+=*\\build\\**,*\\docs\\**

nmap <leader>cpc :CtrlPClearCache<CR>

" Key timeout
set timeoutlen=1000 ttimeoutlen=0

" php doc
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>

" ultisnip conf
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"