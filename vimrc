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
map  <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q . <CR><CR> :TlistUpdate<CR>        "按下F5重新生成tag文件，并更新taglist
imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q . <CR><CR> :TlistUpdate<CR>   "按下F5重新生成tag文件，并更新taglist

"以下是taglist的设置
nmap tt :Tlist<CR><CR> 00<CR>
let Tlist_Auto_Open=1                  "默认打开Taglist
let Tlist_Ctags_Cmd = '/usr/bin/ctags' "ctag的安装路径
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口

" mru 的配置
nmap ff :MRU<CR>
let MRU_Include_Files = '\.c$\|\.h$\|\.cpp$\|\.hpp$\|.jce$\|.py$\|.log$\|.txt$'
let MRU_Window_Height = 35     "窗口高度
let MRU_Max_Menu_Entries = 35  "窗口中展示条数
let MRU_Max_Entries = 100
let MRU_Auto_Close = 1

" tabedit 配置
nmap <C-h> <ESC>:tabp<CR>
nmap <C-l> <ESC>:tabn<CR>
nmap <C-t> <ESC>:tabedit
nmap g0 <ESC>:tabn 0<CR>
nmap g1 <ESC>:tabn 1<CR>
nmap g2 <ESC>:tabn 2<CR>
nmap g3 <ESC>:tabn 3<CR>
nmap g4 <ESC>:tabn 4<CR>
nmap g5 <ESC>:tabn 5<CR>
nmap g6 <ESC>:tabn 6<CR>
nmap g7 <ESC>:tabn 7<CR>
nmap g8 <ESC>:tabn 8<CR>
nmap g9 <ESC>:tabn 9<CR>
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1 
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T' 
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' ' 
            let wn = tabpagewinnr(i,'$')

            let s .= (i== t ? '%#TabNumSel#' : '%#TabNum#')
            let s .= i
            if tabpagewinnr(i,'$') > 1 
                let s .= '.' 
                let s .= (i== t ? '%#TabWinNumSel#' : '%#TabWinNum#')
                let s .= (tabpagewinnr(i,'$') > 1 ? wn : '') 
            end
            let s .= ' %*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr,'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file,'.*\/\ze.','','')
                endif
            else
                let file = fnamemodify(file,':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= file
            "let s .= (i == t ? '%m' : '')
            let i = i + 1 
        endwhile
        let s .= '%T%#TabLineFill#%='
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
endif
set tabpagemax=15
hi TabLineSel term=bold cterm=bold ctermfg=16 ctermbg=229
hi TabWinNumSel term=bold cterm=bold ctermfg=90 ctermbg=229
hi TabNumSel term=bold cterm=bold ctermfg=16 ctermbg=229
hi TabLine term=underline ctermfg=16 ctermbg=145
hi TabWinNum term=bold cterm=bold ctermfg=90 ctermbg=145
hi TabNum term=bold cterm=bold ctermfg=16 ctermbg=145

" 以下是lookupfile
let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
if filereadable("./filenametags")                "设置tag文件的名字
    let g:LookupFile_TagExpr = '"./filenametags"'
endif
map  <F6> :!sh ~/.vim/sh/genfiletags.sh<CR><CR>

" 以下是cscope 的配置
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
set numberwidth=1   " 去掉行号前的空格

set history=200     " keep 50 lines of command line history
set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
set incsearch       " do incremental searching
set number
set cindent

syntax on
set hlsearch

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

"nmap 44  <C-w>l
"nmap 33  <C-w>h
"nmap 11  <C-w>k
"nmap 22  <C-w>j
nmap 00 <C-w><C-w>

nmap ge $
nmap ga _
nnoremap -dd "_dd
nnoremap -dw "_dw
nnoremap -d$ "_d$

set wildmenu
set wildmode=longest:full,full

set t_ti=
set t_te=

"nmap <left>  25h
"nmap <right> 25l
"nmap <down>  25j
"nmap <up>    25k

highlight ExtraWhitespace ctermbg=red guibg=darkgreen
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$\| \+\ze\t/
