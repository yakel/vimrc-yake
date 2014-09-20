" Basic {
    set nocompatible
" }

" Use bundles config {
    "if filereadable("~/.vimrc.bundles")
        source ~/.vimrc.bundles
    "endif
" }

" Common {
    syntax on
    filetype plugin indent on

    set number
    set autoindent

    " About the behavior of 'tab'
    set expandtab
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set shiftround

    " Mouse {
        if has('mouse')
            set mouse=a
        endif
        set mousehide
    " }
    set cursorline

    set splitright      " Puts new windows to right
    set splitbelow      " Puts new windows to below

    set showmode
    set showcmd
    set showmatch
    set matchtime=1
    set incsearch
    set hlsearch
    set ignorecase
    set smartcase

    set backspace=indent,eol,start
    set autoread
    set autowrite
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. 

    " Statusline {
        if has('statusline')
            set laststatus=2        " Alway show the statusline

            set statusline=%f       " Path to file
            set statusline+=%y      " Filetype
            set statusline+=%=      " Align right
            set statusline+=%l,%c\ \(%p%%,%L\)
        endif
    " }
    colorscheme desert

    set history=1000
" }

" Esay moving {
    " For window {
        nmap <C-h> <C-w>h
        nmap <C-j> <C-w>j
        nmap <C-k> <C-w>k
        nmap <C-l> <C-w>l
    " }

    " For tab {
        nmap <S-h> gT
        nmap <S-l> gt
    " }

    " For horizontal scrolling {
        nmap zl zL
        nmap zh zH
    " {
" }

func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %< -lm -ansi -DLOCAL"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %< -lm -DLOCAL"
        exec "! ./%<"
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
" When forget to sudo
cmap w!! w !sudo tee % >/dev/null

let mapleader=','
" Capitalize the previous staying Insert Mode
inoremap <leader>u <Esc>bgUiwea
" Maps for changing configure conveniently
nnoremap <leader>ev :tabe $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Plugins {
    " NERDTree {
    " }
" }
