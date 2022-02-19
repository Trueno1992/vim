let mapleader="t"
set nocompatible              " required
filetype on                   " 侦测文件类型
filetype plugin on            " 为特定文件类型载入相关缩进文件

if exists('$TMUX')
  set term=screen-256color
endif

"以下是ctags的设置
set tags=./tags
set tags=./tags,tags;$HOME             "(从当前目录开始一直往上层目录查找tags文件，直到$HOME)
let Tlist_Sort_Type = "name"           " 按照名称排序  
let Tlist_Use_Right_Window = 1         " 在右侧显示窗口  
let Tlist_Compart_Format = 1           " 压缩方式  
let Tlist_Exist_OnlyWindow = 1         " 如果只有一个buffer，kill窗口也kill掉buffer  
let Tlist_File_Fold_Auto_Close = 0     " 不要关闭其他文件的tags  
let Tlist_Enable_Fold_Column = 0       " 不要显示折叠树  
let Tlist_Show_One_File=1              " 不同时显示多个文件的tag，只显示当前文件的
autocmd FileType h,cpp,cc,c set tags+=/usr/include/tags
map  <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>        "按下F5重新生成tag文件，并更新taglist
imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>  "按下F5重新生成tag文件，并更新taglist

"以下是taglist的设置
nmap tt :Tlist<CR>
let Tlist_Auto_Open=1                  "默认打开Taglist
let Tlist_Ctags_Cmd = '/usr/bin/ctags' "ctag的安装路径
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口

" mru 的配置
nmap ff :MRU<CR>
let MRU_Include_Files = '\.c$\|\.h$\|\.cpp$\|\.hpp$\|.jce$\|.py$\|.log$\|.txt$'
let MRU_Window_Height = 15     "窗口高度
let MRU_Max_Menu_Entries = 15  "窗口中展示条数
let MRU_Max_Entries = 100
let MRU_Auto_Close = 0

"以下是cscope 的配置
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

let g:neocomplcache_enable_at_startup = 1
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab
set autoindent

set backspace=indent,eol,start

set history=200     " keep 50 lines of command line history
set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
set incsearch       " do incremental searching
set number

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

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

set wildmenu
set wildmode=longest:full,full

set t_ti=
set t_te=

nmap <left>  25h
nmap <right> 25l
nmap <down>  25j
nmap <up>    25k

highlight ExtraWhitespace ctermbg=red guibg=darkgreen
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$\| \+\ze\t/
