" adapted from https://github.com/morhetz/gruvbox/colors/gruvbox.vim by
" dedowsdi@outlook.com
"
"
" This color scheme is used for 16 color terminal.
"
" You must change your TERM to linux-16color for this to work.
"
" For at least reverse(inverse) attributes, fg_color = fg_color % 8.
" Which means you can't use reverse with brighter foreground to get brighter
" background.
"
" linux-16color might use 21 to turn off bold, if that doesn't work, you should
" recompile it to use 22 instead, see ncurse terminfo for detail.
"
" Screen-16color won't work by default, after replace it's setaf and setbf
" with linux-16color, the bold attribute becomes unstable, have no ider why
" would that happen.

hi clear
if exists('g:syntax_on')
 syntax reset
endif

let g:colors_name='vc16'
if &background !=# 'dark'
 set background=dark
endif

function s:hi(group, fg, ...) abort
  "                      bg, attributes

  let bg = get(a:000, 0, 'bg')
  let attr = get(a:000, 1, 'none')
  exe printf('hi %s cterm=%s ctermfg=%s ctermbg=%s', a:group, attr, a:fg, bg)
endfunction

let g:vc16_pallete = {
      \   'black':   0,
      \   'red':     1,
      \   'green':   2,
      \   'yellow':  3,
      \   'blue':    4,
      \   'purple':  5,
      \   'cyan':    6,
      \   'bwhite':  7,
      \   'bblack':  8,
      \   'bred':    9,
      \   'bgreen':  10,
      \   'byellow': 11,
      \   'bblue':   12,
      \   'bpurple': 13,
      \   'bcyan':   14,
      \   'white':   15,
      \   'gray':    8,
      \   'orange':  5,
      \ }

let  s:black   = g:vc16_pallete.black
let  s:red     = g:vc16_pallete.red
let  s:green   = g:vc16_pallete.green
let  s:yellow  = g:vc16_pallete.yellow
let  s:blue    = g:vc16_pallete.blue
let  s:gray    = g:vc16_pallete.gray
let  s:cyan    = g:vc16_pallete.cyan
let  s:bwhite  = g:vc16_pallete.bwhite
let  s:bblack  = g:vc16_pallete.bblack
let  s:bred    = g:vc16_pallete.bred
let  s:bgreen  = g:vc16_pallete.bgreen
let  s:byellow = g:vc16_pallete.byellow
let  s:bblue   = g:vc16_pallete.bblue
let  s:bpurple   = g:vc16_pallete.bpurple
let  s:orange  = g:vc16_pallete.orange
let  s:bcyan   = g:vc16_pallete.bcyan
let  s:white   = g:vc16_pallete.white

let s:bg0 = s:black
let s:bg1 = s:gray

let s:fg0 = s:white
let s:fg1 = s:bwhite

call s:hi('Normal', s:bwhite, s:black)

call s:hi('vc16_fg0', s:bwhite)
call s:hi('vc16_fg1', s:white)
call s:hi('vc16_bg0', s:black)
call s:hi('vc16_bg1', s:gray)

call s:hi('vc16_black',  s:black)
call s:hi('vc16_red',    s:red)
call s:hi('vc16_green',  s:green)
call s:hi('vc16_yellow', s:yellow)
call s:hi('vc16_blue',   s:blue)
call s:hi('vc16_gray',   s:gray)
call s:hi('vc16_cyan',   s:cyan)
call s:hi('vc16_white',  s:white)
call s:hi('vc16_bblack', s:bblack)
call s:hi('vc16_bred',   s:bred)
call s:hi('vc16_bgreen', s:bgreen)
call s:hi('vc16_byellow',s:byellow)
call s:hi('vc16_bblue',  s:bblue)
call s:hi('vc16_orange', s:orange)
call s:hi('vc16_bcyan',  s:bcyan)
call s:hi('vc16_bwhite', s:bwhite)

call s:hi('vc16_red_sign', s:bred, s:gray)
call s:hi('vc16_green_sign', s:bgreen, s:gray)
call s:hi('vc16_yellow_sign', s:byellow, s:gray)
call s:hi('vc16_blue_sign', s:bblue, s:gray)
call s:hi('vc16_purple_sign', s:bpurple, s:gray)
call s:hi('vc16_aqua_sign', s:bcyan, s:gray)
call s:hi('vc16_orange_sign', s:red, s:gray)

hi! link SpecialKey vc16_bg1

hi! link EndOfBuffer NonText

hi! link NonText vc16_bg1

hi! link Directory vc16_bgreen


call s:hi('ErrorMsg', s:bwhite, s:red)

hi! link MoreMsg vc16_byellow

hi! link ModeMsg vc16_byellow

call s:hi('LineNr', s:white, s:gray)

" hi LineNrAbove cleared
" hi LineNrBelow cleared

call s:hi('CursorLineNr', s:black, s:yellow)

hi! link Question vc16_orange

call s:hi('StatusLine', s:bwhite, s:gray)
call s:hi('StatusLineNC', s:white, s:gray)
call s:hi('VertSplit', s:gray, s:black)

hi! link Title vc16_bgreen

call s:hi('Visual', s:orange, s:gray)

hi! link VisualNOS Visual

hi! link WarningMsg vc16_bred

call s:hi('WildMenu', s:black, s:bblue)

call s:hi('Folded', s:white, s:gray)
call s:hi('FoldColumn', s:orange, s:gray)

call s:hi('EiffChange', s:bcyan, s:gray )

call s:hi('DiffAdd', s:black, s:green )
call s:hi('DiffChange', s:black, s:cyan )
call s:hi('DiffDelete', s:black, s:red)
call s:hi('DiffText', s:black, s:orange )

call s:hi('IncSearch', s:black, s:orange)
call s:hi('Search', s:black, s:yellow)

call s:hi('SignColumn', 'fg', s:gray)

call s:hi('Conceal', s:bblue)

call s:hi('SpellBad', 'fg', 'bg', 'underline' )
call s:hi('SpellCap', 'fg', 'bg', 'underline' )
call s:hi('SpellRare', 'fg', 'bg', 'underline' )
call s:hi('SpellLocal', 'fg', 'bg', 'underline' )

call s:hi('Pmenu', s:bwhite, s:gray)
call s:hi('PmenuSel', s:black, s:bblue)
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

hi! link Constant vc16_bpurple

hi! link Special vc16_orange

hi! link Identifier vc16_bblue

hi! link Statement vc16_bred

hi! link PreProc vc16_baqua

hi! link Type vc16_byellow

call s:hi('Underlined', s:bblue, 'bg', 'underline' )

call s:hi('Ignore', s:black)

call s:hi('Error', s:bwhite, s:red )

call s:hi('Todo', s:bpurple, s:gray)

call s:hi('String', s:bgreen)

hi! link Character vc16_bpurple

hi! link Number vc16_bpurple

hi! link Boolean vc16_bpurple

hi! link Float vc16_bpurple

hi! link Function vc16_bgreen

hi! link Conditional vc16_bred

hi! link Repeat vc16_bred

hi! link Label vc16_bred

hi! link Operator Normal

hi! link Keyword vc16_bred

hi! link Exception vc16_bred

hi! link Include vc16_baqua

hi! link Define vc16_baqua

hi! link Macro vc16_baqua

hi! link PreCondit vc16_baqua

hi! link StorageClass vc16_orange

hi! link Structure vc16_baqua

hi! link Typedef vc16_byellow

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

hi! link GitGutterAdd vc16_green_sign
hi! link GitGutterChange vc16_aqua_sign
hi! link GitGutterDelete vc16_red_sign
hi! link GitGutterChangeDelete vc16_aqua_sign

hi! link gitcommitSelectedFile vc16_bgreen
hi! link gitcommitDiscardedFile vc16_bred

hi! link SignifySignAdd vc16_green_sign
hi! link SignifySignChange vc16_aqua_sign
hi! link SignifySignDelete vc16_red_sign

call s:hi('SyntasticError', 'fg', 'bg', 'undercurl')
call s:hi('SyntasticWarning', 'fg', 'bg', 'undercurl')

hi! link SyntasticErrorSign vc16_red_sign
hi! link SyntasticWarningSign vc16_yellow_sign

hi! link SignatureMarkText vc16_blue_sign
hi! link SignatureMarkerText vc16_purple_sign

hi! link ShowMarksHLl vc16_blue_sign
hi! link ShowMarksHLu vc16_blue_sign
hi! link ShowMarksHLo vc16_blue_sign
hi! link ShowMarksHLm vc16_blue_sign

hi! link CtrlPMatch vc16_byellow
hi! link CtrlPNoEntries vc16_bred
hi! link CtrlPPrtBase vc16_bg1
hi! link CtrlPPrtCursor vc16_bblue
hi! link CtrlPLinePre vc16_bg1

call s:hi('CtrlPMode1', s:bblue, s:gray, 'bold' )
call s:hi('CtrlPMode2', s:black, s:blue, 'bold' )
call s:hi('CtrlPStats', s:white, s:gray, 'bold' )

hi! link StartifyBracket vc16_fg1
hi! link StartifyFile vc16_fg0
hi! link StartifyNumber vc16_bblue
hi! link StartifyPath vc16_fg1
hi! link StartifySlash vc16_fg1
hi! link StartifySection vc16_byellow
hi! link StartifySpecial vc16_bg1
hi! link StartifyHeader vc16_orange
hi! link StartifyFooter vc16_bg1

call s:hi('BufTabLineCurrent', s:black, s:cyan)
call s:hi('BufTabLineActive', s:black, s:green)
call s:hi('BufTabLineHidden', s:black, s:black)
call s:hi('BufTabLineFill', s:black, s:black)

call s:hi('ALEError', 'none', 'none', 'underline')
call s:hi('ALEWarning', 'none', 'none', 'underline')
call s:hi('ALEInfo', 'none', 'none', 'underline')

hi! link ALEErrorSign vc16_red_sign
hi! link ALEWarningSign vc16_yellow_sign
hi! link ALEInfoSign vc16_blue_sign

hi! link DirvishPathTail vc16_baqua
hi! link DirvishArg vc16_byellow

hi! link netrwDir vc16_baqua
hi! link netrwClassify vc16_baqua
hi! link netrwLink vc16_fg1
hi! link netrwSymLink vc16_fg0
hi! link netrwExe vc16_byellow
hi! link netrwComment vc16_fg1
hi! link netrwList vc16_bblue
hi! link netrwHelpCmd vc16_baqua
hi! link netrwCmdSep vc16_fg1
hi! link netrwVersion vc16_bgreen

hi! link NERDTreeDir vc16_baqua
hi! link NERDTreeDirSlash vc16_baqua
hi! link NERDTreeOpenable vc16_orange
hi! link NERDTreeClosable vc16_orange
hi! link NERDTreeFile vc16_fg0
hi! link NERDTreeExecFile vc16_byellow
hi! link NERDTreeUp vc16_fg1
hi! link NERDTreeCWD vc16_bgreen
hi! link NERDTreeHelp vc16_fg0
hi! link NERDTreeToggleOn vc16_bgreen
hi! link NERDTreeToggleOff vc16_bred

call s:hi('multiple_cursors_cursor', 'fg', 'bg', 'reverse')
call s:hi('multiple_cursors_visual', 'fg', s:gray)

hi! link CocErrorSign vc16_red_sign
hi! link CocWarningSign vc16_orange_sign
hi! link CocInfoSign vc16_yellow_sign
hi! link CocHintSign vc16_blue_sign
hi! link CocErrorFloat vc16_bred
hi! link CocWarningFloat vc16_orange
hi! link CocInfoFloat vc16_byellow
hi! link CocHintFloat vc16_bblue
hi! link CocDiagnosticsError vc16_bred
hi! link CocDiagnosticsWarning vc16_orange
hi! link CocDiagnosticsInfo vc16_byellow
hi! link CocDiagnosticsHint vc16_bblue
hi! link CocSelectedText vc16_bred
hi! link CocCodeLens vc16_fg1

call s:hi('CocErrorHighlight', 'fg', 'bg', 'undercurl')
call s:hi('CocWarningHighlight', 'fg', 'bg', 'undercurl')
call s:hi('CocInfoHighlight', 'fg', 'bg', 'undercurl')
call s:hi('CocHintHighlight', 'fg', 'bg', 'undercurl')

hi! link diffAdded vc16_bgreen
hi! link diffRemoved vc16_bred
hi! link diffChanged vc16_baqua
hi! link diffFile vc16_orange
hi! link diffNewFile vc16_byellow
hi! link diffLine vc16_bblue

hi! link htmlTag vc16_bblue
hi! link htmlEndTag vc16_bblue
hi! link htmlTagName vc16_baqua
hi! link htmlArg vc16_baqua
hi! link htmlScriptTag vc16_bpurple
hi! link htmlTagN vc16_fg0
hi! link htmlSpecialTagName vc16_baqua
call s:hi('htmlLink', s:white, 'bg', 'underline' )
hi! link htmlSpecialChar vc16_orange
call s:hi('htmlBold', s:bwhite, s:black, 'bold' )
call s:hi('htmlBoldUnderline', s:bwhite, s:black, 'bold,underline' )
call s:hi('htmlBoldItalic', s:bwhite, s:black, 'bold' )
call s:hi('htmlBoldUnderlineItalic', s:bwhite, s:black, 'bold,underline' )
call s:hi('htmlUnderline', s:bwhite, s:black, 'underline' )
call s:hi('htmlUnderlineItalic', s:bwhite, s:black, 'underline' )
call s:hi('htmlItalic', s:bwhite, s:black)

hi! link xmlTag vc16_bblue
hi! link xmlEndTag vc16_bblue
hi! link xmlTagName vc16_bblue
hi! link xmlEqual vc16_bblue

hi! link docbkKeyword vc16_baqua

hi! link xmlDocTypeDecl vc16_fg1
hi! link xmlDocTypeKeyword vc16_bpurple
hi! link xmlCdataStart vc16_fg1
hi! link xmlCdataCdata vc16_bpurple

hi! link dtdFunction vc16_fg1
hi! link dtdTagName vc16_bpurple

hi! link xmlAttrib vc16_baqua
hi! link xmlProcessingDelim vc16_fg1

hi! link dtdParamEntityPunct vc16_fg1
hi! link dtdParamEntityDPunct vc16_fg1

hi! link xmlAttribPunct vc16_fg1
hi! link xmlEntity vc16_orange
hi! link xmlEntityPunct vc16_orange

call s:hi('vimCommentTitle', s:white, 'bg', 'bold' )

hi! link vimNotation vc16_orange
hi! link vimBracket vc16_orange
hi! link vimMapModKey vc16_orange
hi! link vimFuncSID vc16_fg1
hi! link vimSetSep vc16_fg1
hi! link vimSep vc16_fg1
hi! link vimContinue vc16_fg1

hi! link clojureKeyword vc16_bblue
hi! link clojureCond vc16_orange
hi! link clojureSpecial vc16_orange
hi! link clojureDefine vc16_orange
hi! link clojureFunc vc16_byellow
hi! link clojureRepeat vc16_byellow
hi! link clojureCharacter vc16_baqua
hi! link clojureStringEscape vc16_baqua
hi! link clojureException vc16_bred
hi! link clojureRegexp vc16_baqua
hi! link clojureRegexpEscape vc16_baqua

call s:hi('clojureRegexpCharClass', s:white, 'bg', 'bold' )

hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass
hi! link clojureParen vc16_fg1
hi! link clojureAnonArg vc16_byellow
hi! link clojureVariable vc16_bblue
hi! link clojureMacro vc16_orange
hi! link clojureMeta vc16_byellow
hi! link clojureDeref vc16_byellow
hi! link clojureQuote vc16_byellow
hi! link clojureUnquote vc16_byellow

hi! link cOperator vc16_bpurple
hi! link cStructure vc16_orange

hi! link pythonBuiltin vc16_orange
hi! link pythonBuiltinObj vc16_orange
hi! link pythonBuiltinFunc vc16_orange
hi! link pythonFunction vc16_baqua
hi! link pythonDecorator vc16_bred
hi! link pythonInclude vc16_bblue
hi! link pythonImport vc16_bblue
hi! link pythonRun vc16_bblue
hi! link pythonCoding vc16_bblue
hi! link pythonOperator vc16_bred
hi! link pythonException vc16_bred
hi! link pythonExceptions vc16_bpurple
hi! link pythonBoolean vc16_bpurple
hi! link pythonDot vc16_fg1
hi! link pythonConditional vc16_bred
hi! link pythonRepeat vc16_bred
hi! link pythonDottedName vc16_bgreen

hi! link cssBraces vc16_bblue
hi! link cssFunctionName vc16_byellow
hi! link cssIdentifier vc16_orange
hi! link cssClassName vc16_bgreen
hi! link cssColor vc16_bblue
hi! link cssSelectorOp vc16_bblue
hi! link cssSelectorOp2 vc16_bblue
hi! link cssImportant vc16_bgreen
hi! link cssVendor vc16_fg0
hi! link cssTextProp vc16_baqua
hi! link cssAnimationProp vc16_baqua
hi! link cssUIProp vc16_byellow
hi! link cssTransformProp vc16_baqua
hi! link cssTransitionProp vc16_baqua
hi! link cssPrintProp vc16_baqua
hi! link cssPositioningProp vc16_byellow
hi! link cssBoxProp vc16_baqua
hi! link cssFontDescriptorProp vc16_baqua
hi! link cssFlexibleBoxProp vc16_baqua
hi! link cssBorderOutlineProp vc16_baqua
hi! link cssBackgroundProp vc16_baqua
hi! link cssMarginProp vc16_baqua
hi! link cssListProp vc16_baqua
hi! link cssTableProp vc16_baqua
hi! link cssFontProp vc16_baqua
hi! link cssPaddingProp vc16_baqua
hi! link cssDimensionProp vc16_baqua
hi! link cssRenderProp vc16_baqua
hi! link cssColorProp vc16_baqua
hi! link cssGeneratedContentProp vc16_baqua

hi! link javaScriptBraces vc16_fg0
hi! link javaScriptFunction vc16_baqua
hi! link javaScriptIdentifier vc16_orange
hi! link javaScriptMember vc16_bblue
hi! link javaScriptNumber vc16_bpurple
hi! link javaScriptNull vc16_bpurple
hi! link javaScriptParens vc16_fg1
hi! link javascriptImport vc16_baqua
hi! link javascriptExport vc16_baqua
hi! link javascriptClassKeyword vc16_baqua
hi! link javascriptClassExtends vc16_baqua
hi! link javascriptDefault vc16_baqua
hi! link javascriptClassName vc16_byellow
hi! link javascriptClassSuperName vc16_byellow
hi! link javascriptGlobal vc16_byellow
hi! link javascriptEndColons vc16_fg0
hi! link javascriptFuncArg vc16_fg0
hi! link javascriptGlobalMethod vc16_fg0
hi! link javascriptNodeGlobal vc16_fg0
hi! link javascriptBOMWindowProp vc16_fg0
hi! link javascriptArrayMethod vc16_fg0
hi! link javascriptArrayStaticMethod vc16_fg0
hi! link javascriptCacheMethod vc16_fg0
hi! link javascriptDateMethod vc16_fg0
hi! link javascriptMathStaticMethod vc16_fg0
hi! link javascriptURLUtilsProp vc16_fg0
hi! link javascriptBOMNavigatorProp vc16_fg0
hi! link javascriptDOMDocMethod vc16_fg0
hi! link javascriptDOMDocProp vc16_fg0
hi! link javascriptBOMLocationMethod vc16_fg0
hi! link javascriptBOMWindowMethod vc16_fg0
hi! link javascriptStringMethod vc16_fg0
hi! link javascriptVariable vc16_orange
hi! link javascriptClassSuper vc16_orange
hi! link javascriptFuncKeyword vc16_baqua
hi! link javascriptAsyncFunc vc16_baqua
hi! link javascriptClassStatic vc16_orange
hi! link javascriptOperator vc16_bred
hi! link javascriptForOperator vc16_bred
hi! link javascriptYield vc16_bred
hi! link javascriptExceptions vc16_bred
hi! link javascriptMessage vc16_bred
hi! link javascriptTemplateSB vc16_baqua
hi! link javascriptTemplateSubstitution vc16_fg0
hi! link javascriptLabel vc16_fg0
hi! link javascriptObjectLabel vc16_fg0
hi! link javascriptPropertyName vc16_fg0
hi! link javascriptLogicSymbols vc16_fg0
hi! link javascriptArrowFunc vc16_byellow
hi! link javascriptDocParamName vc16_fg1
hi! link javascriptDocTags vc16_fg1
hi! link javascriptDocNotation vc16_fg1
hi! link javascriptDocParamType vc16_fg1
hi! link javascriptDocNamedParamType vc16_fg1
hi! link javascriptBrackets vc16_fg0
hi! link javascriptDOMElemAttrs vc16_fg0
hi! link javascriptDOMEventMethod vc16_fg0
hi! link javascriptDOMNodeMethod vc16_fg0
hi! link javascriptDOMStorageMethod vc16_fg0
hi! link javascriptHeadersMethod vc16_fg0
hi! link javascriptAsyncFuncKeyword vc16_bred
hi! link javascriptAwaitFuncKeyword vc16_bred

hi! link jsClassKeyword vc16_baqua
hi! link jsExtendsKeyword vc16_baqua
hi! link jsExportDefault vc16_baqua
hi! link jsTemplateBraces vc16_baqua
hi! link jsGlobalNodeObjects vc16_fg0
hi! link jsGlobalObjects vc16_fg0
hi! link jsFunction vc16_baqua
hi! link jsFuncParens vc16_fg1
hi! link jsParens vc16_fg1
hi! link jsNull vc16_bpurple
hi! link jsUndefined vc16_bpurple
hi! link jsClassDefinition vc16_byellow

hi! link typeScriptReserved vc16_baqua
hi! link typeScriptLabel vc16_baqua
hi! link typeScriptFuncKeyword vc16_baqua
hi! link typeScriptIdentifier vc16_orange
hi! link typeScriptBraces vc16_fg0
hi! link typeScriptEndColons vc16_fg0
hi! link typeScriptDOMObjects vc16_fg0
hi! link typeScriptAjaxMethods vc16_fg0
hi! link typeScriptLogicSymbols vc16_fg0
hi! link typeScriptDocSeeTag Comment
hi! link typeScriptDocParam Comment
hi! link typeScriptDocTags vimCommentTitle
hi! link typeScriptGlobalObjects vc16_fg0
hi! link typeScriptParens vc16_fg1
hi! link typeScriptOpSymbols vc16_fg1
hi! link typeScriptHtmlElemProperties vc16_fg0
hi! link typeScriptNull vc16_bpurple
hi! link typeScriptInterpolationDelimiter vc16_baqua

hi! link purescriptModuleKeyword vc16_baqua
hi! link purescriptModuleName vc16_fg0
hi! link purescriptWhere vc16_baqua
hi! link purescriptDelimiter vc16_fg1
hi! link purescriptType vc16_fg0
hi! link purescriptImportKeyword vc16_baqua
hi! link purescriptHidingKeyword vc16_baqua
hi! link purescriptAsKeyword vc16_baqua
hi! link purescriptStructure vc16_baqua
hi! link purescriptOperator vc16_bblue
hi! link purescriptTypeVar vc16_fg0
hi! link purescriptConstructor vc16_fg0
hi! link purescriptFunction vc16_fg0
hi! link purescriptConditional vc16_orange
hi! link purescriptBacktick vc16_orange

hi! link coffeeExtendedOp vc16_fg1
hi! link coffeeSpecialOp vc16_fg1
hi! link coffeeCurly vc16_orange
hi! link coffeeParen vc16_fg1
hi! link coffeeBracket vc16_orange

hi! link rubyStringDelimiter vc16_bgreen
hi! link rubyInterpolationDelimiter vc16_baqua

hi! link objcTypeModifier vc16_bred
hi! link objcDirective vc16_bblue

hi! link goDirective vc16_baqua

hi! link goConstants vc16_bpurple

hi! link goDeclaration vc16_bred
hi! link goDeclType vc16_bblue

hi! link goBuiltins vc16_orange

hi! link luaIn vc16_bred
hi! link luaFunction vc16_baqua
hi! link luaTable vc16_orange

hi! link moonSpecialOp vc16_fg1
hi! link moonExtendedOp vc16_fg1
hi! link moonFunction vc16_fg1
hi! link moonObject vc16_byellow

hi! link javaAnnotation vc16_bblue
hi! link javaDocTags vc16_baqua
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen vc16_fg1
hi! link javaParen1 vc16_fg1
hi! link javaParen2 vc16_fg1
hi! link javaParen3 vc16_fg1
hi! link javaParen4 vc16_fg1
hi! link javaParen5 vc16_fg1
hi! link javaOperator vc16_orange
hi! link javaVarArg vc16_bgreen

hi! link elixirDocString Comment
hi! link elixirStringDelimiter vc16_bgreen
hi! link elixirInterpolationDelimiter vc16_baqua
hi! link elixirModuleDeclaration vc16_byellow

hi! link scalaNameDefinition vc16_fg0
hi! link scalaCaseFollowing vc16_fg0
hi! link scalaCapitalWord vc16_fg0
hi! link scalaTypeExtension vc16_fg0
hi! link scalaKeyword vc16_bred
hi! link scalaKeywordModifier vc16_bred
hi! link scalaSpecial vc16_baqua
hi! link scalaOperator vc16_fg0
hi! link scalaTypeDeclaration vc16_byellow
hi! link scalaTypeTypePostDeclaration vc16_byellow
hi! link scalaInstanceDeclaration vc16_fg0
hi! link scalaInterpolation vc16_baqua

call s:hi('markdownItalic', s:white)

hi! link markdownH1 vc16_bgreen
hi! link markdownH2 vc16_bgreen
hi! link markdownH3 vc16_byellow
hi! link markdownH4 vc16_byellow
hi! link markdownH5 vc16_byellow
hi! link markdownH6 vc16_byellow
hi! link markdownCode vc16_baqua
hi! link markdownCodeBlock vc16_baqua
hi! link markdownCodeDelimiter vc16_baqua
hi! link markdownBlockquote vc16_fg1
hi! link markdownListMarker vc16_fg1
hi! link markdownOrderedListMarker vc16_fg1
hi! link markdownRule vc16_fg1
hi! link markdownHeadingRule vc16_fg1
hi! link markdownUrlDelimiter vc16_fg1
hi! link markdownLinkDelimiter vc16_fg1
hi! link markdownLinkTextDelimiter vc16_fg1
hi! link markdownHeadingDelimiter vc16_orange
hi! link markdownUrl vc16_bpurple
hi! link markdownUrlTitleDelimiter vc16_bgreen

call s:hi('markdownLinkText', s:white, 'bg', 'underline' )

hi! link markdownIdDeclaration markdownLinkText

hi! link haskellType vc16_fg0
hi! link haskellIdentifier vc16_fg0
hi! link haskellSeparator vc16_fg0
hi! link haskellDelimiter vc16_fg1
hi! link haskellOperators vc16_bblue
hi! link haskellBacktick vc16_orange
hi! link haskellStatement vc16_orange
hi! link haskellConditional vc16_orange
hi! link haskellLet vc16_baqua
hi! link haskellDefault vc16_baqua
hi! link haskellWhere vc16_baqua
hi! link haskellBottom vc16_baqua
hi! link haskellBlockKeywords vc16_baqua
hi! link haskellImportKeywords vc16_baqua
hi! link haskellDeclKeyword vc16_baqua
hi! link haskellDeriving vc16_baqua
hi! link haskellAssocType vc16_baqua
hi! link haskellNumber vc16_bpurple
hi! link haskellPragma vc16_bpurple
hi! link haskellString vc16_bgreen
hi! link haskellChar vc16_bgreen

hi! link jsonKeyword vc16_bgreen
hi! link jsonQuote vc16_bgreen
hi! link jsonBraces vc16_fg0
hi! link jsonString vc16_fg0

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
