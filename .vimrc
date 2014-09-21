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

    " UI {
        set number
        set numberwidth=4

        set list
        set listchars=tab:›\ ,trail:•,extends:#,nbsp:. 

        set cursorline
        set showmatch
        set matchtime=1

        set showmode
        set showcmd

        colorscheme desert
    " }

    " Statusline {
        if has('statusline')
            set laststatus=2        " Alway show the statusline

            set statusline=%f       " Path to file
            set statusline+=%y      " Filetype
            set statusline+=%=      " Align right
            set statusline+=%l,%c\ \(%p%%,%L\)
        endif
    " }

    " Tab {
        set expandtab
        set tabstop=4
        set softtabstop=4
    " }

    " Shift {
        set shiftwidth=4
        set shiftround
    " }

    " Mouse {
        if has('mouse')
            set mouse=a
        endif
        set mousehide
    " }

    " Function {
        set autoindent

        set incsearch
        set hlsearch
        set ignorecase
        set smartcase

        set history=1000

        set backspace=indent,eol,start
        set autoread
        set autowrite

        set splitright      " Puts new windows to right
        set splitbelow      " Puts new windows to below
    " }

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

" Mapping {

    let mapleader=','

    " When forget to sudo
    cmap w!! w !sudo tee % >/dev/null

    " Capitalize the previous staying Insert Mode
    inoremap <leader>u <Esc>bgUiwea

    " Maps for changing configure conveniently {
        nnoremap <leader>ev :tabe $MYVIMRC<CR>
        nnoremap <leader>sv :source $MYVIMRC<CR>
    " }

" }

" Plugins {
    " NERDTree {
    " }
" }
