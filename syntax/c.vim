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
syn match cClass "[ ,]\<[A-Z][a-zA-Z_0-9]*\>[ ,]"ms=s+1,me=e-1
hi cClass guifg=#7fd02e cterm=bold ctermfg=brown

syn match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
syn match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
syn match cFunctions "::\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1,ms=s+2
hi cFunctions guifg=#7fd02e cterm=bold ctermfg=LightBlue

syn match KGLOBAL "\<[A-Z_][A-Z_0-9]*\>"
hi KGLOBAL guifg=#7fd02e cterm=bold ctermfg=DarkCyan


"============= Highlight All Math Operator ====================
" C math operators
"syn match cMathOperator display "[-+\*/%=]"
" C pointer operators
"syn match cPointerOperator display "->\|\."
" C logical operators - boolean results
"syn match cLogicalOperator display "[!<>]=\="
"syn match cLogicalOperator display "=="
" C bit operators
"syn match cBinaryOperator display "&\||\|\^\|<<\|>>=\="
"syn match cBinaryOperator display "\~"
"syn match cBinaryOperatorError display "\~="
" More C logical operators
"syn match cLogicalOperator display "&&\|||"
"syn match cLogicalOperatorError display "&&\|||="

" ==================== Math Operator ==========================
"hi cMathOperator           ctermfg=gray guifg=#ADFF2F
"hi cPointerOperator        ctermfg=gray guifg=#ADFF2F
"hi cLogicalOperator        ctermfg=gray guifg=#ADFF2F
"hi cBinaryOperator         ctermfg=gray guifg=#ADFF2F
"hi cBinaryOperatorError    ctermfg=gray guifg=#ADFF2F
"hi cLogicalOperator        ctermfg=gray guifg=#ADFF2F
"hi cLogicalOperatorError   ctermfg=gray guifg=#ADFF2F
"
syn match map_hi display "map"
syn match set_hi display "set"
syn match queue_hi display "queue"
syn match string_hi display "string"
syn match vector_hi display "vector"
syn match unordered_map_hi display "unordered_map"

hi map_hi ctermfg=LightBlue guifg=#ADFF2F
hi set_hi ctermfg=LightBlue guifg=#ADFF2F
hi queue_hi ctermfg=LightBlue guifg=#ADFF2F
hi vector_hi ctermfg=LightBlue guifg=#ADFF2F
hi string_hi ctermfg=LightBlue guifg=#ADFF2F
hi unordered_map_hi ctermfg=LightBlue guifg=#ADFF2F

hi string ctermfg=LightRed guifg=#ADFF2F

