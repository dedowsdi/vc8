let  s:black   = [ '#000000', g:vc8_pallete.black ]
let  s:red     = [ '#000000', g:vc8_pallete.red ]
let  s:green   = [ '#000000', g:vc8_pallete.green ]
let  s:yellow  = [ '#000000', g:vc8_pallete.yellow ]
let  s:blue    = [ '#000000', g:vc8_pallete.blue ]
let  s:gray    = [ '#000000', g:vc8_pallete.gray ]
let  s:cyan    = [ '#000000', g:vc8_pallete.cyan ]
let  s:bwhite  = [ '#000000', g:vc8_pallete.bwhite ]
let  s:bblack  = [ '#000000', g:vc8_pallete.bblack ]
let  s:bred    = [ '#000000', g:vc8_pallete.bred ]
let  s:bgreen  = [ '#000000', g:vc8_pallete.bgreen ]
let  s:byellow = [ '#000000', g:vc8_pallete.byellow ]
let  s:bblue   = [ '#000000', g:vc8_pallete.bblue ]
let  s:orange  = [ '#000000', g:vc8_pallete.orange ]
let  s:bcyan   = [ '#000000', g:vc8_pallete.bcyan ]
let  s:white   = [ '#000000', g:vc8_pallete.white ]

" The color doesn't change by mode switch, vim already tell you current mode in
" the lower left corner.
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:black, s:cyan ], [ s:white, s:gray ] ]
let s:p.normal.right = [ [ s:black, s:cyan ], [ s:white, s:gray ] ]
let s:p.inactive.left =  [ [ s:white, s:gray ], [ s:white, s:gray ] ]
let s:p.inactive.right = [ [ s:white, s:gray ], [ s:white, s:gray ] ]
let s:p.normal.middle = [ [ s:bgreen, s:gray ] ]
let s:p.inactive.middle = [ [ s:blue, s:gray ] ]
let s:p.tabline.left = [ [ s:black, s:gray ] ]
let s:p.tabline.tabsel = [ [ s:black, s:cyan ] ]
let s:p.tabline.middle = [ [ s:gray, s:gray ] ]
let s:p.tabline.right = copy(s:p.normal.right)
let s:p.normal.error = [ [ s:black, s:red ] ]
let s:p.normal.warning = [ [ s:black, s:yellow ] ]

let g:lightline#colorscheme#vc8#palette = lightline#colorscheme#flatten(s:p)

" debug reload
" call lightline#init() | call lightline#colorscheme() | call lightline#update()
