" airline
"set langmenu=zh_CN.UTF-8
"set termencoding=cp936
"language messages zh_CN.utf-8
" let g:airline_theme="ravenpower"
" let g:airline_theme="minimalist"
" let g:airline_theme="kolor"
" let g:airline_theme="jellybeans"
" let g:airline_theme="distinguished"
let g:airline_theme="behelit"
" let g:airline_theme="base16_google"
set helplang=cn
set ambiwidth=double
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
"设置切换Buffer快捷键"
"nnoremap <C-tab> :bn<CR>
"nnoremap <C-s-tab> :bp<CR>
"关闭状态显示空白符号计数
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
"设置consolas字体"前面已经设置过
set guifont=Consolas\ for\ Powerline\ FixedD:h11
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
" let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = ''

" old vim-powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
" let g:airline_symbols.linenr = '⭡'
let g:airline_symbols.linenr = ''

set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
"Bundle 'majutsushi/tagbar'
"Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
Plugin 'Shougo/vimproc.vim'
"Plugin 'idanarye/vim-vebugger'
Plugin 'gilligan/vim-lldb'
"Plugin 'w0rp/ale'
Plugin 'tpope/vim-surround'
Plugin 'flazz/vim-colorschemes'
Plugin 'python-mode/python-mode'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
"Plugin 'ryanoasis/vim-devicons'
call vundle#end()
filetype plugin indent on

set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12

set hlsearch

" 主题相关
" colorscheme atom
" colorscheme molokai
colorscheme luna-term
" colorscheme gruvbox
" set background=dark
" set background=light
" let g:gruvbox_contrast_light="light"
" let g:gruvbox_contrast_dark="hard"
" let g:gruvbox_improved_warnings=1

let mapleader = ";" 

set nu
" set mouse=a

behave mswin
syntax on

set si
set ai

set nowritebackup
set backspace=indent,eol,start

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set fileencodings=utf-8,gbk,cp936,cp950,latin1
set encoding=utf-8
set ruler
set showcmd
set incsearch

"imap <C-j> <c-x><c-p>
nmap <C-l> <c-o>
nnoremap <C-k> :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nmap <C-k> <c-]>
"nmap <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q
nmap <F11> :YcmDiags<CR>
"nmap <F6> :TlistToggle<CR> 
nmap <F6> :TagbarToggle<CR>
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_width=20
let g:tagbar_left=1
let g:tagbar_sort = 0

set ruler

set foldmethod=marker

"let g:SuperTabDefaultCompletionType="context" 
"let g:SuperTabDefaultCompletionType="<c-x><c-o>"
"let g:SuperTabRetainCompletionType=2

"set nocp
filetype plugin on

let Tlist_Exit_OnlyWindow=1
let Tlist_Show_One_File=1

map <F8> :Dox<RETURN><ESC>
map <F7> :NERDTreeToggle<RETURN>
imap <F7> :NERDTreeToggle<RETURN>
let g:NERDTreeWinPos="right"
let g:NERDTreeWinSize=20
set ai

"let OmniCpp_SelectFirstItem = 2
"set tags+=~/.vim/stl_tags
"set tags+=~/.vim/linux_tags
"map <F8> :set encoding=utf-8<RETURN>:set fileencoding=utf-8<RETURN>

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
"let g:ycm_key_invoke_completion='<C-j>'
set completeopt=longest,menu
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
let g:ycm_error_symbol = 'E>'
let g:ycm_warning_symbol = 'W>'
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_python_binary_path = 'python'
let g:ycm_semantic_triggers =  {
      \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
      \ 'cs,lua,javascript': ['re!\w{2}'],
      \}

let g:ctrlp_working_path_mode='a'

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" nnoremap <F12> :!clear && python %<cr>
" nnoremap <F5> :!clear && gcc -g % -o a.out && ./a.out<cr>
" nnoremap <Leader>d :!./

" 不吱吱叫
set noeb vb t_vb=

" 调整窗口移动
nnoremap H <C-w>h
nnoremap J <C-w>j
nnoremap K <C-w>k
nnoremap L <C-w>l

set cursorline
"highlight CursorLine   cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

" nmoremap <Leader>r :%s///g
" cpp-enhanced-highlight
" 高亮类，成员函数，标准库和模板
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
" 文件较大时使用下面的设置高亮模板速度较快，但会有一些小错误
let g:cpp_experimental_template_highlight = 1

" set UltiSnips
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsListSnippets="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrgger="<C-k>"

" vebugger
" nnoremap <F4> :VBGstartGDB a.out<cr>
" let g:vebugger_leader="<space>"
" let g:vebugger_breakpoint_text='B '
" let g:vebugger_currentline_text='->'
" let g:vebugger_view_source_cmd='tabedit'

" vim-lldb
function LLDB_start()
  echo 'hehe'
  silent! Ltarget a.out
  silent! Lhide disassembly
  silent! Lhide registers
  silent! Lhide breakpoints
  silent! Lhide threads
endfunction

nnoremap <F4> :call LLDB_start()<cr>
nnoremap <space>b :Lbreakpoint<cr>
nnoremap <space>r :Lrun<cr>
nnoremap <space>p :Lprint<cr>
nnoremap <space>c :Lcontinue<cr>
nnoremap <space>n :Lnext<cr>
nnoremap <space>s :Lstep<cr>

" 配置快速保存
nnoremap <space>w :w<cr>
inoremap jk <esc>:w<cr>
inoremap <esc> <esc>:w<cr>

" 文件修改之后自动载入
set autoread
" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=5

" 左下角不显示当前vim模式
set noshowmode

vnoremap < <gv
vnoremap > >gv

" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99
" 代码折叠自定义快捷键 <leader>zz
let g:FoldMethod = 0
noremap zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

nnoremap <F5> :call Compile()<cr>
func! Compile()
    exec "w"
    if &filetype == 'c'
      exec "!gcc -g % -o %<"
      exec "!./%<"
    elseif &filetype == 'cpp'
      exec "!gcc -g % -o %<"
      exec "!./%<"
    elseif &filetype == 'python'
      exec "!python %"
    endif
endfunc

nnoremap <space>t :AT<cr>
nnoremap <space>e :tabe 
