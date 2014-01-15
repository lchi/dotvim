" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible                  " Must come first because it changes other options.

silent! call pathogen#runtime_append_all_bundles()

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

set clipboard=unnamed             " use system clipboard

" UNCOMMENT TO USE
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

set list listchars=tab:\ \ ,trail:·

" Set absolute line numbers
set number
" Or use vividchalk
colorscheme xoria256

" set up map leader
let mapleader=","

" use FuzzyFinder
map <leader>f :FufCoverageFile<cr>
map <leader>b :FufBuffer<cr>
" Replaced with NERDTree
" map <leader>t :FufTag<cr>
map <leader>r :FufRenewCache<cr>

" nicer colors for popup menu
highlight Pmenu ctermfg=16 ctermbg=57 guibg=grey30
":highlight Pmenusel ctermfg=5

" get rid of search hilights
nmap <silent> <leader>/ :nohlsearch<cr>

" Easy window navigation
" nmap <leader>h <C-w>h
" nmap <leader>j <C-w>j
" nmap <leader>k <C-w>k
" nmap <leader>l <C-w>l

" fugitive
nmap <leader>gd :Gdiff<cr>
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gb :Gblame<cr>

" Controversial...swap colon and semicolon for easier commands
"nnoremap ; :
"nnoremap : ;

"vnoremap ; :
"vnoremap : ;

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2
set foldlevelstart=20

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
autocmd BufNewFile,BufRead *_spec.rb compiler rspec

" Use javascript plugin for json
autocmd BufNewFile,BufRead *.json set ft=javascript

" autodetect for VimClojure was not working
autocmd BufNewFile,BufRead *.clj set filetype=clojure

" some coffee files have multiple dots
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd BufNewFile,BufRead *.iced set filetype=coffee

" use html filetype for .pjs files
autocmd BufNewFile,BufRead *.pjs set filetype=html
autocmd BufNewFile,BufRead *.toffee set filetype=toffee
autocmd BufNewFile,BufRead *.less set filetype=less

autocmd BufNewFile,BufRead *.go set filetype=go

" use yaml ft for eyaml (encrypted yaml)
autocmd BufNewFile,BufRead *.eyaml set filetype=yaml

" nginx conf highlighting
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/*,*nginx.conf if &ft == '' | setfiletype nginx | endif

" :w!! reopens the file as sudo and saves it
cmap w!! %!sudo tee > /dev/null %

" needed for rubyblock
runtime macros/matchit.vim

" for ctags
nmap <leader>rt :!ctags --extra=+f -R *<CR><CR>
" jump to definition
nmap <leader>d <C-]>
" jump back from definition
nmap <leader>c <C-t>
" open definition in a new vertical split
nmap <leader>s :vsp <CR><C-w>l:exec("tag ".expand("<cword>"))<CR>

" shortcut for :bd
nmap <leader>w :bd<cr>

" shortcut to delete trailing whitespace
nmap <leader>nw :%s/\s\+$//g<cr>

nmap <leader>p :set paste<cr>
nmap <leader>np :set nopaste<cr>

nmap <leader>t :NERDTree<cr>
nmap <leader>h :split<cr>
