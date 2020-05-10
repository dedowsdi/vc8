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

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:black, s:cyan ], [ s:black, s:green ] ]
let s:p.normal.right = [ [ s:black, s:cyan ], [ s:black, s:green ] ]
let s:p.inactive.right = [ [ s:black, s:white ], [ s:black, s:white ] ]
let s:p.inactive.left =  [ [ s:bblue, s:black ], [ s:yellow, s:black ] ]
let s:p.insert.left = [ [ s:black, s:green ], [ s:black, s:green ] ]
let s:p.replace.left = [ [ s:bwhite, s:red ], [ s:black, s:green ] ]
let s:p.visual.left = [ [ s:black, s:yellow ], [ s:black, s:green ] ]
let s:p.normal.middle = [ [ s:bgreen, s:gray ] ]
let s:p.inactive.middle = [ [ s:blue, s:gray ] ]
let s:p.tabline.left = [ [ s:black, s:white ] ]
let s:p.tabline.tabsel = [ [ s:black, s:blue ] ]
let s:p.tabline.middle = [ [ s:black, s:black ] ]
let s:p.tabline.right = copy(s:p.normal.right)
let s:p.normal.error = [ [ s:black, s:red ] ]
let s:p.normal.warning = [ [ s:black, s:yellow ] ]

let g:lightline#colorscheme#vc8#palette = lightline#colorscheme#flatten(s:p)

call lightline#init() | call lightline#colorscheme() | call lightline#update()
