" 2016/01/10, AA: having also vim-pathogen on the bundle directory
set runtimepath+=~/.vim/
runtime bundle/vim-pathogen/autoload/pathogen.vim

" 2014-09-18, AA: Para fazer o autoload do pathogen do lado do windows
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

call plug#begin('~/.vim/plugged')

Plug 'https://github.com/Lokaltog/vim-easymotion.git'
Plug 'https://github.com/Shougo/neomru.vim'
Plug 'https://github.com/Shougo/unite.vim'
Plug 'https://github.com/gosukiwi/vim-atom-dark.git'
Plug 'https://github.com/haya14busa/incsearch.vim.git'
Plug 'https://github.com/junegunn/goyo.vim.git'
Plug 'https://github.com/junegunn/limelight.vim'
Plug 'https://github.com/junegunn/seoul256.vim.git'
Plug 'https://github.com/junegunn/vim-peekaboo'
Plug 'https://github.com/justinmk/vim-sneak.git'
Plug 'https://github.com/ledger/vim-ledger'
Plug 'https://github.com/tomtom/tlib_vim.git'
Plug 'https://github.com/MarcWeber/vim-addon-mw-utils.git'
Plug 'https://github.com/SirVer/ultisnips'
Plug 'https://github.com/honza/vim-snippets.git'
Plug 'https://github.com/sukima/xmledit/'
Plug 'https://github.com/idbrii/vim-focusclip'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/tpope/vim-endwise'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/tpope/vim-repeat.git'
Plug 'https://github.com/tpope/vim-sensible.git'
Plug 'https://github.com/tpope/vim-speeddating'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-vinegar'
Plug 'https://github.com/pangloss/vim-javascript'
Plug 'https://github.com/terryma/vim-expand-region'
Plug 'https://github.com/Raimondi/delimitMate'
Plug 'https://github.com/rhysd/clever-f.vim'
Plug 'https://github.com/ChesleyTan/wordCount.vim'
Plug 'https://github.com/vim-latex/vim-latex'
Plug 'https://github.com/tpope/vim-pathogen'
Plug 'https://github.com/tpope/vim-unimpaired'
Plug 'https://github.com/tpope/vim-rails'
Plug 'https://github.com/Shougo/neoyank.vim'
Plug 'https://github.com/mileszs/ack.vim'
Plug 'https://github.com/Shougo/vimproc.vim'
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/tpope/vim-git'
Plug 'https://github.com/tsukkee/unite-tag'
Plug 'https://github.com/Shougo/unite-outline'
Plug 'https://github.com/christoomey/vim-tmux-navigator'
Plug 'https://github.com/tomasr/molokai'
Plug 'https://github.com/elixir-lang/vim-elixir'
Plug 'https://github.com/ahw/vim-pbcopy'
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'https://github.com/tacahiroy/ctrlp-funky'
Plug 'https://github.com/junegunn/vim-easy-align'
Plug 'https://github.com/bkad/CamelCaseMotion'
Plug '~/vim-dotfiles/bundles/random_colorschemes'
Plug 'https://github.com/Firef0x/matchit'
Plug 'https://github.com/kana/vim-textobj-user'
Plug 'https://github.com/nelstrom/vim-textobj-rubyblock'

call plug#end()

" 2017/04/12 09:40:06, AA: Had to force the mapping again here
" because for some reason it was set (use `:verbose map %` to check)
" but it didn't work
" autocmd VimEnter because the _vimrc is parsed before loading the plugins
" and I want this to run after everything
autocmd VimEnter * map % <Plug>Matchit-%

let g:UltiSnipsSnippetsDir=$HOME.'/vim-dotfiles/bundles/mysnippets'
let g:UltiSnipsSnippetDirectories=['UltiSnips', g:UltiSnipsSnippetsDir]

set nocompatible

" Remap VIM 0 to first non-blank character
" 2015/08/03 14:43:50, AA: 0 equals ^ only in normal mode
noremap 0 ^

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" 2015/09/12 17:44:38, AA:
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1
let delimitMate_jump_expansion = 1
" 2016/11/16 13:32:56, AA: Control-, goes to the next closing thing (bracket, parenthesis, quote, etc.)
imap <C-b> <Plug>delimitMateS-Tab

" easy xml editing
let g:xml_syntax_folding = 1
set foldmethod=syntax
" 2016/11/11 16:53:42, AA: To start with all the folds opened
set foldlevelstart=20

" Fast saving
nmap <leader>w :w!<cr>
" 2016/11/11 18:01:42, AA: copy the contents of the file to the clipboard (OSX)
" nmap <leader>c :%w !pbcopy<cr>
" now using vim-pbcopy, normal mode: cy{motion}, visual mode: cy
let g:vim_pbcopy_escape_backslashes = 1

" 2014-03-20, AA: http://approache.com/blog/increase-your-productivity-with-vim-and-terminal/
" 2014-12-18, AA: Updated from http://www.reddit.com/r/vim/comments/2po023/which_key_do_you_bind_to_esc/
" jk => nao ter de ir ao Esc
imap jk <Esc>

" 2014-06-19, AA: http://vim.wikia.com/wiki/Map_Ctrl-Backspace_to_delete_previous_word
" Ctrl+BS Apaga previous word
" imap <C-BS> <C-W>
inoremap <C-BS> <C-\><C-o>db
inoremap <C-Del> <C-\><C-o>dw

" 2015-02-03, AA:
" expands %% to current file's directory in command-line mode
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>

" 2017/04/11 09:28:57, AA: visually select the last paste or change
nnoremap <expr> ge '`[' . strpart(getregtype(), 0, 1) . '`]'

nnoremap gp :read !pbpaste<CR>

" switch to last buffer, like alt+tab
nnoremap <Leader><Tab> :b#<CR>

" Fast editing of the .vimrc
map <leader>e :tabnew! $MYVIMRC<cr>

" * 2015/12/16 10:31:16, AA: Fast closing of window
map <leader>z :close<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost _vimrc source $MYVIMRC

" Set 7 lines to the cursors - when moving vertical..
set scrolloff=7

" 2015/08/19 10:01:29, AA: To toggle the editing line to be always
" centered on the screen
nnoremap <Leader>ss :let &scrolloff=999-&scrolloff<CR>

set wildmode=list:longest

set cmdheight=2 "The commandbar height

set hidden "Change buffer - without saving

" Set backspace config
set whichwrap+=<,>,h,l
set backspace=indent,eol,start

set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things

set nolazyredraw "Don't redraw while executing macros 

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

" 2017/02/21 11:54:48, AA: better split opening
set splitbelow
set splitright

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Set font according to system
" set guifont=Courier_New:h12 " :cANSI 
if has ("gui_running")
    " 2014-12-08 10:59:50, AA: latex config for Gvim
    " let g:Tex_ViewRule_pdf='C:/Program\ Files\ (x86)/SumatraPDF/SumatraPDF.exe'
    " 2015/11/08 23:19:26, AA: The full path didn't work, had to put
    " the sumatrapdf folder in the $PATH
    let g:Tex_ViewRule_pdf='sumatrapdf'

    if has("gui_gtk2")
        set guifont=Envy\ Code\ R\ 10
    elseif has("gui_win32")
        set guifont=Envy\ Code\ R:h10:cANSI
    elseif has("macunix")
        set guifont=Envy\ Code\ R\ for\ Powerline:h13
    endif
else
    " 2014-12-08 10:59:50, AA: latex config for shell
    let g:Tex_CompileRule_pdf = 'latexmk -pdf -f $*'
    let g:Tex_ViewRule_pdf = 'run /cygdrive/c/dados/programas/sumatraPDF/SumatraPDF'
endif

" abrir utf-8 the right way
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  " 2013-12-27, AA: comentei para usar o ucs-bom e o latin1
  " setglobal bomb
  set fileencodings=utf-8
  set penc=utf-8
  " set fileencodings=ucs-bom,utf-8,latin1
endif

" 2014-09-30, AA: Copied from
" http://www.reddit.com/r/vim/comments/1rzr72/how_do_i_work_with_different_file_encodings_in_vim/
function! CheckFileEncoding()
  if exists('b:fenc_at_read') && &fileencoding != b:fenc_at_read
    exec 'e! ++enc=' . &fileencoding
    unlet b:fenc_at_read
  endif
endfunction
au BufRead let b:fenc_at_read=&fileencoding
au BufWinEnter call CheckFileEncoding()

" 2014-11-04, AA: using seoul256
" instead of molokai
if has("gui_running")
  " 2015/06/17 15:43:49 AA:
  set guioptions=a
  set t_Co=256
  " colorscheme molokai
  " colorscheme seoul256
  colorscheme atom-dark
  " colorscheme peaksea
  " colorscheme ir_black
  " set background=dark
else
  " colorscheme zellner
  colorscheme molokai
  " Cool colors of seoul256
  hi TabLine term=underline cterm=underline ctermfg=245 ctermbg=237 gui=underline guibg=#4B4B4B
  hi TabLineFill term=reverse cterm=reverse ctermfg=235 gui=reverse guifg=#333233
  hi TabLineSel term=bold cterm=bold ctermfg=187 ctermbg=23 gui=bold guifg=#DFDEBD guibg=#007173
  " colorscheme atom-dark-256
  " let g:seoul256_background = 233
  " colorscheme seoul256
endif

set nonu
set colorcolumn=81

" Turn backup off, since most stuff is in SVN, git anyway...
set directory=%TMP%
set backupdir=%TMP%
set nobackup
set nowb
set noswapfile

"Persistent undo
try
    " set undodir=C:\Windows\Temp
    set undodir=%TMP%
    set undofile
catch
endtry

" spaces instead of tabs
set expandtab
set shiftwidth=4
set tabstop=4

set lbr

set smartindent "Smart indet
set cindent "Use C-style indent
set wrap "Wrap lines
set textwidth=1000 "por defeito sao 500 apenas

" 2014-11-07, AA: using https://github.com/haya14busa/incsearch.vim.git
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" 2015/09/02 14:41:35, AA: using vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Really useful!
"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>
" map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
map <leader>G :Ack! --ruby <c-r>=expand("<cword>")<CR>
map <leader>g :Ack! --ruby<Space>

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

map <C-f><C-f> :call ChangeFont()<CR>

" 12/25/04 15:29:34: funcao que percorre fonts que eu gosto
let g:font_index_to_use = 0
function! ChangeFont()
    let l:favourite_fonts = ["Raize:h12", "Courier_New:h12", "Envy\\ Code\\ R:h10"]
    let g:font_index_to_use += 1
    let l:to_use = l:favourite_fonts[g:font_index_to_use % len(l:favourite_fonts)]
    execute "set guifont=" . l:to_use
endfunction

" 2016/08/18 18:55:36: function to clean esttab .csv output from stata
function! CleanStataCSV()
    " Remove = -> It's needed
    " execute "%s/=//g"
    " Remove " -> They are needed
    " execute "%s/\"//g"
    " Replace , by ;
    execute "%s/,/;/g"
endfunction

" 2013-03-07, AA: Copia as matches (mesmo multiline) para os registers
function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/ge
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)

" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Smart mappings on the command line
cno $h e ~\
cno $d e ~\Desktop\
cno $j e .\
cno $c e <C-\>eCurrentFileDir("e")<cr>

func! Cwd()
  let cwd = getcwd()
  return "e " . cwd 
endfunc

func! DeleteTillSlash()
  let g:cmd = getcmdline()
  let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
  if g:cmd == g:cmd_edited
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
  endif   
  return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunc

" 2014-12-08 12:28:07, AA: Center screen on next/prev search:
nmap n nzz
nmap N Nzz

" 2015-03-31 22:40:16, AA: Map space to / (command)
" 2015/08/14 14:37:01, AA: Removed to be used for SneakNext
" nnoremap <space> /
" 2015-03-31 14:12:30, AA: Map ; to : (command)
nnoremap ; :
" 2015/09/21 17:20:11, AA: Map ;; to ;
" nnoremap ;; ;
" vnoremap ;; ;
" 2015/10/09 10:58:19, AA: Replaced ; functionality with f
" using clever-f plugin
" f; matches all signs (like ., (, :, %, {, ), etc.)
let g:clever_f_chars_match_any_signs = ';'
let g:clever_f_smart_case = 1

" 2015/06/17 15:56:51, AA: Map Backspace to Toggle between current file and previous
nnoremap <BS> <C-^>
map <silent> <leader><leader> :noh<cr>

" 2016/11/08 11:41:14, AA: From http://tex.stackexchange.com/a/3655/65117
" Because IMAP_JumpForward was taking the C-j mapping
" redef C-j to C-g
imap <C-g> <Plug>IMAP_JumpForward
nmap <C-g> <Plug>IMAP_JumpForward

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer (utiliza a function Bclose)
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Use the arrows to something useful
map <right> :bn<cr>
map <left> :bp<cr>

" Tab configuration
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

" When <leader>P copia a path do ficheiro actual para o clipboard
map <leader>P :let @+=expand("%:p")<cr>

command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Specify the behavior when switching between buffers 
try
  set switchbuf=usetab
  set stal=2
catch
endtry

" Always show the statusline
set laststatus=2

" Format the statusline
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c
" 2014-03-19, AA: Status line nova

" composicao da status line
set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%1*\ %{strlen(&fenc)?&fenc:&enc}%* " encoding
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5P%*             "percentage thru file
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%6*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor
" 2015/10/27 16:45:02, AA: wordcount
set statusline+=%6*w:%{wordCount#WordCount()}%*

function! CurDir()
    " tinha isto mas tirei o substitute:
    " let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    " return curdir
    return getcwd()
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 2014-11-03, AA: surround.vim faz isto com o S", ou S{, etc.
" vnoremap ?1 <esc>`>a)<esc>`<i(<esc>
" vnoremap ?2 <esc>`>a]<esc>`<i[<esc>
" vnoremap ?3 <esc>`>a}<esc>`<i{<esc>
" vnoremap ?$ <esc>`>a"<esc>`<i"<esc>
" vnoremap ?q <esc>`>a'<esc>`<i'<esc>
" vnoremap ?e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap ;a ()<esc>i
inoremap ;s []<esc>i
inoremap ;d {}<esc>i
inoremap ;f {<esc>o}<esc>O<tab>
inoremap ;q ''<esc>i
inoremap ;w ""<esc>i
inoremap ;e <><esc>i

" 2014-11-03, AA: From http://stackoverflow.com/a/4952200/687420
" mapping to make movements operate on 1 screen line in wrap mode
function! ScreenMovement(movement)
   if &wrap
      return "g" . a:movement
   else
      return a:movement
   endif
endfunction
onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoreabbrev xdate <c-r>=strftime("%Y/%m/%d")<cr>
inoreabbrev xtime <c-r>=strftime("%Y/%m/%d %H:%M:%S")<cr>

"Move a line of text using ALT+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

""""""""""""""""""""""""""""""""""
" Log files
""""""""""""""""""""""""""""""""""
au Filetype conf set foldmethod=manual
au Filetype log set foldmethod=manual
" TODO: Doesn't work
" au Filetype nnoremap <C-f> V//\n\n<CR>zf
""""""""""""""""""""""""""""""""""
" Cenas dos plug-ins
""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 2014-11-04, AA: From http://robots.thoughtbot.com/vim-you-complete-me
" imap <Tab> <C-P>
" 2015/08/03 14:40:08, AA: Using snipmate from the actual repository
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

imap <C-Tab> <C-X><C-O>
set complete=.,b,u,]
set completeopt=menu,preview

autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"""""""""""""""""""""""""""""""""""""""""""""""""""
" C# stuff added by me, 31/07/11 12:04:47, 
" http://arun.wordpress.com/2009/04/10/c-and-vim/
" use za to toggle open/close fold under cursor
"""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType cs set omnifunc=syntaxcomplete#Complete
au FileType cs set foldmethod=marker
au FileType cs set foldmarker={,}
au FileType cs set foldtext=substitute(getline(v:foldstart),'{.*','{...}',)
au FileType cs set foldlevelstart=2

" Quickfix mode: command line msbuild error format
au FileType cs set errorformat=\ %#%f(%l\\\,%c):\ error\ CS%n:\ %m

autocmd BufEnter *.md exe 'noremap <leader>m :!start C:\Users\oiu027\AppData\Local\Google\Chrome\Application\chrome.exe %:p<CR>'

" Colocar o caminho do ficheiro de tags gerado com o Ctags
set tag=$VIMRUNTIME\ctags\alltags

""""""""""""""""""""""""""""""
" => yankRing with Unite
""""""""""""""""""""""""""""""
" 2015/07/27 13:04:49, AA: replaced YankRing with Unite
" 2016/11/08 11:47:03, AA: Now depends on a external neoyank.vim
let g:unite_source_history_yank_enable = 1
let g:unite_source_history_yank_save_clipboard = 1
let g:unite_source_history_yank_limit = 10000
let g:unite_source_history_yank_file = $HOME.'/.vim/yankring.txt'
" 2016/11/10 10:38:08, AA: From https://github.com/Shougo/unite.vim/issues/986
let g:unite_source_rec_async_command = [ 'ag', '-l', '-g', '', '--nocolor'  ]
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank register history/yank<cr>

" NERDTree
let NERDTreeHijackNetrw=0
let g:NERDTreeToggled=0
nnoremap <silent> <C-n>     :NERDTreeFind<CR>
nnoremap <silent> <leader>n :NERDTreeToggle<CR>


""""""""""""""""""""""""""""""
" => Git stuff
""""""""""""""""""""""""""""""

nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>ga :Gcommit --amend<CR>
nnoremap <leader>gt :Gcommit -v -q %<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Dispatch! git push<CR>
nnoremap <leader>gpl :Dispatch! git pull<CR>

nnoremap <C-e> :cnext<CR>
nnoremap <leader>< :cnext<CR>
nnoremap <C-b> :cprevious<CR>
nnoremap <leader>> :cprevious<CR>


""""""""""""""""""""""""""""""
" => Ledger stuff
""""""""""""""""""""""""""""""

if has('win32') || has('win64')
      let g:ledger_bin = 'C:/dados/programas/ledger/ledger.exe'
  else
      let g:ledger_bin = '/usr/local/bin/ledger'
endif

let g:ledger_maxwidth = 66
autocmd FileType ledger inoreabbrev con Assets:Bank:Conta Caderneta
autocmd FileType ledger inoreabbrev cas Assets:Cash:Carteira

nnoremap <F9> :call AllFoldsToggle()<CR>

function! AllFoldsToggle()
    if !exists('g:folds_open')
        let g:folds_open = 0
    endif

    if g:folds_open == 1
        " Close all folds
        execute "normal zM"
        let g:folds_open = 0
    else
        " Open all folds
        execute "normal zR"
        let g:folds_open = 1
    endif
endfunction

""""""""""""""""""""""""""""""
" => EasyAlign section
""""""""""""""""""""""""""""""
let g:easy_align_delimiters = {
\ '>': { 'pattern': '>>\|=>\|>' },
\ '/': {
\     'pattern':         '//\+\|/\*\|\*/',
\     'delimiter_align': 'l',
\     'ignore_groups':   ['!Comment'] },
\ ']': {
\     'pattern':       '[[\]]',
\     'left_margin':   0,
\     'right_margin':  0,
\     'stick_to_left': 0
\   },
\ ')': {
\     'pattern':       '[()]',
\     'left_margin':   0,
\     'right_margin':  0,
\     'stick_to_left': 0
\   },
\ 'd': {
\     'pattern':      ' \(\S\+\s*[;=]\)\@=',
\     'left_margin':  0,
\     'right_margin': 0
\   }
\ }

xmap ga <Plug>(EasyAlign)

" call camelcasemotion#CreateMotionMappings('<leader>')
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
" map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
" sunmap ge


""""""""""""""""""""""""""""""
" => Refactor stuff
""""""""""""""""""""""""""""""
nmap X *Nvar:s///gc<Left><Left><Left>

""""""""""""""""""""""""""""""
" => Ruby section
""""""""""""""""""""""""""""""
au FileType ruby set omnifunc=rubycomplete#Complete
au FileType ruby set shiftwidth=2
" 2016/11/18 12:12:35, AA: Too slow
" au FileType ruby iabbrev ,,p require "pry"; Pry.commands.alias_command "c", "continue"; Pry.commands.alias_command "s", "step"; Pry.commands.alias_command "n", "next"; Pry.commands.alias_command "x", "exit"; binding.pry
au FileType ruby iabbrev ,,p require "pry"; binding.pry

" au FileType ruby let g:rubycomplete_buffer_loading = 1
" au FileType ruby let g:rubycomplete_classes_in_global = 1


""""""""""""""""""""""""""""""
" => Text (prose) section
""""""""""""""""""""""""""""""
" 2014-11-10, AA: From https://github.com/junegunn/limelight.vim
autocmd User GoyoEnter Limelight
autocmd User GoyoEnter set textwidth=80
autocmd User GoyoLeave Limelight!
nnoremap <Leader>G :Goyo<CR>

" 2015/07/28 07:53:10, AA: Activate only limelight (highlight current paragraph)
" From: https://zenbro.github.io/2015/06/09/meditating-on-code.html
nmap <silent> <leader>L :Limelight!!<CR>
xmap <leader>L <Plug>(Limelight)

autocmd Filetype text set nocindent
autocmd Filetype text set formatoptions=tcqjn

""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 


""""""""""""""""""""""""""""""
" => Latex section
"""""""""""""""""""""""""""""""
" 2014-10-27, AA: latex indenting
let g:tex_flavor='latex'
let g:Tex_MultipleCompileFormats='dvi,pdf'
let g:Tex_DefaultTargetFormat = 'pdf'

au FileType tex set textwidth=80
au FileType tex set sw=2
au FileType tex set iskeyword+=:
au FileType tex nmap <leader>E :call LatexEn()<CR>
" 2015/11/08 23:05:11, AA: <leader>b builds document
au FileType tex nmap <leader>b :call Tex_RunLaTeX()<CR>
au FileType tex nmap <leader>v :call Tex_ViewLaTeX()<CR>
au FileType bib set textwidth=80

function! LatexEn()
  " 2014-12-13 12:30:44, AA: To add the things I deactivated on
  " C:\Users\lejboua\.vim\bundle\vim-latex\ftplugin\latex-suite\brackets.vim
  " * 2015/12/27 22:24:03, AA: Commented this and replaced by the imap lines
  " according to: http://vim-latex.sourceforge.net/faq.shtml#faq-euro-symbols
	" call Tex_MakeMap('<M-b>', '<Plug>Tex_MathBF', 'i', '<buffer> <silent>')
	" call Tex_MakeMap('<M-c>', '<Plug>Tex_MathCal', 'i', '<buffer> <silent>')
	" call Tex_MakeMap('<M-l>', '<Plug>Tex_LeftRight', 'i', '<buffer> <silent>')
	" call Tex_MakeMap('<M-b>', '<Plug>Tex_MathBF', 'v', '<buffer> <silent>')
	" call Tex_MakeMap('<M-c>', '<Plug>Tex_MathCal', 'v', '<buffer> <silent>')
	" call Tex_MakeMap('<M-l>', '<Plug>Tex_LeftRight', 'n', '<buffer> <silent>')
    imap <C-b> <Plug>Tex_MathBF
    imap <C-c> <Plug>Tex_MathCal
    imap <C-l> <Plug>Tex_LeftRight
  " 2015/12/27 22:25:58, AA: from http://vim-latex.sourceforge.net/faq.shtml#faq-e-acute
    imap <buffer> <leader>it <Plug>Tex_InsertItemOnThisLine
endfunction

""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> AJS.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return 
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction

""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
" let MRU_Max_Entries = 400
" map <leader>r :MRU<CR>
" 2015/07/27 11:27:03, AA: Replaced by Unite MRU
nnoremap <silent> <leader>r :<C-u>Unite file_mru<CR>

" 2015-03-24 08:48:43, AA: Em casa
if filereadable(expand("~/Dropbox/etc/2015.ledger"))
    map <leader>l :e ~/Dropbox/etc/2015.ledger<cr>Go<CR>
else
    map <leader>l :e Z:/Dropbox/etc/2015.ledger<cr>Go<CR>
endif

"Quickly open a buffer for scribble
map <leader>q :e ~/Dropbox/etc/scratchpad.txt<cr>
au BufRead,BufNewFile ~/Dropbox/etc/scratchpad.txt iab <buffer> xh1 ============================ <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr> ========

map <leader>pp :setlocal paste! paste?<cr>

map <leader>bb :cd ..<cr>

"""""""""""""""""""""""""""""""""""""""""""""
" => 2015-03-31 22:41:34, AA: Vim Unite Stuff
"""""""""""""""""""""""""""""""""""""""""""""
" 2017/01/30 16:30:21, AA: Disabled this and started using CtrlP, is much faster
" nnoremap <leader>F :Unite file<CR>
" nnoremap <leader>f :Unite -start-insert file_rec/async<CR>
" nnoremap <leader>x :Unite -quick-match buffer<CR>
" nnoremap <leader>gg :Unite -start-insert file_rec/git<CR>

" 2016/11/17 15:25:47, AA: unite-tag (ctags stuff)
let g:unite_source_tag_max_fname_length = 50
let g:unite_source_tag_max_name_length = 50


nnoremap <F10> :Unite -vertical -winwidth=50 outline<CR>
nnoremap <F7> :UniteWithCursorWord -immediately tag<CR>
nnoremap <F8> :<C-w>}

function! s:unite_settings() "{
    " C-c to exit Unite
    imap <buffer> <C-c> <Esc><Plug>(unite_all_exit)
    nmap <buffer> <C-c> <Plug>(unite_all_exit)
    " Enable navigation with alt-j and alt-k in insert mode
    imap <buffer> <M-j>     <Plug>(unite_select_next_line)
    imap <buffer> <M-k>     <Plug>(unite_select_previous_line)
    inoremap <silent> <buffer> <expr> <C-o><C-n> unite#do_action('tabopen')
    inoremap <silent> <buffer> <expr> <C-o><C-j> unite#do_action('below')
    inoremap <silent> <buffer> <expr> <C-o><C-k> unite#do_action('above')
    inoremap <silent> <buffer> <expr> <C-o><C-h> unite#do_action('left')
    inoremap <silent> <buffer> <expr> <C-o><C-l> unite#do_action('right')
endfunction

" 2015/07/27 13:32:48, AA:
" change prompt and start NOT in insert mode
  call unite#custom#profile('default', 'context',
                          \ { 'prompt': '» ',
                          \   'start_insert' : '0'})
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
  call unite#filters#sorter_default#use(['sorter_rank'])

autocmd Filetype unite call s:unite_settings()

" not blinking cursor
set guicursor=n:block-blinkon0-Cursor,v:block-blinkon0-VisualCursor,c-i-ci:ver25-blinkon0-Cursor,r-cr:hor16-blinkon0-Cursor

"""""""""""""""""""""""""""""""""""""""""""""
" => 2017/01/30 16:28:03, AA: CtrlP stuff, Unite is slow af
"""""""""""""""""""""""""""""""""""""""""""""
" nnoremap <leader>f :Unite -start-insert file_rec/async<CR>
nmap <Space> :CtrlPBuffer<CR>
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_map = '<leader>f'
let g:ctrlp_user_command = 'ag %s -i --nocolor -g ""
  \ --nogroup --hidden
  \ --ignore .git
  \ --ignore .svn
  \ --ignore .hg
  \ --ignore .DS_Store
  \ --ignore "**/*.pyc"
  \ --ignore node_modules'

" Sane Ignore For ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }


if executable('ag')
    let g:ackprg ='ag --nocolor --nogroup --column
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ --ignore node_modules
      \ --vimgrep'
endif

nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

""""""""""""""""""""""""""""""
" => Vim grep: Falta instalar o grep para o Windows
""""""""""""""""""""""""""""""
" let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
" set grepprg=/bin/grep\ -nH

""""""""""""""""""""""""""""""
" => Command-T: Plug-in giro
" para abrir ficheiros com um
" search rapido, mas precisa
" de ruby instalado, etc.
""""""""""""""""""""""""""""""
" let g:CommandTMaxHeight = 15
" set wildignore+=*.o,*.obj,.git,*.pyc
" noremap <leader>j :CommandT<cr>
" noremap <leader>y :CommandTFlush<cr>

" FIM cenas copiadas do amix_ultimate_vimrc

"set diffexpr=MyDiff()
"function MyDiff()
  "let opt = '-a --binary '
  "if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  "if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  "let arg1 = v:fname_in
  "if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  "let arg2 = v:fname_new
  "if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  "let arg3 = v:fname_out
  "if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  "let eq = ''
  "if $VIMRUNTIME =~ ' '
    "if &sh =~ '\<cmd'
      "let cmd = '""' . $VIMRUNTIME . '\diff"'
      "let eq = '"'
    "else
      "let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    "endif
  "else
    "let cmd = $VIMRUNTIME . '\diff'
  "endif
  "silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
"endfunction

" cores para a status line
hi User1 guifg=#eea040 guibg=#222222
hi User2 guifg=#dd3333 guibg=#222222
hi User3 guifg=#ff66ff guibg=#222222
hi User4 guifg=#a0ee40 guibg=#222222
hi User5 guifg=#eeee40 guibg=#222222

" 2014-11-04, AA: Vim-sneak, Alternativa ao Easymotion
let g:sneak#streak = 1
let g:sneak#s_next = 1
" 2017/03/07 15:17:16, AA: Only if Sneak is being used
nmap <expr> <Tab> sneak#is_sneaking() ? '<Plug>Sneak_;' : '<Tab>'

" 2014-11-03, AA: Easymotion plug-in
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" 2014-11-04, AA: Substitui pelo Vim-streak
" nmap s <Plug>(easymotion-s2)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" 2014-11-03, END

set number        " always show line numbers
set list

" 2014-12-07 13:30:20, AA:
" Define characters to show when you show formatting
" stolen from https://github.com/tpope/vim-sensible
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
    let &listchars = "tab:\u21e5,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
  endif
endif

" 2016/11/29 09:01:23, AA: Toggle zoom
" From: http://stackoverflow.com/a/26551079/687420

" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap \| :ZoomToggle<CR>
