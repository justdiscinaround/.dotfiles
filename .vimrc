" This is my vimrc. There are many like it, but this one is mine.
" Without me, my vimrc is useless. Without my vimrc, I am useless.

set nocompatible
set pastetoggle=<F2>
filetype plugin indent off
au FileType * setlocal ai sw=2 sts=2 et

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Townk/vim-autoclose'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'danro/rename.vim'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'kien/ctrlp.vim'
Plugin 'matchit.zip'
Plugin 'mattn/emmet-vim'
Plugin 'rking/ag.vim'
Plugin 't9md/vim-ruby-xmpfilter'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fireplace'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tomtom/tcomment_vim'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/Syntastic'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'skwp/greplace.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/SearchComplete'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'guns/vim-clojure-highlight'
Plugin 'vim-scripts/paredit.vim'
Plugin 'unblevable/quick-scope'
Plugin 't9md/vim-choosewin'
Plugin 'chrisbra/csv.vim'
Plugin 'cyphactor/vim-open-alternate'
Plugin 'sjl/gundo.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'elixir-lang/vim-elixir'
Plugin 'slashmili/alchemist.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'nanotech/jellybeans.vim'
Plugin 'morhetz/gruvbox'

" Plugin 'initrc/eclim-vundle'
call vundle#end()

filetype plugin indent on
syntax on
set autoindent
set backspace=indent,eol,start
set backupdir=~/.tmp
set colorcolumn=80
set directory=~/.tmp
set encoding=utf-8
set fileencoding=utf-8
set guioptions-=TBe
set laststatus=2 " Always show last status
set nowrap
set nrformats-=octal
set number
set relativenumber " 7.4+ shows both, below just relative
set ruler " Show cursor position
set scrolloff=1 " Always show at least one line above and below cursor
set showcmd " Show partially typed commands
set showmatch " Matches () etc
set timeout
set timeoutlen=1000
set ttimeoutlen=100
set visualbell " Flash the cursor on error instead of beeping
set wildmenu " Show menu options for completion

let mapleader = ","
let g:airline_powerline_fonts = 1

" window selector
nmap - <Plug>(choosewin)
let g:choosewin_overlay_enable=1
let g:choosewin_statusline_replace=0

" Theme
set background=dark
colorscheme bubblegum

" Random maps (normal, visual, select, operater pending)
map ; :
nnoremap <CR> :noh<CR><CR> " Cancel search by pressing return
nnoremap <leader><tab> mtgg=G`t
map <leader><leader>k :bw<CR>

" Fugitive
map <leader>gs :Gstatus<CR>
map <leader>ga :Gwrite<CR>
map <leader>gc :Gcommit<CR>
map <leader>gp :Gpush<CR>
map <leader>gd :Gdiff<CR>
map <leader>gb :Gblame<CR>

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" ctrlp
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_show_hidden = 1
let g:ctrlp_extensions = ['funky']
nnoremap <leader>oo :CtrlP c<cr>
nnoremap <leader>e :CtrlP<cr>
nnoremap <leader>f :CtrlPFunky<cr>
nnoremap <leader>b :CtrlPBuffer<cr>

" rails
nnoremap <leader>oc :Econtroller<space>
nnoremap <leader>om :Emodel<space>
nnoremap <leader>ov :Eview<space>

" rspec
let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec {spec}\n")'
map <Leader>rr :call RunNearestSpec()<CR>
map <Leader>rf :call RunCurrentSpecFile()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>

" xmpfilter - Super M and Super R
nmap <buffer> <F5> <Plug>(xmpfilter-mark)
xmap <buffer> <F5> <Plug>(xmpfilter-mark)
imap <buffer> <F5> <Plug>(xmpfilter-mark)

nmap <buffer> <F6> <Plug>(xmpfilter-run)
xmap <buffer> <F6> <Plug>(xmpfilter-run)
imap <buffer> <F6> <Plug>(xmpfilter-run)

" Searching
set hlsearch
set ignorecase
set smartcase " Only search upcase if provided with capital letter
set gdefault " Assume /g flag on :%s to replace all matches on line
set incsearch " Search as typing

" Highlight current line in active pane only
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" Use guard ctags with vim
set tags+=gems.tags

" Window management
set hidden " Allow unsaved buffers to be put in background
set winwidth=84 " Active window min width
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Gundo plugin
nnoremap <F7> :GundoToggle<CR>

" Vim Dispatch bind
nnoremap <F9> :Dispatch<CR>

" Zeal Integration
nnoremap gz :!zeal --query "<cword>"&<CR><CR>

augroup RubyFileTypes
  au BufNewFile,BufRead Gemfile set filetype=ruby
  au BufNewFile,BufRead Vagrantfile set filetype=ruby
  au BufNewFile,BufRead Guardfile set filetype=ruby
  au BufNewFile,BufRead Capfile set filetype=ruby
  au BufNewFile,BufRead Rakefile set filetype=ruby
  au BufNewFile,BufRead *.gemspec set filetype=ruby
  au BufNewFile,BufRead *.cap set filetype=ruby
  au BufNewFile,BufRead *.rake set filetype=ruby
  au BufNewFile,BufRead *.ru set filetype=ruby
augroup END

" By default only README.md opens as markdown
au BufNewFile,BufRead *.md set ft=markdown

" Highlight whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" Strip trailing whitespace before saving
au BufWritePre * :call <SID>StripWhite()
fun! <SID>StripWhite()
  %s/[ \t]\+$//ge
  %s!^\( \+\)\t!\=StrRepeat("\t", 1 + strlen(submatch(1)) / 8)!ge
endfun

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" Select syntastic ruby checker
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['eslint']

" Enable Open Alternate
set splitright
nnoremap <leader>. :vs<CR>:OpenAlternate<CR>

" React syntax
let g:jsx_ext_required = 0

" Clojure Rainbow Parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
