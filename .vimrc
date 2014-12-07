" Basic {
    set nocompatible

    filetype plugin indent on
" }

" Use bundles config {
    if filereadable(expand("~/.vimrc.bundles"))
        source ~/.vimrc.bundles
    endif
" }

" UI {
    set background=dark
    syntax on

    set number
    set numberwidth=4

    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. 

    set cursorline
    set showmatch
    set matchtime=1

    set showmode
    set showcmd

    " colorscheme: Solarized {
        set t_Co=16
        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
        colorscheme solarized
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

" }

" Formatting {
    set autoindent
    set wrap

    " Tab {
        set expandtab
        set tabstop=2
        set softtabstop=2
    " }

    " Shift {
        set shiftwidth=2
        set shiftround
    " }
" }

" Functionality {
    set incsearch
    set hlsearch
    set ignorecase
    set smartcase

    set history=1000

    set backspace=indent,eol,start
    set autoread
    set autowrite

    set splitright
    set splitbelow

    set wildmenu
    set wildmode=list:longest,full
    set winminheight=0
    set scrolljump=5
    set scrolloff=3

    set foldenable
    set foldmethod=indent

    " Fix beheavior of Y to be consistent with C, D
    nnoremap Y y$

    " autocmd BufEnter * lcd %:p:h

    " Mouse {
        if has('mouse')
            set mouse=a
        endif
        set mousehide
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
        " }
    " }

" }

" Mapping {
    let mapleader=','
    let maplocalleader='_'

    " When forget to sudo
    cnoremap w!! w !sudo tee % >/dev/null

    " Capitalize the previous staying Insert Mode
    inoremap <Leader>u <Esc>bgUiwea

    " cope selection to + register
    nnoremap <Leader>y "+y

    nmap <Leader>wt <C-w>T
    nmap <Leader>/ :nohlsearch<CR>
" }

" Plugin {
    " NERDTree {
        map <C-e> :NERDTreeToggle<CR>
        map <Leader>e :NERDTreeFind<CR>

        let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git']
        let NERDTreeQuitOnOpen=1
        let NERDTreeShowLineNumbers=1
    " }

    " NERDCommenter {
        let NERDSpaceDelims = 1
    " }

    " Tagbar {
        nnoremap <Leader>tt :TagbarToggle<CR>
    " }

    " indent-guides {
        let g:indent_guides_guide_size = 1
        let g:indent_guides_enable_on_vim_startup = 1
        let g:indent_guides_start_level = 2

        let g:indent_guides_auto_colors = 0
        autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
        autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=240
    " }

    " AutoCloseTag {
        nmap <Leader>ac <Plug>ToggleAutoCloseMappings
    " }
" }

" Modeline vim: tw=78 foldmethod=indent foldlevel=1
