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
"
" reverse won't work right if fg color >= 8.
"
" Search, IncSearch style highlight won't work right in linux console, the
" current fg color take effect for the new fg color, no ider why would that
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

let g:colors_name='gb16'
if &background !=# 'dark'
 set background=dark
endif

function s:hi(group, fg, ...) abort
  "                      bg, attributes

  let bg = get(a:000, 0, 'bg')
  let attr = get(a:000, 1, 'none')
  exe printf('hi %s cterm=%s ctermfg=%s ctermbg=%s', a:group, attr, a:fg, bg)
endfunction

let g:gb16_pallete = {
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

let  s:black   = g:gb16_pallete.black
let  s:red     = g:gb16_pallete.red
let  s:green   = g:gb16_pallete.green
let  s:yellow  = g:gb16_pallete.yellow
let  s:blue    = g:gb16_pallete.blue
let  s:gray    = g:gb16_pallete.gray
let  s:cyan    = g:gb16_pallete.cyan
let  s:bwhite  = g:gb16_pallete.bwhite
let  s:bblack  = g:gb16_pallete.bblack
let  s:bred    = g:gb16_pallete.bred
let  s:bgreen  = g:gb16_pallete.bgreen
let  s:byellow = g:gb16_pallete.byellow
let  s:bblue   = g:gb16_pallete.bblue
let  s:orange  = g:gb16_pallete.orange
let  s:bcyan   = g:gb16_pallete.bcyan
let  s:white   = g:gb16_pallete.white

let s:bg0 = s:black
let s:bg1 = s:gray

let s:fg0 = s:white
let s:fg1 = s:bwhite

call s:hi('Normal', s:bwhite, s:black)

call s:hi('gb16_fg0', s:bwhite)
call s:hi('gb16_fg1', s:white)
call s:hi('gb16_bg0', s:black)
call s:hi('gb16_bg1', s:gray)

call s:hi('gb16_black',  s:black)
call s:hi('gb16_red',    s:red)
call s:hi('gb16_green',  s:green)
call s:hi('gb16_yellow', s:yellow)
call s:hi('gb16_blue',   s:blue)
call s:hi('gb16_gray',   s:gray)
call s:hi('gb16_cyan',   s:cyan)
call s:hi('gb16_white',  s:white)
call s:hi('gb16_bblack', s:bblack)
call s:hi('gb16_bred',   s:bred)
call s:hi('gb16_bgreen', s:bgreen)
call s:hi('gb16_byellow',s:byellow)
call s:hi('gb16_bblue',  s:bblue)
call s:hi('gb16_orange', s:orange)
call s:hi('gb16_bcyan',  s:bcyan)
call s:hi('gb16_bwhite', s:bwhite)

call s:hi('gb16_red_sign', s:bred, s:gray)
call s:hi('gb16_green_sign', s:bgreen, s:gray)
call s:hi('gb16_yellow_sign', s:byellow, s:gray)
call s:hi('gb16_blue_sign', s:bblue, s:gray)
call s:hi('gb16_purple_sign', s:bblack, s:gray)
call s:hi('gb16_aqua_sign', s:bcyan, s:gray)
call s:hi('gb16_orange_sign', s:red, s:gray)

hi! link SpecialKey gb16_bg1

hi! link EndOfBuffer NonText

hi! link NonText gb16_bg1

hi! link Directory gb16_bgreen


call s:hi('ErrorMsg', s:bwhite, s:red)

hi! link MoreMsg gb16_byellow

hi! link ModeMsg gb16_byellow

call s:hi('LineNr', s:white, s:gray)

" hi LineNrAbove cleared
" hi LineNrBelow cleared

call s:hi('CursorLineNr', s:black, s:yellow)

hi! link Question gb16_orange

call s:hi('StatusLine', s:bwhite, s:gray)
call s:hi('StatusLineNC', s:white, s:gray)
call s:hi('VertSplit', s:gray, s:black)

hi! link Title gb16_bgreen

call s:hi('Visual', s:orange, s:gray)

hi! link VisualNOS Visual

hi! link WarningMsg gb16_bred

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

hi! link Constant gb16_bpurple

hi! link Special gb16_orange

hi! link Identifier gb16_bblue

hi! link Statement gb16_bred

hi! link PreProc gb16_baqua

hi! link Type gb16_byellow

call s:hi('Underlined', s:bblue, 'bg', 'underline' )

call s:hi('Ignore', s:black)

call s:hi('Error', s:bwhite, s:red )

call s:hi('Todo', s:black, s:cyan)

call s:hi('String', s:bgreen)

hi! link Character gb16_bpurple

hi! link Number gb16_bpurple

hi! link Boolean gb16_bpurple

hi! link Float gb16_bpurple

hi! link Function gb16_bgreen

hi! link Conditional gb16_bred

hi! link Repeat gb16_bred

hi! link Label gb16_bred

hi! link Operator Normal

hi! link Keyword gb16_bred

hi! link Exception gb16_bred

hi! link Include gb16_baqua

hi! link Define gb16_baqua

hi! link Macro gb16_baqua

hi! link PreCondit gb16_baqua

hi! link StorageClass gb16_orange

hi! link Structure gb16_baqua

hi! link Typedef gb16_byellow

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

hi! link GitGutterAdd gb16_green_sign
hi! link GitGutterChange gb16_aqua_sign
hi! link GitGutterDelete gb16_red_sign
hi! link GitGutterChangeDelete gb16_aqua_sign

hi! link gitcommitSelectedFile gb16_bgreen
hi! link gitcommitDiscardedFile gb16_bred

hi! link SignifySignAdd gb16_green_sign
hi! link SignifySignChange gb16_aqua_sign
hi! link SignifySignDelete gb16_red_sign

call s:hi('SyntasticError', 'fg', 'bg', 'undercurl')
call s:hi('SyntasticWarning', 'fg', 'bg', 'undercurl')

hi! link SyntasticErrorSign gb16_red_sign
hi! link SyntasticWarningSign gb16_yellow_sign

hi! link SignatureMarkText gb16_blue_sign
hi! link SignatureMarkerText gb16_purple_sign

hi! link ShowMarksHLl gb16_blue_sign
hi! link ShowMarksHLu gb16_blue_sign
hi! link ShowMarksHLo gb16_blue_sign
hi! link ShowMarksHLm gb16_blue_sign

hi! link CtrlPMatch gb16_byellow
hi! link CtrlPNoEntries gb16_bred
hi! link CtrlPPrtBase gb16_bg1
hi! link CtrlPPrtCursor gb16_bblue
hi! link CtrlPLinePre gb16_bg1

call s:hi('CtrlPMode1', s:bblue, s:gray, 'bold' )
call s:hi('CtrlPMode2', s:black, s:blue, 'bold' )
call s:hi('CtrlPStats', s:white, s:gray, 'bold' )

hi! link StartifyBracket gb16_fg1
hi! link StartifyFile gb16_fg0
hi! link StartifyNumber gb16_bblue
hi! link StartifyPath gb16_fg1
hi! link StartifySlash gb16_fg1
hi! link StartifySection gb16_byellow
hi! link StartifySpecial gb16_bg1
hi! link StartifyHeader gb16_orange
hi! link StartifyFooter gb16_bg1

call s:hi('BufTabLineCurrent', s:black, s:cyan)
call s:hi('BufTabLineActive', s:black, s:green)
call s:hi('BufTabLineHidden', s:black, s:black)
call s:hi('BufTabLineFill', s:black, s:black)

call s:hi('ALEError', 'none', 'none', 'underline')
call s:hi('ALEWarning', 'none', 'none', 'underline')
call s:hi('ALEInfo', 'none', 'none', 'underline')

hi! link ALEErrorSign gb16_red_sign
hi! link ALEWarningSign gb16_yellow_sign
hi! link ALEInfoSign gb16_blue_sign

hi! link DirvishPathTail gb16_baqua
hi! link DirvishArg gb16_byellow

hi! link netrwDir gb16_baqua
hi! link netrwClassify gb16_baqua
hi! link netrwLink gb16_fg1
hi! link netrwSymLink gb16_fg0
hi! link netrwExe gb16_byellow
hi! link netrwComment gb16_fg1
hi! link netrwList gb16_bblue
hi! link netrwHelpCmd gb16_baqua
hi! link netrwCmdSep gb16_fg1
hi! link netrwVersion gb16_bgreen

hi! link NERDTreeDir gb16_baqua
hi! link NERDTreeDirSlash gb16_baqua
hi! link NERDTreeOpenable gb16_orange
hi! link NERDTreeClosable gb16_orange
hi! link NERDTreeFile gb16_fg0
hi! link NERDTreeExecFile gb16_byellow
hi! link NERDTreeUp gb16_fg1
hi! link NERDTreeCWD gb16_bgreen
hi! link NERDTreeHelp gb16_fg0
hi! link NERDTreeToggleOn gb16_bgreen
hi! link NERDTreeToggleOff gb16_bred

call s:hi('multiple_cursors_cursor', 'fg', 'bg', 'reverse')
call s:hi('multiple_cursors_visual', 'fg', s:gray)

hi! link CocErrorSign gb16_red_sign
hi! link CocWarningSign gb16_orange_sign
hi! link CocInfoSign gb16_yellow_sign
hi! link CocHintSign gb16_blue_sign
hi! link CocErrorFloat gb16_bred
hi! link CocWarningFloat gb16_orange
hi! link CocInfoFloat gb16_byellow
hi! link CocHintFloat gb16_bblue
hi! link CocDiagnosticsError gb16_bred
hi! link CocDiagnosticsWarning gb16_orange
hi! link CocDiagnosticsInfo gb16_byellow
hi! link CocDiagnosticsHint gb16_bblue
hi! link CocSelectedText gb16_bred
hi! link CocCodeLens gb16_fg1

call s:hi('CocErrorHighlight', 'fg', 'bg', 'undercurl')
call s:hi('CocWarningHighlight', 'fg', 'bg', 'undercurl')
call s:hi('CocInfoHighlight', 'fg', 'bg', 'undercurl')
call s:hi('CocHintHighlight', 'fg', 'bg', 'undercurl')

hi! link diffAdded gb16_bgreen
hi! link diffRemoved gb16_bred
hi! link diffChanged gb16_baqua
hi! link diffFile gb16_orange
hi! link diffNewFile gb16_byellow
hi! link diffLine gb16_bblue

hi! link htmlTag gb16_bblue
hi! link htmlEndTag gb16_bblue
hi! link htmlTagName gb16_baqua
hi! link htmlArg gb16_baqua
hi! link htmlScriptTag gb16_bpurple
hi! link htmlTagN gb16_fg0
hi! link htmlSpecialTagName gb16_baqua
call s:hi('htmlLink', s:white, 'bg', 'underline' )
hi! link htmlSpecialChar gb16_orange
call s:hi('htmlBold', s:bwhite, s:black, 'bold' )
call s:hi('htmlBoldUnderline', s:bwhite, s:black, 'bold,underline' )
call s:hi('htmlBoldItalic', s:bwhite, s:black, 'bold' )
call s:hi('htmlBoldUnderlineItalic', s:bwhite, s:black, 'bold,underline' )
call s:hi('htmlUnderline', s:bwhite, s:black, 'underline' )
call s:hi('htmlUnderlineItalic', s:bwhite, s:black, 'underline' )
call s:hi('htmlItalic', s:bwhite, s:black)

hi! link xmlTag gb16_bblue
hi! link xmlEndTag gb16_bblue
hi! link xmlTagName gb16_bblue
hi! link xmlEqual gb16_bblue

hi! link docbkKeyword gb16_baqua

hi! link xmlDocTypeDecl gb16_fg1
hi! link xmlDocTypeKeyword gb16_bpurple
hi! link xmlCdataStart gb16_fg1
hi! link xmlCdataCdata gb16_bpurple

hi! link dtdFunction gb16_fg1
hi! link dtdTagName gb16_bpurple

hi! link xmlAttrib gb16_baqua
hi! link xmlProcessingDelim gb16_fg1

hi! link dtdParamEntityPunct gb16_fg1
hi! link dtdParamEntityDPunct gb16_fg1

hi! link xmlAttribPunct gb16_fg1
hi! link xmlEntity gb16_orange
hi! link xmlEntityPunct gb16_orange

call s:hi('vimCommentTitle', s:white, 'bg', 'bold' )

hi! link vimNotation gb16_orange
hi! link vimBracket gb16_orange
hi! link vimMapModKey gb16_orange
hi! link vimFuncSID gb16_fg1
hi! link vimSetSep gb16_fg1
hi! link vimSep gb16_fg1
hi! link vimContinue gb16_fg1

hi! link clojureKeyword gb16_bblue
hi! link clojureCond gb16_orange
hi! link clojureSpecial gb16_orange
hi! link clojureDefine gb16_orange
hi! link clojureFunc gb16_byellow
hi! link clojureRepeat gb16_byellow
hi! link clojureCharacter gb16_baqua
hi! link clojureStringEscape gb16_baqua
hi! link clojureException gb16_bred
hi! link clojureRegexp gb16_baqua
hi! link clojureRegexpEscape gb16_baqua

call s:hi('clojureRegexpCharClass', s:white, 'bg', 'bold' )

hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass
hi! link clojureParen gb16_fg1
hi! link clojureAnonArg gb16_byellow
hi! link clojureVariable gb16_bblue
hi! link clojureMacro gb16_orange
hi! link clojureMeta gb16_byellow
hi! link clojureDeref gb16_byellow
hi! link clojureQuote gb16_byellow
hi! link clojureUnquote gb16_byellow

hi! link cOperator gb16_bpurple
hi! link cStructure gb16_orange

hi! link pythonBuiltin gb16_orange
hi! link pythonBuiltinObj gb16_orange
hi! link pythonBuiltinFunc gb16_orange
hi! link pythonFunction gb16_baqua
hi! link pythonDecorator gb16_bred
hi! link pythonInclude gb16_bblue
hi! link pythonImport gb16_bblue
hi! link pythonRun gb16_bblue
hi! link pythonCoding gb16_bblue
hi! link pythonOperator gb16_bred
hi! link pythonException gb16_bred
hi! link pythonExceptions gb16_bpurple
hi! link pythonBoolean gb16_bpurple
hi! link pythonDot gb16_fg1
hi! link pythonConditional gb16_bred
hi! link pythonRepeat gb16_bred
hi! link pythonDottedName gb16_bgreen

hi! link cssBraces gb16_bblue
hi! link cssFunctionName gb16_byellow
hi! link cssIdentifier gb16_orange
hi! link cssClassName gb16_bgreen
hi! link cssColor gb16_bblue
hi! link cssSelectorOp gb16_bblue
hi! link cssSelectorOp2 gb16_bblue
hi! link cssImportant gb16_bgreen
hi! link cssVendor gb16_fg0
hi! link cssTextProp gb16_baqua
hi! link cssAnimationProp gb16_baqua
hi! link cssUIProp gb16_byellow
hi! link cssTransformProp gb16_baqua
hi! link cssTransitionProp gb16_baqua
hi! link cssPrintProp gb16_baqua
hi! link cssPositioningProp gb16_byellow
hi! link cssBoxProp gb16_baqua
hi! link cssFontDescriptorProp gb16_baqua
hi! link cssFlexibleBoxProp gb16_baqua
hi! link cssBorderOutlineProp gb16_baqua
hi! link cssBackgroundProp gb16_baqua
hi! link cssMarginProp gb16_baqua
hi! link cssListProp gb16_baqua
hi! link cssTableProp gb16_baqua
hi! link cssFontProp gb16_baqua
hi! link cssPaddingProp gb16_baqua
hi! link cssDimensionProp gb16_baqua
hi! link cssRenderProp gb16_baqua
hi! link cssColorProp gb16_baqua
hi! link cssGeneratedContentProp gb16_baqua

hi! link javaScriptBraces gb16_fg0
hi! link javaScriptFunction gb16_baqua
hi! link javaScriptIdentifier gb16_orange
hi! link javaScriptMember gb16_bblue
hi! link javaScriptNumber gb16_bpurple
hi! link javaScriptNull gb16_bpurple
hi! link javaScriptParens gb16_fg1
hi! link javascriptImport gb16_baqua
hi! link javascriptExport gb16_baqua
hi! link javascriptClassKeyword gb16_baqua
hi! link javascriptClassExtends gb16_baqua
hi! link javascriptDefault gb16_baqua
hi! link javascriptClassName gb16_byellow
hi! link javascriptClassSuperName gb16_byellow
hi! link javascriptGlobal gb16_byellow
hi! link javascriptEndColons gb16_fg0
hi! link javascriptFuncArg gb16_fg0
hi! link javascriptGlobalMethod gb16_fg0
hi! link javascriptNodeGlobal gb16_fg0
hi! link javascriptBOMWindowProp gb16_fg0
hi! link javascriptArrayMethod gb16_fg0
hi! link javascriptArrayStaticMethod gb16_fg0
hi! link javascriptCacheMethod gb16_fg0
hi! link javascriptDateMethod gb16_fg0
hi! link javascriptMathStaticMethod gb16_fg0
hi! link javascriptURLUtilsProp gb16_fg0
hi! link javascriptBOMNavigatorProp gb16_fg0
hi! link javascriptDOMDocMethod gb16_fg0
hi! link javascriptDOMDocProp gb16_fg0
hi! link javascriptBOMLocationMethod gb16_fg0
hi! link javascriptBOMWindowMethod gb16_fg0
hi! link javascriptStringMethod gb16_fg0
hi! link javascriptVariable gb16_orange
hi! link javascriptClassSuper gb16_orange
hi! link javascriptFuncKeyword gb16_baqua
hi! link javascriptAsyncFunc gb16_baqua
hi! link javascriptClassStatic gb16_orange
hi! link javascriptOperator gb16_bred
hi! link javascriptForOperator gb16_bred
hi! link javascriptYield gb16_bred
hi! link javascriptExceptions gb16_bred
hi! link javascriptMessage gb16_bred
hi! link javascriptTemplateSB gb16_baqua
hi! link javascriptTemplateSubstitution gb16_fg0
hi! link javascriptLabel gb16_fg0
hi! link javascriptObjectLabel gb16_fg0
hi! link javascriptPropertyName gb16_fg0
hi! link javascriptLogicSymbols gb16_fg0
hi! link javascriptArrowFunc gb16_byellow
hi! link javascriptDocParamName gb16_fg1
hi! link javascriptDocTags gb16_fg1
hi! link javascriptDocNotation gb16_fg1
hi! link javascriptDocParamType gb16_fg1
hi! link javascriptDocNamedParamType gb16_fg1
hi! link javascriptBrackets gb16_fg0
hi! link javascriptDOMElemAttrs gb16_fg0
hi! link javascriptDOMEventMethod gb16_fg0
hi! link javascriptDOMNodeMethod gb16_fg0
hi! link javascriptDOMStorageMethod gb16_fg0
hi! link javascriptHeadersMethod gb16_fg0
hi! link javascriptAsyncFuncKeyword gb16_bred
hi! link javascriptAwaitFuncKeyword gb16_bred

hi! link jsClassKeyword gb16_baqua
hi! link jsExtendsKeyword gb16_baqua
hi! link jsExportDefault gb16_baqua
hi! link jsTemplateBraces gb16_baqua
hi! link jsGlobalNodeObjects gb16_fg0
hi! link jsGlobalObjects gb16_fg0
hi! link jsFunction gb16_baqua
hi! link jsFuncParens gb16_fg1
hi! link jsParens gb16_fg1
hi! link jsNull gb16_bpurple
hi! link jsUndefined gb16_bpurple
hi! link jsClassDefinition gb16_byellow

hi! link typeScriptReserved gb16_baqua
hi! link typeScriptLabel gb16_baqua
hi! link typeScriptFuncKeyword gb16_baqua
hi! link typeScriptIdentifier gb16_orange
hi! link typeScriptBraces gb16_fg0
hi! link typeScriptEndColons gb16_fg0
hi! link typeScriptDOMObjects gb16_fg0
hi! link typeScriptAjaxMethods gb16_fg0
hi! link typeScriptLogicSymbols gb16_fg0
hi! link typeScriptDocSeeTag Comment
hi! link typeScriptDocParam Comment
hi! link typeScriptDocTags vimCommentTitle
hi! link typeScriptGlobalObjects gb16_fg0
hi! link typeScriptParens gb16_fg1
hi! link typeScriptOpSymbols gb16_fg1
hi! link typeScriptHtmlElemProperties gb16_fg0
hi! link typeScriptNull gb16_bpurple
hi! link typeScriptInterpolationDelimiter gb16_baqua

hi! link purescriptModuleKeyword gb16_baqua
hi! link purescriptModuleName gb16_fg0
hi! link purescriptWhere gb16_baqua
hi! link purescriptDelimiter gb16_fg1
hi! link purescriptType gb16_fg0
hi! link purescriptImportKeyword gb16_baqua
hi! link purescriptHidingKeyword gb16_baqua
hi! link purescriptAsKeyword gb16_baqua
hi! link purescriptStructure gb16_baqua
hi! link purescriptOperator gb16_bblue
hi! link purescriptTypeVar gb16_fg0
hi! link purescriptConstructor gb16_fg0
hi! link purescriptFunction gb16_fg0
hi! link purescriptConditional gb16_orange
hi! link purescriptBacktick gb16_orange

hi! link coffeeExtendedOp gb16_fg1
hi! link coffeeSpecialOp gb16_fg1
hi! link coffeeCurly gb16_orange
hi! link coffeeParen gb16_fg1
hi! link coffeeBracket gb16_orange

hi! link rubyStringDelimiter gb16_bgreen
hi! link rubyInterpolationDelimiter gb16_baqua

hi! link objcTypeModifier gb16_bred
hi! link objcDirective gb16_bblue

hi! link goDirective gb16_baqua

hi! link goConstants gb16_bpurple

hi! link goDeclaration gb16_bred
hi! link goDeclType gb16_bblue

hi! link goBuiltins gb16_orange

hi! link luaIn gb16_bred
hi! link luaFunction gb16_baqua
hi! link luaTable gb16_orange

hi! link moonSpecialOp gb16_fg1
hi! link moonExtendedOp gb16_fg1
hi! link moonFunction gb16_fg1
hi! link moonObject gb16_byellow

hi! link javaAnnotation gb16_bblue
hi! link javaDocTags gb16_baqua
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen gb16_fg1
hi! link javaParen1 gb16_fg1
hi! link javaParen2 gb16_fg1
hi! link javaParen3 gb16_fg1
hi! link javaParen4 gb16_fg1
hi! link javaParen5 gb16_fg1
hi! link javaOperator gb16_orange
hi! link javaVarArg gb16_bgreen

hi! link elixirDocString Comment
hi! link elixirStringDelimiter gb16_bgreen
hi! link elixirInterpolationDelimiter gb16_baqua
hi! link elixirModuleDeclaration gb16_byellow

hi! link scalaNameDefinition gb16_fg0
hi! link scalaCaseFollowing gb16_fg0
hi! link scalaCapitalWord gb16_fg0
hi! link scalaTypeExtension gb16_fg0
hi! link scalaKeyword gb16_bred
hi! link scalaKeywordModifier gb16_bred
hi! link scalaSpecial gb16_baqua
hi! link scalaOperator gb16_fg0
hi! link scalaTypeDeclaration gb16_byellow
hi! link scalaTypeTypePostDeclaration gb16_byellow
hi! link scalaInstanceDeclaration gb16_fg0
hi! link scalaInterpolation gb16_baqua

call s:hi('markdownItalic', s:white)

hi! link markdownH1 gb16_bgreen
hi! link markdownH2 gb16_bgreen
hi! link markdownH3 gb16_byellow
hi! link markdownH4 gb16_byellow
hi! link markdownH5 gb16_byellow
hi! link markdownH6 gb16_byellow
hi! link markdownCode gb16_baqua
hi! link markdownCodeBlock gb16_baqua
hi! link markdownCodeDelimiter gb16_baqua
hi! link markdownBlockquote gb16_fg1
hi! link markdownListMarker gb16_fg1
hi! link markdownOrderedListMarker gb16_fg1
hi! link markdownRule gb16_fg1
hi! link markdownHeadingRule gb16_fg1
hi! link markdownUrlDelimiter gb16_fg1
hi! link markdownLinkDelimiter gb16_fg1
hi! link markdownLinkTextDelimiter gb16_fg1
hi! link markdownHeadingDelimiter gb16_orange
hi! link markdownUrl gb16_bpurple
hi! link markdownUrlTitleDelimiter gb16_bgreen

call s:hi('markdownLinkText', s:white, 'bg', 'underline' )

hi! link markdownIdDeclaration markdownLinkText

hi! link haskellType gb16_fg0
hi! link haskellIdentifier gb16_fg0
hi! link haskellSeparator gb16_fg0
hi! link haskellDelimiter gb16_fg1
hi! link haskellOperators gb16_bblue
hi! link haskellBacktick gb16_orange
hi! link haskellStatement gb16_orange
hi! link haskellConditional gb16_orange
hi! link haskellLet gb16_baqua
hi! link haskellDefault gb16_baqua
hi! link haskellWhere gb16_baqua
hi! link haskellBottom gb16_baqua
hi! link haskellBlockKeywords gb16_baqua
hi! link haskellImportKeywords gb16_baqua
hi! link haskellDeclKeyword gb16_baqua
hi! link haskellDeriving gb16_baqua
hi! link haskellAssocType gb16_baqua
hi! link haskellNumber gb16_bpurple
hi! link haskellPragma gb16_bpurple
hi! link haskellString gb16_bgreen
hi! link haskellChar gb16_bgreen

hi! link jsonKeyword gb16_bgreen
hi! link jsonQuote gb16_bgreen
hi! link jsonBraces gb16_fg0
hi! link jsonString gb16_fg0

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
