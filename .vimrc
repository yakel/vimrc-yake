" Common {

  set nocompatible

  syntax on
  filetype plugin indent on

  set number
  set autoindent
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
  set expandtab

  set mouse=a
  set mousehide
  set cursorline

  set showmode
  set showcmd
  set incsearch
  set hlsearch
  set ignorecase
  set smartcase

  set backspace=indent,eol,start
  set list
  set listchars=tab:›\ ,trail:•,extends:#,nbsp:. 


  set history=1000
  set spell

" Esay moving
  " For window
  nmap <C-h> <C-w>h
  nmap <C-j> <C-w>j
  nmap <C-k> <C-w>k
  nmap <C-l> <C-w>l

  " For tab
  nmap <S-h> gT
  nmap <S-l> gt

  " For horizontal scrolling
  nmap zl zL
  nmap zh zH

  cmap w!! w !sudo tee % >/dev/null

func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %< -lm -ansi -DLOCAL"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %< -lm -DLOCAL"
        exec "! ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!java Main"
    elseif &filetype == 'python'
        exec "!chmod u+x %"
        exec "! ./%"
    elseif &filetype == 'sh'
        exec "!chmod u+x %"
        exec "!./%"
    elseif &filetype == 'html'
        exec "!firefox ./% &> /dev/null &"
    endif
endfun

map <F5> :call CompileRunGcc()<CR>

let mapleader=','
inoremap <leader>u <Esc>bgUiwea

nnoremap <leader>ev :tabe $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

nnoremap <leader>em :tabe ~/.vim/bundle/vim-snippets/snippets/htmldjango.snippets
