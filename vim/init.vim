if filereadable(expand($HOME . '/.VimForCpp/vim/base.vim'))
  source $HOME/.VimForCpp/vim/base.vim
endif

""""""""""" 用户自定义配置写到下面 """"""""""

call plug#begin('~/.vim/bundle')
" 为了避免对字体的依赖导致的图标显示错乱的问题, 默认关闭了图标.
" Plug 'ryanoasis/vim-devicons'
call plug#end()
