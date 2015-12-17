" Making a new command to comment a range of lines
autocmd FileType c,cpp,java,scala let b:comment_leader = '//'
autocmd FileType sh,ruby,python   let b:comment_leader = '#'
autocmd FileType conf,fstab       let b:comment_leader = '#'
autocmd FileType tex              let b:comment_leader = '%'
autocmd FileType mail             let b:comment_leader = '>'
autocmd FileType vim              let b:comment_leader = '"'
function! CommentToggle()
	execute ':silent! s/\([^ ]\)/' . b:comment_leader . ' \1/'
	execute ':silent! s/^\( *\)' . b:comment_leader . ' \?' . b:comment_leader . ' \?/\1/'
endfunction
function! Comment()
	execute ':silent! s/^/' . b:comment_leader
endfunction
function! UnComment()
	execute ':silent! s/^' . b:comment_leader . '*//'
endfunction
:command -range CC <line1>,<line2>call Comment()<CR>
:command -range UC <line1>,<line2>call UnComment()<CR>
" end







" coder things
set number
set tabstop=4
set shiftwidth=4
set noexpandtab
set autoindent
set hlsearch

"left right wrap
set whichwrap+=<,>,h,l,[,]

nnoremap <F3> :set hlsearch!<CR>
syntax on
se t_Co=256
color elflord
colorscheme latex


"highlight current line must come after color
set cursorline
hi CursorLine   cterm=NONE ctermbg=236 ctermfg=NONE guibg=darkred guifg=white
"cterm bg color value visit
"https://upload.wikimedia.org/wikipedia/en/1/15/Xterm_256color_chart.svg


" block guide line

set list
" set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\ 
set listchars=trail:.,tab:\|\ 
" :set listchars=trail:.,tab:\|\ 
set vb t_vb= " Turn off visual bell, error flash

filetype plugin on


"  Key mappings
" ==============
" insert mode Shift + Tab
nmap <S-Tab> i
imap <S-Tab> <Nop>
" :imap ii <Esc>

" swap files in temp directories
set dir=/tmp//
"set spell spelllang=en_us

":set nospell


"e TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.
"
""See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
""Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
""Window users can copy the file to their machine.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
      return "\<C-N>"
  else
      return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"

