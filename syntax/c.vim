syn match kClassName "^\<[A-Z][a-zA-Z_0-9]*\> "
syn match kClassName "^\<[A-Z][a-zA-Z_0-9]*\> \* "
syn match kClassName "^\<[A-Z][a-zA-Z_0-9]*\>\* "
syn match kClassName "^\<[A-Z][a-zA-Z_0-9]*\> \*"
syn match kClassName "^\<[A-Z][a-zA-Z_0-9]*\>&"
hi kClassName guifg=#7fd02e cterm=bold ctermfg=DarkGreen


syn match cClass "\<[a-zA-Z_][a-zA-Z_0-9]*\>::"me=e-2
syn match cClass "::\<[A-Z][a-zA-Z_0-9]*\>\s*"ms=s+2
syn match cClass "::\<[A-Z][a-zA-Z_0-9]*\>&"ms=s+2,me=e-1
syn match cClass "::\<[A-Z][a-zA-Z_0-9]*\> &"ms=s+2,me=e-1
syn match cClass "::\<[A-Z][a-zA-Z_0-9]*\>\*"ms=s+2,me=e-1
syn match cClass "::\<[A-Z][a-zA-Z_0-9]*\> \*"ms=s+2,me=e-1

syn match cClass "<\<[A-Z][a-zA-Z_0-9]*\>\s*"ms=s+1
syn match cClass "<\<[A-Z][a-zA-Z_0-9]*\>&"ms=s+1,me=e-1
syn match cClass "<\<[A-Z][a-zA-Z_0-9]*\> &"ms=s+1,me=e-1
syn match cClass "<\<[A-Z][a-zA-Z_0-9]*\>\*"ms=s+1,me=e-1
syn match cClass "<\<[A-Z][a-zA-Z_0-9]*\> \*"ms=s+1,me=e-1

syn match cClass "[ ,]\<[A-Z][a-zA-Z_0-9]*\>[ ,]"ms=s+1,me=e-1
syn match cClass "[ ]\<[A-Z][a-zA-Z_0-9]*\>[ >]"ms=s+1,me=e-1
hi cClass guifg=#7fd02e cterm=bold ctermfg=DarkYellow

syn match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
syn match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
syn match cFunctions "::\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1,ms=s+2
hi cFunctions guifg=#7fd02e cterm=bold ctermfg=LightBlue

syn match KGLOBAL "\<[A-Z_][A-Z_0-9]*\>"
hi KGLOBAL guifg=#7fd02e cterm=bold ctermfg=DarkCyan

syn match map_hi display "[ :]map<"ms=s+1,me=e-1
syn match set_hi display "[ :]set<"ms=s+1,me=e-1
syn match queue_hi display "[ :]queue<"ms=s+1,me=e-1
syn match string_hi display "[ :]string"ms=s+1
syn match vector_hi display "[ :]vector<"ms=s+1,me=e-1
syn match unordered_map_hi display "[ :]unordered_map<"ms=s+1,me=e-1
syn match shared_ptr_hi display "[ :]shared_ptr<"ms=s+1,me=e-1
syn match pair_hi display "[ :]pair<"ms=s+1,me=e-1
syn match priority_queue_hi display "[ :]priority_queue<"ms=s+1,me=e-1

hi map_hi guifg=#7fd02e cterm=bold ctermfg=LightCyan
hi set_hi guifg=#7fd02e cterm=bold ctermfg=LightCyan
hi queue_hi guifg=#7fd02e cterm=bold ctermfg=LightCyan
hi vector_hi guifg=#7fd02e cterm=bold ctermfg=LightCyan
hi string_hi guifg=#7fd02e cterm=bold ctermfg=LightCyan
hi pair_hi guifg=#7fd02e cterm=bold ctermfg=LightCyan
hi unordered_map_hi guifg=#7fd02e cterm=bold ctermfg=LightCyan
hi shared_ptr_hi guifg=#7fd02e cterm=bold ctermfg=LightCyan
hi priority_queue_hi guifg=#7fd02e cterm=bold ctermfg=LightCyan

hi string ctermfg=LightRed guifg=#ADFF2F
