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
    set laststatus=2    " Alway show the statusline

    set statusline=%f     " Path to file
    set statusline+=%y    " Filetype
    set statusline+=%=    " Align right
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

  " Snippets {
    " Use honza's snippets.
    let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

    " Enable neosnippet snipmate compatibility mode
    let g:neosnippet#enable_snipmate_compatibility = 1

    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>   neocomplete#undo_completion()
    inoremap <expr><C-l>   neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return neocomplete#close_popup() . "\<CR>"
      " For no inserting <CR> key.
      "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplete#close_popup()
    inoremap <expr><C-e>  neocomplete#cancel_popup()
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

    " For cursor moving in insert mode(Not recommended)
    "inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
    "inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
    "inoremap <expr><Up>  neocomplete#close_popup() . "\<Up>"
    "inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
    " Or set this.
    "let g:neocomplete#enable_cursor_hold_i = 1
    " Or set this.
    "let g:neocomplete#enable_insert_char_pre = 1

    " AutoComplPop like behavior.
    "let g:neocomplete#enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplete#enable_auto_select = 1
    "let g:neocomplete#disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
    endif
    "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
  " }

  " Tagbar {
    nnoremap <Leader>tt :TagbarToggle<CR>
  " }

  " Tabularize {
    nmap <Leader>a& :Tabularize /&<CR>
    vmap <Leader>a& :Tabularize /&<CR>
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a=> :Tabularize /=><CR>
    vmap <Leader>a=> :Tabularize /=><CR>
    nmap <Leader>a: :Tabularize /:<CR>
    vmap <Leader>a: :Tabularize /:<CR>
    nmap <Leader>a:: :Tabularize /:\zs<CR>
    vmap <Leader>a:: :Tabularize /:\zs<CR>
    nmap <Leader>a, :Tabularize /,<CR>
    vmap <Leader>a, :Tabularize /,<CR>
    nmap <Leader>a,, :Tabularize /,\zs<CR>
    vmap <Leader>a,, :Tabularize /,\zs<CR>
    nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
  " }

  " indent-guides {
    let g:indent_guides_guide_size = 1
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_start_level = 2

    let g:indent_guides_auto_colors = 1
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=240
  " }

  " AutoCloseTag {
    nmap <Leader>ac <Plug>ToggleAutoCloseMappings
  " }
" }

" Modeline vim: tw=78 foldmethod=indent foldlevel=1
