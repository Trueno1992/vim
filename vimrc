let mapleader="t"
if exists('$TMUX')
  set term=screen-256color
endif

set tags=./tags
set tags=./tags,tags;$HOME "(从当前目录开始一直往上层目录查找tags文件，直到$HOME)

let Tlist_Auto_Open=1
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Show_One_File = 1 "不同时显示多个文件的tag，只显示当前文件的 
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim 
let Tlist_Use_Right_Window = 1 "在右侧窗口中显示taglist窗口

if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set csverb
    set cspc=3
    "add any database in current dir
    let cscope_file=findfile("cscope.out",".;")
    let cscope_pre=matchstr(cscope_file,".*/")

    if filereadable("cscope.out")
        "cs add cscope.out
    else
        "else search cscope.out elsewhere
        if !empty(cscope_file) && filereadable(cscope_file)
            set nocsverb
            exe "cs add" cscope_file cscope_pre
            set csverb
        endif
    endif
endif

set nocompatible              " required
filetype off                   " required

"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"Bundle 'mru.vim'
"Plugin 'https://github.com/preservim/tagbar.git'
"Plugin 'https://github.com/inkarkat/vim-mark.git'
"Plugin 'https://github.com/preservim/nerdtree.git'
"Plugin 'mhinz/vim-startify' 
"'https://github.com/inside/vim-interestingwords.git'
"call vundle#end()
"filetype plugin indent on

let g:neocomplcache_enable_at_startup = 1 
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab
set autoindent

set backspace=indent,eol,start

set history=50      " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch       " do incremental searching

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au! 

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END 

else
  set autoindent        " always set autoindenting on

endif " has("autocmd")

set number

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

nmap <C-]> g]
highlight extraSpace ctermbg=red guibg=red
match extraSpace /\v\s+$/
filetype plugin on
let g:pydiction_location = '~/.vim/after/ftplugin/pydiction/complete-dict'
let g:pydiction_menu_height = 20
:set noic
if filereadable(expand("~/.vimrc.bundles"))
      source ~/.vimrc.bundles
endif
:set viminfo='1000,<500
:colorscheme delek
hi Type ctermfg =yellow
hi Comment ctermfg =gray
highlight Pmenu ctermbg=darkred
highlight PmenuSel ctermbg=red ctermfg=yellow

nmap ~ :nohlsearch<CR>

nmap 44 <C-w>l
nmap 33 <C-w>h
nmap 11 <C-w>j
nmap 22 <C-w>k
nmap 00 <C-w><C-w>

nmap ff :MRU<CR>
let MRU_Include_Files = '\.c$\|\.h$\|\.cpp$\|\.hpp$\|.jce$\|.py$\|.log$\|.txt$'
let MRU_Window_Height = 15     "窗口高度
let MRU_Max_Menu_Entries = 11  "窗口中展示条数
let MRU_Max_Entries = 100 
let MRU_Auto_Close = 0 

autocmd VimEnter *, exec Init()
func Init()
    if &filetype == ''
        :MRU
    endif
endfunc

nmap ge $
nmap ga _
nnoremap -dd "_dd
nnoremap -dw "_dw
nnoremap -d$ "_d$
nmap <F2> :NERDTreeToggle<CR>
set wildmenu
set wildmode=longest:full,full

set t_ti=
set t_te=

nmap <left> 25h
nmap <right> 25l
nmap <down> 25j
nmap <up> 25k

highlight ExtraWhitespace ctermbg=red guibg=darkgreen
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$\| \+\ze\t/
