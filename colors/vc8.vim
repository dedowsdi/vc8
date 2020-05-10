" adapted from https://github.com/morhetz/gruvbox/colors/gruvbox.vim by
" dedowsdi@outlook.com
"
"
" This color scheme is mostly used for 8 color terminal.
"
" --------------------
" For 8 color terminal:
"
" linux virtual console render bold fg color as bright fg color:
"
" hi ctermfg=1 cterm=bold
" 
" linux virtual console render blink bg color as bright bg color, vim don't
" support it. But it doesn't matter, since bright background is rarely needed.
" It also means you must place all your background colors at the 1st 8 palette slots.
"
" reverse won't work right if fg color >= 8.
"
" Search, IncSearch style highlight won't work right in linux console, the
" current fg color take effect for the new fg color, no idea why would that
" happen. A grey background can reduce that impact, so Search, IncSearch, Visual
" Diff* all use gray background.
"
" ---------------------
" For 16 color terminal:
"
" You must change your TERM to linux-16color for this to work.
"
" For at least reverse(inverse) attributes, fg_color = fg_color % 8.
" Which means you can't use reverse with brighter foreground to get brighter
" background.
"
" linux-16color might use 21 to turn off bold, if that won't work, you should
" recompile it to use 22 instead, see ncurse terminfo for detail.
"
" Screen-16color won't work by default, after replace it's setaf and setbf
" with linux-16color, the bold attribute becomes unstable, have no ider why
" would that happen.

hi clear
if exists('g:syntax_on')
 syntax reset
endif

let g:colors_name='vc8'
if &background !=# 'dark'
 set background=dark
endif

function s:hi(group, fg, ...) abort
  "                      bg, attributes

  if a:0 > 0 && a:1 >= 8
    echom a:group 'use bg ' a:1
  endif

  if type(a:fg) == v:t_number && a:fg >= 8
    let fg = a:fg - 8
    let attr = 'bold'
  else
    let fg = a:fg
    let attr = 'none'
  endif

  let bg = get(a:000, 0, 'bg')

  if a:0 > 1
    let attr .= ',' . a:2
  endif

  exe printf('hi %s cterm=%s ctermfg=%s ctermbg=%s', a:group, attr, fg, bg)
endfunction

let g:vc8_pallete = get(g:, 'vc8_pallete',
      \ {
      \   'black':   0,
      \   'red':     1,
      \   'green':   2,
      \   'yellow':  3,
      \   'blue':    4,
      \   'gray':    5,
      \   'cyan':    6,
      \   'bwhite':  7,
      \   'bblack':  8,
      \   'bred':    9,
      \   'bgreen':  10,
      \   'byellow': 11,
      \   'bblue':   12,
      \   'orange':  13,
      \   'bcyan':   14,
      \   'white':   15,
      \ })

let  s:black   = g:vc8_pallete.black
let  s:red     = g:vc8_pallete.red
let  s:green   = g:vc8_pallete.green
let  s:yellow  = g:vc8_pallete.yellow
let  s:blue    = g:vc8_pallete.blue
let  s:gray    = g:vc8_pallete.gray
let  s:cyan    = g:vc8_pallete.cyan
let  s:bwhite  = g:vc8_pallete.bwhite
let  s:bblack  = g:vc8_pallete.bblack
let  s:bred    = g:vc8_pallete.bred
let  s:bgreen  = g:vc8_pallete.bgreen
let  s:byellow = g:vc8_pallete.byellow
let  s:bblue   = g:vc8_pallete.bblue
let  s:orange  = g:vc8_pallete.orange
let  s:bcyan   = g:vc8_pallete.bcyan
let  s:white   = g:vc8_pallete.white

let s:bg0 = s:black
let s:bg1 = s:gray

let s:fg0 = s:white
let s:fg1 = s:bwhite

call s:hi('Normal', s:bwhite, s:black)

call s:hi('vc8_fg0', s:bwhite)
call s:hi('vc8_fg1', s:white)
call s:hi('vc8_bg0', s:black)
call s:hi('vc8_bg1', s:gray)

call s:hi('vc8_black',  s:black)
call s:hi('vc8_red',    s:red)
call s:hi('vc8_green',  s:green)
call s:hi('vc8_yellow', s:yellow)
call s:hi('vc8_blue',   s:blue)
call s:hi('vc8_gray',   s:gray)
call s:hi('vc8_cyan',   s:cyan)
call s:hi('vc8_white',  s:white)
call s:hi('vc8_bblack', s:bblack)
call s:hi('vc8_bred',   s:bred)
call s:hi('vc8_bgreen', s:bgreen)
call s:hi('vc8_byellow',s:byellow)
call s:hi('vc8_bblue',  s:bblue)
call s:hi('vc8_orange', s:orange)
call s:hi('vc8_bcyan',  s:bcyan)
call s:hi('vc8_bwhite', s:bwhite)

call s:hi('vc8_bred_sign', s:bred, s:gray)
call s:hi('vc8_bgreen_sign', s:bgreen, s:gray)
call s:hi('vc8_byellow_sign', s:byellow, s:gray)
call s:hi('vc8_bblue_sign', s:bblue, s:gray)
call s:hi('vc8_bpurple_sign', s:bblack, s:gray)
call s:hi('vc8_bcyan_sign', s:bcyan, s:gray)
call s:hi('vc8_orange_sign', s:orange, s:gray)

hi! link SpecialKey vc8_bg1

hi! link EndOfBuffer NonText

hi! link NonText vc8_bg1

hi! link Directory vc8_bgreen


call s:hi('ErrorMsg', s:bwhite, s:red)

hi! link MoreMsg vc8_byellow

hi! link ModeMsg vc8_byellow

call s:hi('LineNr', s:white, s:gray)

" hi LineNrAbove cleared
" hi LineNrBelow cleared

call s:hi('CursorLineNr', s:byellow, s:gray)

hi! link Question vc8_orange

call s:hi('StatusLine', s:bwhite, s:gray)
call s:hi('StatusLineNC', s:white, s:gray)
call s:hi('VertSplit', s:gray, s:black)

hi! link Title vc8_bgreen

call s:hi('Visual', s:orange, s:gray)

hi! link VisualNOS Visual

hi! link WarningMsg vc8_bred

call s:hi('WildMenu', s:orange, s:gray )

call s:hi('Folded', s:white, s:gray)
call s:hi('FoldColumn', s:orange, s:gray)

call s:hi('EiffChange', s:bcyan, s:gray )

call s:hi('DiffAdd', s:bcyan, s:gray )
call s:hi('DiffDelete', s:red, s:gray)
call s:hi('DiffText', s:orange, s:gray )

call s:hi('IncSearch', s:orange, s:gray)
call s:hi('Search', s:orange, s:gray)

call s:hi('SignColumn', 'fg', s:gray)

call s:hi('Conceal', s:bblue)

call s:hi('SpellBad', 'fg', 'bg', 'underline' )
call s:hi('SpellCap', 'fg', 'bg', 'underline' )
call s:hi('SpellRare', 'fg', 'bg', 'underline' )
call s:hi('SpellLocal', 'fg', 'bg', 'underline' )

call s:hi('Pmenu', s:bwhite, s:gray)
call s:hi('PmenuSel', s:black, s:blue)
call s:hi('PmenuSbar', 'fg', s:gray)
call s:hi('PmenuThumb', 'fg', s:gray)

hi! link TabLine TabLineFill
call s:hi('TabLineSel', s:black, s:cyan)
call s:hi('TabLineFill', s:gray, s:black)

hi! link CursorColumn CursorLine
call s:hi('CursorLine', 'fg', s:gray)
call s:hi('ColorColumn', 'fg', s:gray)

hi! link QuickFixLine Search

call s:hi('StatusLineTerm', s:white, s:gray, 'bold' )
call s:hi('StatusLineTermNC', s:black, s:gray)
call s:hi('Cursor', 'fg', 'bg', 'reverse')

hi! link lCurso Cursor

call s:hi('MatchParen', 'fg', s:gray, 'bold' )

call s:hi('ToolbarLine', s:black, s:yellow)
call s:hi('ToolbarButton', s:black, s:green)

call s:hi('Comment', s:white)

hi! link Constant vc8_bpurple

hi! link Special vc8_orange

hi! link Identifier vc8_bblue

hi! link Statement vc8_bred

hi! link PreProc vc8_bcyan

hi! link Type vc8_byellow

call s:hi('Underlined', s:bblue, 'bg', 'underline' )

call s:hi('Ignore', s:black)

call s:hi('Error', s:bwhite, s:red )

call s:hi('Todo', s:black, s:cyan)

call s:hi('String', s:bgreen)

hi! link Character vc8_bpurple

hi! link Number vc8_bpurple

hi! link Boolean vc8_bpurple

hi! link Float vc8_bpurple

hi! link Function vc8_bgreen

hi! link Conditional vc8_bred

hi! link Repeat vc8_bred

hi! link Label vc8_bred

hi! link Operator Normal

hi! link Keyword vc8_bred

hi! link Exception vc8_bred

hi! link Include vc8_bcyan

hi! link Define vc8_bcyan

hi! link Macro vc8_bcyan

hi! link PreCondit vc8_bcyan

hi! link StorageClass vc8_orange

hi! link Structure vc8_bcyan

hi! link Typedef vc8_byellow

hi! link Tag Special

hi! link SpecialChar Special

hi! link Delimiter Special

hi! link SpecialComment Special

hi! link Debug Special

hi! link vCursor Cursor

hi! link iCursor Cursor

hi! link EasyMotionTarget Search
hi! link EasyMotionShade Comment

hi! link Sneak Search
hi! link SneakLabel Search

call s:hi('IndentGuidesOdd', s:black, s:gray)
call s:hi('IndentGuidesEven', s:black, s:green)

hi! link GitGutterAdd vc8_bgreen_sign
hi! link GitGutterChange vc8_bcyan_sign
hi! link GitGutterDelete vc8_bred_sign
hi! link GitGutterChangeDelete vc8_bcyan_sign

hi! link gitcommitSelectedFile vc8_bgreen
hi! link gitcommitDiscardedFile vc8_bred

hi! link SignifySignAdd vc8_bgreen_sign
hi! link SignifySignChange vc8_bcyan_sign
hi! link SignifySignDelete vc8_bred_sign

call s:hi('SyntasticError', 'fg', 'bg', 'undercurl')
call s:hi('SyntasticWarning', 'fg', 'bg', 'undercurl')

hi! link SyntasticErrorSign vc8_bred_sign
hi! link SyntasticWarningSign vc8_byellow_sign

hi! link SignatureMarkText vc8_bblue_sign
hi! link SignatureMarkerText vc8_bpurple_sign

hi! link ShowMarksHLl vc8_bblue_sign
hi! link ShowMarksHLu vc8_bblue_sign
hi! link ShowMarksHLo vc8_bblue_sign
hi! link ShowMarksHLm vc8_bblue_sign

hi! link CtrlPMatch vc8_byellow
hi! link CtrlPNoEntries vc8_bred
hi! link CtrlPPrtBase vc8_bg1
hi! link CtrlPPrtCursor vc8_bblue
hi! link CtrlPLinePre vc8_bg1

call s:hi('CtrlPMode1', s:bblue, s:gray, 'bold' )
call s:hi('CtrlPMode2', s:black, s:blue, 'bold' )
call s:hi('CtrlPStats', s:white, s:gray, 'bold' )

hi! link StartifyBracket vc8_fg1
hi! link StartifyFile vc8_fg0
hi! link StartifyNumber vc8_bblue
hi! link StartifyPath vc8_fg1
hi! link StartifySlash vc8_fg1
hi! link StartifySection vc8_byellow
hi! link StartifySpecial vc8_bg1
hi! link StartifyHeader vc8_orange
hi! link StartifyFooter vc8_bg1

call s:hi('BufTabLineCurrent', s:black, s:cyan)
call s:hi('BufTabLineActive', s:black, s:green)
call s:hi('BufTabLineHidden', s:black, s:black)
call s:hi('BufTabLineFill', s:black, s:black)

call s:hi('ALEError', 'fg', 'bg', 'underline')
call s:hi('ALEWarning', 'fg', 'bg', 'underline')
call s:hi('ALEInfo',  'fg', 'bg', 'underline')

hi! link ALEErrorSign vc8_bred_sign
hi! link ALEWarningSign vc8_byellow_sign
hi! link ALEInfoSign vc8_bblue_sign

hi! link DirvishPathTail vc8_bcyan
hi! link DirvishArg vc8_byellow

hi! link netrwDir vc8_bcyan
hi! link netrwClassify vc8_bcyan
hi! link netrwLink vc8_fg1
hi! link netrwSymLink vc8_fg0
hi! link netrwExe vc8_byellow
hi! link netrwComment vc8_fg1
hi! link netrwList vc8_bblue
hi! link netrwHelpCmd vc8_bcyan
hi! link netrwCmdSep vc8_fg1
hi! link netrwVersion vc8_bgreen

hi! link NERDTreeDir vc8_bcyan
hi! link NERDTreeDirSlash vc8_bcyan
hi! link NERDTreeOpenable vc8_orange
hi! link NERDTreeClosable vc8_orange
hi! link NERDTreeFile vc8_fg0
hi! link NERDTreeExecFile vc8_byellow
hi! link NERDTreeUp vc8_fg1
hi! link NERDTreeCWD vc8_bgreen
hi! link NERDTreeHelp vc8_fg0
hi! link NERDTreeToggleOn vc8_bgreen
hi! link NERDTreeToggleOff vc8_bred

call s:hi('multiple_cursors_cursor', 'fg', 'bg', 'reverse')
call s:hi('multiple_cursors_visual', 'fg', s:gray)

hi! link CocErrorSign vc8_bred_sign
hi! link CocWarningSign vc8_orange_sign
hi! link CocInfoSign vc8_byellow_sign
hi! link CocHintSign vc8_bblue_sign
hi! link CocErrorFloat vc8_bred
hi! link CocWarningFloat vc8_orange
hi! link CocInfoFloat vc8_byellow
hi! link CocHintFloat vc8_bblue
hi! link CocDiagnosticsError vc8_bred
hi! link CocDiagnosticsWarning vc8_orange
hi! link CocDiagnosticsInfo vc8_byellow
hi! link CocDiagnosticsHint vc8_bblue
hi! link CocSelectedText vc8_bred
hi! link CocCodeLens vc8_fg1

call s:hi('CocErrorHighlight', 'fg', 'bg', 'undercurl')
call s:hi('CocWarningHighlight', 'fg', 'bg', 'undercurl')
call s:hi('CocInfoHighlight', 'fg', 'bg', 'undercurl')
call s:hi('CocHintHighlight', 'fg', 'bg', 'undercurl')

hi! link diffAdded vc8_bgreen
hi! link diffRemoved vc8_bred
hi! link diffChanged vc8_bcyan
hi! link diffFile vc8_orange
hi! link diffNewFile vc8_byellow
hi! link diffLine vc8_bblue

hi! link htmlTag vc8_bblue
hi! link htmlEndTag vc8_bblue
hi! link htmlTagName vc8_bcyan
hi! link htmlArg vc8_bcyan
hi! link htmlScriptTag vc8_bpurple
hi! link htmlTagN vc8_fg0
hi! link htmlSpecialTagName vc8_bcyan
call s:hi('htmlLink', s:white, 'bg', 'underline' )
hi! link htmlSpecialChar vc8_orange
call s:hi('htmlBold', s:bwhite, s:black, 'bold' )
call s:hi('htmlBoldUnderline', s:bwhite, s:black, 'bold,underline' )
call s:hi('htmlBoldItalic', s:bwhite, s:black, 'bold' )
call s:hi('htmlBoldUnderlineItalic', s:bwhite, s:black, 'bold,underline' )
call s:hi('htmlUnderline', s:bwhite, s:black, 'underline' )
call s:hi('htmlUnderlineItalic', s:bwhite, s:black, 'underline' )
call s:hi('htmlItalic', s:bwhite, s:black)

hi! link xmlTag vc8_bblue
hi! link xmlEndTag vc8_bblue
hi! link xmlTagName vc8_bblue
hi! link xmlEqual vc8_bblue

hi! link docbkKeyword vc8_bcyan

hi! link xmlDocTypeDecl vc8_fg1
hi! link xmlDocTypeKeyword vc8_bpurple
hi! link xmlCdataStart vc8_fg1
hi! link xmlCdataCdata vc8_bpurple

hi! link dtdFunction vc8_fg1
hi! link dtdTagName vc8_bpurple

hi! link xmlAttrib vc8_bcyan
hi! link xmlProcessingDelim vc8_fg1

hi! link dtdParamEntityPunct vc8_fg1
hi! link dtdParamEntityDPunct vc8_fg1

hi! link xmlAttribPunct vc8_fg1
hi! link xmlEntity vc8_orange
hi! link xmlEntityPunct vc8_orange

call s:hi('vimCommentTitle', s:white, 'bg', 'bold' )

hi! link vimNotation vc8_orange
hi! link vimBracket vc8_orange
hi! link vimMapModKey vc8_orange
hi! link vimFuncSID vc8_fg1
hi! link vimSetSep vc8_fg1
hi! link vimSep vc8_fg1
hi! link vimContinue vc8_fg1

hi! link clojureKeyword vc8_bblue
hi! link clojureCond vc8_orange
hi! link clojureSpecial vc8_orange
hi! link clojureDefine vc8_orange
hi! link clojureFunc vc8_byellow
hi! link clojureRepeat vc8_byellow
hi! link clojureCharacter vc8_bcyan
hi! link clojureStringEscape vc8_bcyan
hi! link clojureException vc8_bred
hi! link clojureRegexp vc8_bcyan
hi! link clojureRegexpEscape vc8_bcyan

call s:hi('clojureRegexpCharClass', s:white, 'bg', 'bold' )

hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass
hi! link clojureParen vc8_fg1
hi! link clojureAnonArg vc8_byellow
hi! link clojureVariable vc8_bblue
hi! link clojureMacro vc8_orange
hi! link clojureMeta vc8_byellow
hi! link clojureDeref vc8_byellow
hi! link clojureQuote vc8_byellow
hi! link clojureUnquote vc8_byellow

hi! link cOperator vc8_bpurple
hi! link cStructure vc8_orange

hi! link pythonBuiltin vc8_orange
hi! link pythonBuiltinObj vc8_orange
hi! link pythonBuiltinFunc vc8_orange
hi! link pythonFunction vc8_bcyan
hi! link pythonDecorator vc8_bred
hi! link pythonInclude vc8_bblue
hi! link pythonImport vc8_bblue
hi! link pythonRun vc8_bblue
hi! link pythonCoding vc8_bblue
hi! link pythonOperator vc8_bred
hi! link pythonException vc8_bred
hi! link pythonExceptions vc8_bpurple
hi! link pythonBoolean vc8_bpurple
hi! link pythonDot vc8_fg1
hi! link pythonConditional vc8_bred
hi! link pythonRepeat vc8_bred
hi! link pythonDottedName vc8_bgreen

hi! link cssBraces vc8_bblue
hi! link cssFunctionName vc8_byellow
hi! link cssIdentifier vc8_orange
hi! link cssClassName vc8_bgreen
hi! link cssColor vc8_bblue
hi! link cssSelectorOp vc8_bblue
hi! link cssSelectorOp2 vc8_bblue
hi! link cssImportant vc8_bgreen
hi! link cssVendor vc8_fg0
hi! link cssTextProp vc8_bcyan
hi! link cssAnimationProp vc8_bcyan
hi! link cssUIProp vc8_byellow
hi! link cssTransformProp vc8_bcyan
hi! link cssTransitionProp vc8_bcyan
hi! link cssPrintProp vc8_bcyan
hi! link cssPositioningProp vc8_byellow
hi! link cssBoxProp vc8_bcyan
hi! link cssFontDescriptorProp vc8_bcyan
hi! link cssFlexibleBoxProp vc8_bcyan
hi! link cssBorderOutlineProp vc8_bcyan
hi! link cssBackgroundProp vc8_bcyan
hi! link cssMarginProp vc8_bcyan
hi! link cssListProp vc8_bcyan
hi! link cssTableProp vc8_bcyan
hi! link cssFontProp vc8_bcyan
hi! link cssPaddingProp vc8_bcyan
hi! link cssDimensionProp vc8_bcyan
hi! link cssRenderProp vc8_bcyan
hi! link cssColorProp vc8_bcyan
hi! link cssGeneratedContentProp vc8_bcyan

hi! link javaScriptBraces vc8_fg0
hi! link javaScriptFunction vc8_bcyan
hi! link javaScriptIdentifier vc8_orange
hi! link javaScriptMember vc8_bblue
hi! link javaScriptNumber vc8_bpurple
hi! link javaScriptNull vc8_bpurple
hi! link javaScriptParens vc8_fg1
hi! link javascriptImport vc8_bcyan
hi! link javascriptExport vc8_bcyan
hi! link javascriptClassKeyword vc8_bcyan
hi! link javascriptClassExtends vc8_bcyan
hi! link javascriptDefault vc8_bcyan
hi! link javascriptClassName vc8_byellow
hi! link javascriptClassSuperName vc8_byellow
hi! link javascriptGlobal vc8_byellow
hi! link javascriptEndColons vc8_fg0
hi! link javascriptFuncArg vc8_fg0
hi! link javascriptGlobalMethod vc8_fg0
hi! link javascriptNodeGlobal vc8_fg0
hi! link javascriptBOMWindowProp vc8_fg0
hi! link javascriptArrayMethod vc8_fg0
hi! link javascriptArrayStaticMethod vc8_fg0
hi! link javascriptCacheMethod vc8_fg0
hi! link javascriptDateMethod vc8_fg0
hi! link javascriptMathStaticMethod vc8_fg0
hi! link javascriptURLUtilsProp vc8_fg0
hi! link javascriptBOMNavigatorProp vc8_fg0
hi! link javascriptDOMDocMethod vc8_fg0
hi! link javascriptDOMDocProp vc8_fg0
hi! link javascriptBOMLocationMethod vc8_fg0
hi! link javascriptBOMWindowMethod vc8_fg0
hi! link javascriptStringMethod vc8_fg0
hi! link javascriptVariable vc8_orange
hi! link javascriptClassSuper vc8_orange
hi! link javascriptFuncKeyword vc8_bcyan
hi! link javascriptAsyncFunc vc8_bcyan
hi! link javascriptClassStatic vc8_orange
hi! link javascriptOperator vc8_bred
hi! link javascriptForOperator vc8_bred
hi! link javascriptYield vc8_bred
hi! link javascriptExceptions vc8_bred
hi! link javascriptMessage vc8_bred
hi! link javascriptTemplateSB vc8_bcyan
hi! link javascriptTemplateSubstitution vc8_fg0
hi! link javascriptLabel vc8_fg0
hi! link javascriptObjectLabel vc8_fg0
hi! link javascriptPropertyName vc8_fg0
hi! link javascriptLogicSymbols vc8_fg0
hi! link javascriptArrowFunc vc8_byellow
hi! link javascriptDocParamName vc8_fg1
hi! link javascriptDocTags vc8_fg1
hi! link javascriptDocNotation vc8_fg1
hi! link javascriptDocParamType vc8_fg1
hi! link javascriptDocNamedParamType vc8_fg1
hi! link javascriptBrackets vc8_fg0
hi! link javascriptDOMElemAttrs vc8_fg0
hi! link javascriptDOMEventMethod vc8_fg0
hi! link javascriptDOMNodeMethod vc8_fg0
hi! link javascriptDOMStorageMethod vc8_fg0
hi! link javascriptHeadersMethod vc8_fg0
hi! link javascriptAsyncFuncKeyword vc8_bred
hi! link javascriptAwaitFuncKeyword vc8_bred

hi! link jsClassKeyword vc8_bcyan
hi! link jsExtendsKeyword vc8_bcyan
hi! link jsExportDefault vc8_bcyan
hi! link jsTemplateBraces vc8_bcyan
hi! link jsGlobalNodeObjects vc8_fg0
hi! link jsGlobalObjects vc8_fg0
hi! link jsFunction vc8_bcyan
hi! link jsFuncParens vc8_fg1
hi! link jsParens vc8_fg1
hi! link jsNull vc8_bpurple
hi! link jsUndefined vc8_bpurple
hi! link jsClassDefinition vc8_byellow

hi! link typeScriptReserved vc8_bcyan
hi! link typeScriptLabel vc8_bcyan
hi! link typeScriptFuncKeyword vc8_bcyan
hi! link typeScriptIdentifier vc8_orange
hi! link typeScriptBraces vc8_fg0
hi! link typeScriptEndColons vc8_fg0
hi! link typeScriptDOMObjects vc8_fg0
hi! link typeScriptAjaxMethods vc8_fg0
hi! link typeScriptLogicSymbols vc8_fg0
hi! link typeScriptDocSeeTag Comment
hi! link typeScriptDocParam Comment
hi! link typeScriptDocTags vimCommentTitle
hi! link typeScriptGlobalObjects vc8_fg0
hi! link typeScriptParens vc8_fg1
hi! link typeScriptOpSymbols vc8_fg1
hi! link typeScriptHtmlElemProperties vc8_fg0
hi! link typeScriptNull vc8_bpurple
hi! link typeScriptInterpolationDelimiter vc8_bcyan

hi! link purescriptModuleKeyword vc8_bcyan
hi! link purescriptModuleName vc8_fg0
hi! link purescriptWhere vc8_bcyan
hi! link purescriptDelimiter vc8_fg1
hi! link purescriptType vc8_fg0
hi! link purescriptImportKeyword vc8_bcyan
hi! link purescriptHidingKeyword vc8_bcyan
hi! link purescriptAsKeyword vc8_bcyan
hi! link purescriptStructure vc8_bcyan
hi! link purescriptOperator vc8_bblue
hi! link purescriptTypeVar vc8_fg0
hi! link purescriptConstructor vc8_fg0
hi! link purescriptFunction vc8_fg0
hi! link purescriptConditional vc8_orange
hi! link purescriptBacktick vc8_orange

hi! link coffeeExtendedOp vc8_fg1
hi! link coffeeSpecialOp vc8_fg1
hi! link coffeeCurly vc8_orange
hi! link coffeeParen vc8_fg1
hi! link coffeeBracket vc8_orange

hi! link rubyStringDelimiter vc8_bgreen
hi! link rubyInterpolationDelimiter vc8_bcyan

hi! link objcTypeModifier vc8_bred
hi! link objcDirective vc8_bblue

hi! link goDirective vc8_bcyan

hi! link goConstants vc8_bpurple

hi! link goDeclaration vc8_bred
hi! link goDeclType vc8_bblue

hi! link goBuiltins vc8_orange

hi! link luaIn vc8_bred
hi! link luaFunction vc8_bcyan
hi! link luaTable vc8_orange

hi! link moonSpecialOp vc8_fg1
hi! link moonExtendedOp vc8_fg1
hi! link moonFunction vc8_fg1
hi! link moonObject vc8_byellow

hi! link javaAnnotation vc8_bblue
hi! link javaDocTags vc8_bcyan
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen vc8_fg1
hi! link javaParen1 vc8_fg1
hi! link javaParen2 vc8_fg1
hi! link javaParen3 vc8_fg1
hi! link javaParen4 vc8_fg1
hi! link javaParen5 vc8_fg1
hi! link javaOperator vc8_orange
hi! link javaVarArg vc8_bgreen

hi! link elixirDocString Comment
hi! link elixirStringDelimiter vc8_bgreen
hi! link elixirInterpolationDelimiter vc8_bcyan
hi! link elixirModuleDeclaration vc8_byellow

hi! link scalaNameDefinition vc8_fg0
hi! link scalaCaseFollowing vc8_fg0
hi! link scalaCapitalWord vc8_fg0
hi! link scalaTypeExtension vc8_fg0
hi! link scalaKeyword vc8_bred
hi! link scalaKeywordModifier vc8_bred
hi! link scalaSpecial vc8_bcyan
hi! link scalaOperator vc8_fg0
hi! link scalaTypeDeclaration vc8_byellow
hi! link scalaTypeTypePostDeclaration vc8_byellow
hi! link scalaInstanceDeclaration vc8_fg0
hi! link scalaInterpolation vc8_bcyan

call s:hi('markdownItalic', s:white)

hi! link markdownH1 vc8_bgreen
hi! link markdownH2 vc8_bgreen
hi! link markdownH3 vc8_byellow
hi! link markdownH4 vc8_byellow
hi! link markdownH5 vc8_byellow
hi! link markdownH6 vc8_byellow
hi! link markdownCode vc8_bcyan
hi! link markdownCodeBlock vc8_bcyan
hi! link markdownCodeDelimiter vc8_bcyan
hi! link markdownBlockquote vc8_fg1
hi! link markdownListMarker vc8_fg1
hi! link markdownOrderedListMarker vc8_fg1
hi! link markdownRule vc8_fg1
hi! link markdownHeadingRule vc8_fg1
hi! link markdownUrlDelimiter vc8_fg1
hi! link markdownLinkDelimiter vc8_fg1
hi! link markdownLinkTextDelimiter vc8_fg1
hi! link markdownHeadingDelimiter vc8_orange
hi! link markdownUrl vc8_bpurple
hi! link markdownUrlTitleDelimiter vc8_bgreen

call s:hi('markdownLinkText', s:white, 'bg', 'underline' )

hi! link markdownIdDeclaration markdownLinkText

hi! link haskellType vc8_fg0
hi! link haskellIdentifier vc8_fg0
hi! link haskellSeparator vc8_fg0
hi! link haskellDelimiter vc8_fg1
hi! link haskellOperators vc8_bblue
hi! link haskellBacktick vc8_orange
hi! link haskellStatement vc8_orange
hi! link haskellConditional vc8_orange
hi! link haskellLet vc8_bcyan
hi! link haskellDefault vc8_bcyan
hi! link haskellWhere vc8_bcyan
hi! link haskellBottom vc8_bcyan
hi! link haskellBlockKeywords vc8_bcyan
hi! link haskellImportKeywords vc8_bcyan
hi! link haskellDeclKeyword vc8_bcyan
hi! link haskellDeriving vc8_bcyan
hi! link haskellAssocType vc8_bcyan
hi! link haskellNumber vc8_bpurple
hi! link haskellPragma vc8_bpurple
hi! link haskellString vc8_bgreen
hi! link haskellChar vc8_bgreen

hi! link jsonKeyword vc8_bgreen
hi! link jsonQuote vc8_bgreen
hi! link jsonBraces vc8_fg0
hi! link jsonString vc8_fg0

hi! link ExchangeRegion IncSearch

hi! link _exchange_region ExchangeRegion

call s:hi('CocUnderline', 'fg', 'bg', 'underline')

hi! link CocHighlightText CursorColumn
hi! link CocFloating Pmenu
hi! link CocHoverRange Search
hi! link CocCursorRange Search
hi! link CocHighlightRead CocHighlightText
hi! link CocHighlightWrite CocHighlightText

call s:hi('debugPC', 'bg', s:yellow)
call s:hi('debugBreakpoint', 'fg', s:red)

hi! link hare_all Comment

" hi CocErrorLine cleared
" hi CocWarningLine cleared
" hi CocInfoLine cleared
" hi CocHintLine cleared
" hi CocSelectedLine cleared

hi! link vimTodo Todo
hi! link vimCommand Statement
" hi vimStdPlugin cleared
hi! link vimOption PreProc
hi! link vimErrSetting vimError
hi! link vimAutoEvent Type
hi! link vimGroup Type
hi! link vimHLGroup vimGroup
hi! link vimFuncName Function
" hi vimGlobal cleared
hi! link vimSubst vimCommand
hi! link vimComment Comment
hi! link vimNumber Number
hi! link vimAddress vimMark
hi! link vimAutoCmd vimCommand
" hi vimEcho cleared
" hi vimIsCommand cleared
" hi vimExtCmd cleared
" hi vimFilter cleared
hi! link vimLet vimCommand
hi! link vimMap vimCommand
hi! link vimMark Number
" hi vimSet cleared
hi! link vimSyntax vimCommand
" hi vimUserCmd cleared
" hi vimCmdSep cleared
hi! link vimVar Identifier
hi! link vimFBVar vimVar
hi! link vimInsert vimString
hi! link vimBehaveModel vimBehave
hi! link vimBehaveError vimError
hi! link vimBehave vimCommand
hi! link vimFTCmd vimCommand
hi! link vimFTOption vimSynType
hi! link vimFTError vimError
" hi vimFiletype cleared
" hi vimAugroup cleared
" hi vimExecute cleared
hi! link vimNotFunc vimCommand
" hi vimFunction cleared
hi! link vimFunctionError vimError
hi! link vimLineComment vimComment
hi! link vimSpecFile Identifier
hi! link vimOper Operator
" hi vimOperParen cleared
hi! link vimString String
hi! link vimRegister SpecialChar
hi! link vimCmplxRepeat SpecialChar
" hi vimRegion cleared
" hi vimSynLine cleared
hi! link vimCtrlChar SpecialChar
hi! link vimFuncVar Identifier
" hi vimSetEqual cleared
hi! link vimAugroupKey vimCommand
hi! link vimAugroupError vimError
hi! link vimEnvvar PreProc
hi! link vimFunc vimError
hi! link vim9Comment Comment
hi! link vimParenSep Delimiter
hi! link vimOperError Error
hi! link vimFuncKey vimCommand
hi! link vimAbb vimCommand
hi! link vimEchoHL vimCommand
hi! link vimHighlight vimCommand
hi! link vimLetHereDoc vimString
hi! link vimNorm vimCommand
hi! link vimSearch vimString
hi! link vimUnmap vimMap
hi! link vimUserCommand vimCommand
" hi vimFuncBody cleared
" hi vimFuncBlank cleared
hi! link vimPattern Type
hi! link vimSpecFileMod vimSpecFile
" hi vimEscapeBrace cleared
hi! link vimSetString vimString
" hi vimSubstRep cleared
" hi vimSubstRange cleared
hi! link vimUserAttrb vimSpecial
hi! link vimUserAttrbError Error
hi! link vimUserAttrbKey vimOption
hi! link vimUserAttrbCmplt vimSpecial
hi! link vimUserCmdError Error
hi! link vimUserAttrbCmpltFunc Special
hi! link vimCommentString vimString
hi! link vimPatSepErr vimError
hi! link vimPatSep SpecialChar
hi! link vimPatSepZ vimPatSep
hi! link vimPatSepZone vimString
hi! link vimPatSepR vimPatSep
" hi vimPatRegion cleared
hi! link vimNotPatSep vimString
hi! link vimStringEnd vimString
hi! link vimStringCont vimString
hi! link vimSubstTwoBS vimString
hi! link vimSubstSubstr SpecialChar
" hi vimCollection cleared
" hi vimSubstPat cleared
hi! link vimSubst1 vimSubst
" hi vimSubst2 cleared
hi! link vimSubstDelim Delimiter
" hi vimSubstRep4 cleared
hi! link vimSubstFlagErr vimError
" hi vimCollClass cleared
hi! link vimCollClassErr vimError
hi! link vimSubstFlags Special
hi! link vimMarkNumber vimNumber
hi! link vimPlainMark vimMark
" hi vimRange cleared
hi! link vimPlainRegister vimRegister
hi! link vimSetMod vimOption
hi! link vimLetHereDocStart Special
hi! link vimLetHereDocStop Special
hi! link vimMapMod vimBracket
" hi vimMapLhs cleared
" hi vimAutoCmdSpace cleared
" hi vimAutoEventList cleared
" hi vimAutoCmdSfxList cleared
hi! link vimEchoHLNone vimGroup
hi! link vimMapBang vimCommand
" hi vimMapRhs cleared
hi! link vimMapModErr vimError
" hi vimMapRhsExtend cleared
" hi vimMenuBang cleared
" hi vimMenuPriority cleared
hi! link vimMenuName PreProc
hi! link vimMenuMod vimMapMod
hi! link vimMenuNameMore vimMenuName
" hi vimMenuMap cleared
" hi vimMenuRhs cleared
hi! link vimUserFunc Normal
hi! link vimElseIfErr Error
hi! link vimBufnrWarn vimWarn
" hi vimNormCmds cleared
hi! link vimGroupSpecial Special
" hi vimGroupList cleared
hi! link vimSynError Error
hi! link vimSynContains vimSynOption
hi! link vimSynKeyContainedin vimSynContains
hi! link vimSynNextgroup vimSynOption
hi! link vimSynType vimSpecial
" hi vimAuSyntax cleared
hi! link vimSynCase Type
hi! link vimSynCaseError vimError
" hi vimClusterName cleared
hi! link vimGroupName vimGroup
hi! link vimGroupAdd vimSynOption
hi! link vimGroupRem vimSynOption
" hi vimIskList cleared
hi! link vimIskSep Delimiter
hi! link vimSynKeyOpt vimSynOption
" hi vimSynKeyRegion cleared
hi! link vimMtchComment vimComment
hi! link vimSynMtchOpt vimSynOption
hi! link vimSynRegPat vimString
" hi vimSynMatchRegion cleared
" hi vimSynMtchCchar cleared
" hi vimSynMtchGroup cleared
hi! link vimSynPatRange vimString
hi! link vimSynNotPatRange vimSynRegPat
hi! link vimSynRegOpt vimSynOption
hi! link vimSynReg Type
hi! link vimSynMtchGrp vimSynOption
" hi vimSynRegion cleared
" hi vimSynPatMod cleared
hi! link vimSyncC Type
" hi vimSyncLines cleared
" hi vimSyncMatch cleared
hi! link vimSyncError Error
" hi vimSyncLinebreak cleared
" hi vimSyncLinecont cleared
" hi vimSyncRegion cleared
hi! link vimSyncGroupName vimGroupName
hi! link vimSyncKey Type
hi! link vimSyncGroup vimGroupName
hi! link vimSyncNone Type
" hi vimHiLink cleared
hi! link vimHiClear vimHighlight
" hi vimHiKeyList cleared
hi! link vimHiCtermError vimError
" hi vimHiBang cleared
hi! link vimHiGroup vimGroupName
hi! link vimHiAttrib PreProc
hi! link vimFgBgAttrib vimHiAttrib
hi! link vimHiAttribList vimError
" hi vimHiCtermColor cleared
" hi vimHiFontname cleared
" hi vimHiGuiFontname cleared
hi! link vimHiGuiRgb vimNumber
hi! link vimHiTerm Type
hi! link vimHiCTerm vimHiTerm
hi! link vimHiStartStop vimHiTerm
hi! link vimHiCtermFgBg vimHiTerm
hi! link vimHiGui vimHiTerm
hi! link vimHiGuiFont vimHiTerm
hi! link vimHiGuiFgBg vimHiTerm
hi! link vimHiKeyError vimError
" hi vimHiTermcap cleared
hi! link vimHiNmbr Number
hi! link vim9LineComment vimComment
" hi vimCommentTitleLeader cleared
hi! link vimSearchDelim Statement
hi! link vimEmbedError vimError
" hi vimPythonRegion cleared

hi! link pythonStatement Statement
hi! link pythonAsync Statement
hi! link pythonDecoratorName Function
hi! link pythonDoctestValue Define
" hi pythonMatrixMultiply cleared
hi! link pythonTodo Todo
hi! link pythonComment Comment
hi! link pythonQuotes String
hi! link pythonEscape Special
hi! link pythonString String
hi! link pythonTripleQuotes pythonQuotes
" hi pythonSpaceError cleared
hi! link pythonDoctest Special
hi! link pythonRawString String
hi! link pythonNumber Number
" hi pythonAttribute cleared
" hi pythonSync cleared

hi! link vimScriptDelim Comment
" hi vimAugroupSyncA cleared
hi! link vimError Error
hi! link vimKeyCodeError vimError
hi! link vimWarn WarningMsg
hi! link vimAuHighlight vimHighlight
hi! link vimAutoCmdOpt vimOption
hi! link vimAutoSet vimCommand
hi! link vimCondHL vimCommand
hi! link vimElseif vimCondHL
hi! link vimFold Folded
hi! link vimSynOption Special
hi! link vimHLMod PreProc
hi! link vimKeyCode vimSpecFile
hi! link vimKeyword Statement
hi! link vimSpecial Type
hi! link vimStatement Statement

" vim: set sw=2 =2 sts=2 et fdm=marker:
