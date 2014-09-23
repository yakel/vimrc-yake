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
        set background=dark

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

        set wildmenu
        set wildmode=list:longest,full
        set winminheight=0
        set scrolljump=5
        set scrolloff=3
        set foldenable
    " }

" }

" Esay moving {
    " For window {
        nmap <C-h> <C-w>h<C-w>_
        nmap <C-j> <C-w>j<C-w>_
        nmap <C-k> <C-w>k<C-w>_
        nmap <C-l> <C-w>l<C-w>_
    " }

    " For tab {
        nmap <S-h> gT
        nmap <S-l> gt
    " }

    " For horizontal scrolling {
        nmap zl zL
        nmap zh zH
    " {

    " Fix beheavior of Y to be consistent with C, D
    nnoremap Y y$
    nmap <leader>/ :nohlsearch<CR>
" }

" Mapping {

    let mapleader=','
    let maplocalleader='_'

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
        map <C-e> :NERDTreeToggle<CR>

        let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git']
        let NERDTreeQuitOnOpen=1
        let NERDTreeShowLineNumbers=1
    " }
" }
