" ------------------------------------------------------------
"
" 色設定

if has("syntax")
  syntax on

  "highlight LineNr ctermfg=darkyellow guifg=darkyellow

  highlight Cursor ctermbg=darkyellow guibg=darkyellow
  highlight CursorIM ctermbg=red guibg=red

  " 256color settings
  if &term=='xterm-256color'
    " colorscheme orangeocean256
    colorscheme elflord
    highlight Normal ctermbg=none
  else
    colorscheme ron
    highlight CursorLine cterm=underline ctermbg=darkgrey guibg=black
    highlight CursorColumn cterm=none ctermbg=darkgrey guibg=black
  endif

  highlight NonText ctermfg=darkgrey gui=NONE guifg=darkcyan
  highlight Folded ctermfg=blue
  highlight SpecialKey cterm=underline ctermfg=darkgrey guifg=darkcyan
  " カレントウィンドウにのみ罫線を引く
  augroup cch
    autocmd! cch
    autocmd WinLeave * set nocursorcolumn nocursorline
    autocmd WinEnter,BufRead * set cursorcolumn cursorline
    " PHPで重いので使わない
    autocmd WinEnter,BufRead *.php set nocursorcolumn nocursorline
  augroup END
endif


" filetype specific
"----------------------------------------------------------
filetype plugin indent on
autocmd FileType python set ts=4 sts=4 sw=4 noet noci si ai cinwords=if,elif,else,for,while,try,except,finally,def,class,with indentkeys+=#


" tab
"----------------------------------------------------------
set et ts=2 sw=2 sts=2
set list listchars=tab:>-,eol:$,trail:*

" edit
"-----------------------------------------------------------
set autoindent
set cindent
set backspace=indent,eol,start
set showmatch " show matching parentheses
set wildmenu
set formatoptions+=mM
set ambiwidth=double " for UTF-8 kigou
set vb t_vb=
set showmode

" use mouse in terminal
set mouse=a
set ttymouse=xterm2

" highlight, incremental
set hlsearch
set incsearch

set statusline=\[%n%{bufnr('$')>1?'/'.bufnr('$'):''}%{winnr('$')>1?':'.winnr().'/'.winnr('$'):''}\]\ %<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l/%L,%c%V%8P

set number
set laststatus=2

set termencoding=utf-8
set encoding=utf-8
" set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set fenc=utf-8

set browsedir=current
set shellslash

set scrolloff=5

" 画面最下行の行を出来るだけ表示
set display=lastline

" omni complete
"-----------------------------------------------------------
hi Pmenu guibg=#666666
hi PmenuSel guibg=#8cd0d3 guifg=#666666
hi PmenuSbar guibg=#333333

"-----------------------------------------------------------
" keymaps
"-----------------------------------------------------------

" ========================= normal mode
" noh on ESCs
nmap <ESC><ESC> ;noh<CR>

" graphical j/k (dangerous for scripts)
"nnoremap j gj
"nnoremap k gk

" insert CR
nnoremap <C-J> o<ESC>j
nnoremap <CR> o<ESC>j
nnoremap O o<ESC>

" Ctrl-iでヘルプ
nnoremap <C-i>  :<C-u>help<Space>
" " カーソル下のキーワードをヘルプでひく
nnoremap <C-i><C-i> :<C-u>help<Space><C-r><C-w><Enter>

" save if updated on double Leader
noremap <Leader><Leader> ;up<CR>

" up/down prev/next => center
nnoremap <C-I> <C-I>zz
nnoremap <C-O> <C-O>zz

" yank to line end
nnoremap Y y$

" exit
nnoremap QQ ;qa<CR>

" buffer next/prev
nnoremap <C-N> ;bn<CR>
nnoremap <C-P> ;bp<CR>
nnoremap <S-Tab> ;bp<CR>

" window prev (ref: window next: C-W C-W)
nnoremap <C-W><C-P> <C-W><S-W>

" tab
nnoremap <C-K>c ;tabnew<CR>
nnoremap <C-K>d ;tabclose<CR>
nnoremap <C-K><C-D> ;tabclose<CR>
nnoremap <C-K>o ;tabonly<CR>
nnoremap <C-K><C-O> ;tabonly<CR>
nnoremap <C-K><C-P> gT
nnoremap <C-K>h gT
nnoremap <C-K><C-N> gt
nnoremap <C-K><C-K> gt
nnoremap <C-K>l gt
nnoremap <C-Tab> gt

" ;でコマンド入力( ;と:を入れ替)
noremap ; :
noremap : ;

" ========================= visual mode
" select to line end
vnoremap v $h

" search under visual selection
vnoremap * y/<C-R>"<CR>
vnoremap # y?<C-R>"<CR>

" ========================= command mode
" emacs keymap
cmap <C-A> <Home>
cmap <C-E> <End>
cmap <C-F> <Right>
cmap <C-B> <Left>

" noh on ESCs
cmap <ESC><ESC> <C-C>;noh<CR>


" ========================= insert mode
" YYYYMMDD, YYYYMMDD-HHMM
inoremap <F5> <C-r>=strftime('%Y%m%d')<CR>
inoremap <F6> <C-r>=strftime('%Y%m%d-%H%M')<CR>
imap <c-e> <esc>A
imap <c-a> <esc>0i
imap <c-d> <esc>lxi
imap <c-k> <esc>c$
imap <c-y> <esc>Pa
imap <c-f> <esc>la
imap <c-b> <esc>ha
imap { {}<esc>i
imap [ []<esc>i
imap ( ()<esc>i
imap ,t ;tabnew

" return to normal mode and suspend
inoremap <C-Z> <ESC><C-Z>

" move to line end
inoremap <C-L> <C-O>A
inoremap <C-A> <C-O>I

" Use modeline
:set modeline
:set modelines=4

" fold
set foldmethod=marker
set tags=tags

""for vundle
set nocompatible
filetype off
set rtp+=~/dotfiles/vimfiles/vundle.git/
call vundle#rc()
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimshell'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
Bundle 'gmarik/vundle'
Bundle 'mattn/zencoding-vim'
Bundle 'tpope/vim-rails'
Bundle 'rails.vim'
Bundle 'matrix.vim--Yang'
Bundle 'ZenCoding.vim'
Bundle 'The-NERD-Commenter'
Bundle 'html5.vim'
Bundle 'Changed'
Bundle 'colorize'
Bundle 'ruby.vim'
Bundle 'ruby-matchit'
Bundle 'surround.vim'
Bundle 'eregex.vim'
Bundle 'The-NERD-tree'
"Bundle 'statusline.vim'
Bundle 'fugitive.vim'
Bundle 'motemen/git-vim'
Bundle 'errormarker.vim'
" Bundle 'Smooth-Scroll'
Bundle 'smartchr'
Bundle 'taku-o/vim-toggle'
filetype plugin indent on
"
""Unite.vim
"" 入力モードで開始する
"let g:unite_enable_start_insert=1
"" バッファ一覧
"nnoremap <silent> <space>ub :<C-u>Unite buffer<CR>
"" ファイル一覧
"nnoremap <silent> <space>uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"" レジスタ一覧
"nnoremap <silent> <space>ur :<C-u>Unite -buffer-name=register register<CR>
"" 最近使用したファイル一覧
"nnoremap <silent> <space>um :<C-u>Unite file_mru -buffer-name=file_mru<CR>
"" 常用セット
"nnoremap <silent> <space>uu :<C-u>Unite buffer file_mru<CR>
"" 全部乗せ
"nnoremap <silent> <space>ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
"
"" ウィンドウを分割して開く
"au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
"au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
"" ウィンドウを縦に分割して開く
"au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
"au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
"" ESCキーを2回押すと終了する
"au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
"au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
"
"function! Scouter(file,...) 
"  let pat = '^\s*$\|^\s*"'
"  let lines = readfile(a:file)
"  if !a:0 || !a:1
"    let lines = split(substitute(join(lines, "\n"), '\n\s*\\', '', 'g'), "\n")
"  endif
"  return len(filter(lines,'v:val !~ pat'))
"endfunction
"command! -bar -bang -nargs=? -complete=file Scouter
"      \ echo Scouter(empty(<q-args>) ? $MYVIMRC : expand(<q-args>), <bang>0)
"
"au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q))))
"
"" neocomplcache.vim
"" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
"" Use neocomplcache.
"let g:neocomplcache_enable_at_startup = 1
"" Use smartcase.
"let g:neocomplcache_enable_smart_case = 1
"" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
"" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1
"" Set minimum syntax keyword length.
"let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"
"" Define dictionary.
"let g:neocomplcache_dictionary_filetype_lists = {
"      \ 'default' : '',
"      \ 'vimshell' : $HOME.'/.vimshell_hist',
"      \ 'scheme' : $HOME.'/.gosh_completions'
"      \ }
"
"" Define keyword.
"if !exists('g:neocomplcache_keyword_patterns')
"  let g:neocomplcache_keyword_patterns = {}
"endif
"let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"
"" Plugin key-mappings.
"" imap <C-k>     <Plug>(neocomplcache_snippets_expand)
"smap <C-k>     <Plug>(neocomplcache_snippets_expand)
"inoremap <expr><C-g>     neocomplcache#undo_completion()
"inoremap <expr><C-l>     neocomplcache#complete_common_string()
"
"" SuperTab like snippets behavior.
""imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"
"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
"" inoremap <expr><C-e>  neocomplcache#cancel_popup()
"
"" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
"
"" AutoComplPop like behavior.
""let g:neocomplcache_enable_auto_select = 1
"
"" Shell like behavior(not recommended).
""set completeopt+=longest
""let g:neocomplcache_enable_auto_select = 1
""let g:neocomplcache_disable_auto_complete = 1
""inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
""inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
"
"" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"
"" Enable heavy omni completion.
"if !exists('g:neocomplcache_omni_patterns')
"  let g:neocomplcache_omni_patterns = {}
"endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
""autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
"let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
"
" appended on 09282011 edit .vimrc immediately
nnoremap <SPACE>. :<C-u>edit $MYVIMRC<CR>
nnoremap <SPACE>, :<C-u>edit ~/.zshrc<CR>
nnoremap <SPACE>s. :<C-u>source $MYVIMRC<CR>
nnoremap <SPACE>s, :<C-u>source ~/.zshrc<CR>
"
"" w3m
"let $PATH = $PATH . ':/opt/local/bin'
"
"" rails.vim
"let g:rails_level=4
"let g:rails_default_file="app/controllers/application.rb"
"
"" matrix.vim
"nnoremap <silent> <space>m :<C-u>Matrix<CR>
"
"" vim Scounter
"function! Scouter(file, ...)
"  let pat = '^\s*$\|^\s*"'
"  let lines = readfile(a:file)
"  if !a:0 || !a:1
"    let lines = split(substitute(join(lines, "\n"), '\n\s*\\', '', 'g'), "\n")
"  endif
"  return len(filter(lines,'v:val !~ pat'))
"endfunction
"command! -bar -bang -nargs=? -complete=file Scouter
"      \        echo Scouter(empty(<q-args>) ? $MYVIMRC : expand(<q-args>), <bang>0)
"command! -bar -bang -nargs=? -complete=file GScouter
"      \        echo Scouter(empty(<q-args>) ? $MYGVIMRC : expand(<q-args>), <bang>0)
"
"
"" vim-ref
"let g:ref_alc_cmd = 'w3m -dump %s'
"let g:ref_alc_use_cache = 1
"let g:ref_alc_encoding = 'Shift-JIS'
"let g:ref_alc_start_linenumber = '45'
"nnoremap <silent> <space>a :<C-u>Ref<SPACE>alc<SPACE>
"
"" statusline.vim
"" let hi_insert = 'hi StatusLine guifg=DarkBule guibg=DarkYellow gui=none ctermfg=Blue ctermbg=Yellow cterm=none'
"
"" fugitive.vim
"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
"
"" errormarker.vim
""let g:errormarker_errortext = '!!'
""let g:errormarker_warningtext = '??'
""let g:errormarker_errorgroup = 'Error'
""let g:errormarker_warninggroup = 'Todo'
""if has('win32') || has('win64')
""  let g:errormarker_erroricon = expand('~/.vim/signs/err.bmp')
""  let g:errormarker_warningicon = expand('~/.vim/signs/warn.bmp')
""else
""  let g:errormarker_erroricon = expand('~/.vim/signs/err.bmp')
""  let g:errormarker_warningicon = expand('~/.vim/signs/err.png')
""endif
"
"" smartchr
"inoremap <expr> = smartchr#loop('=', ' = ', ' == ')
"inoremap <expr> . smartchr#loop('.', '->', '...')
"
"" vim-toggle
":let g:toggle_pairs = { 'and':'or', 'or':'and', 'if':'elseif', 'elseif':'else', 'else':'if' }
"
"" neocomplcache quick_match
"imap <C-y> <Plug>(neocomplcache_start_unite_quick_match)
