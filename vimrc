" 设置vim颜色
syntax enable
colorscheme monokai
"colorscheme desert
" 你在此设置运行时路径
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 在这里面输入安装的插件
" Vundle 本身就是一个插件
Plugin 'gmarik/Vundle.vim'
Plugin 'git://github.com/scrooloose/nerdtree.git'    "nerdtree 树形文件夹
Plugin 'Valloric/YouCompleteMe' "YouCompleteMe 补全
Plugin 'scrooloose/syntastic' "语法检查
Plugin 'vim-scripts/indentpython.vim' "自动缩进
Plugin 'airblade/vim-gitgutter' "git实时显示更改
Plugin 'bling/vim-airline' " statusline显示
Plugin 'vim-airline/vim-airline-themes' "airline主题
"Plugin 'terryma/vim-multiple-cursors' "多重选取

"所有插件都应该在这一行之前
call vundle#end()

" nerdtree config
map <F2> :NERDTreeToggle<CR>  
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__'] "ignore files in NERDTree

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0


" airline相关设置
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'

" 是否打开tabline
let g:airline#extensions#tabline#enabled = 1 " 打开后，tabline和tmuxline都可以得到增强

" Python配置
let python_highlight_all = 1

" 自动生成python文件头
function HeaderPython()
call setline(1, "#!/usr/bin/env python")
call append(1, "# created by zhonghao on ".strftime("%Y-%m-%d %H:%M:%S"))
call append(1, "# -*- coding: utf-8 -*-")
endf
autocmd bufnewfile *.py call HeaderPython()

" 解决插入模式下delete/backspce键失效问题
set backspace=2

" 空白字符
" highlight BadWhitespace ctermbg=red guibg=darkred
" au BufRead,BufNewFile *.py,*.pyw,*.pyc match BadWhitespace /\s\+$/

" youcomplete跨文件查询，然后ctrl+o回到光标处
map <C-]> :YcmCompleter GoToDefinitionElseDeclaration<CR>

au BufNewFile,BufRead *.py
    \ set tabstop=4 	|
    \ set softtabstop=4	|
    \ set shiftwidth=4	|
    \ set textwidth=79	|
    \ set expandtab	|
    \ set autoindent	|
    \ set fileformat=unix

au BufNewFile,BufRead *.html
    \ set tabstop=4	|
    \ set softtabstop=	|
    \ set shiftwidth=4	|
    \ set expandtab	|
    \ set autoindent

au BufNewFile,BufRead *.js
    \ set tabstop=2	|
    \ set softtabstop=2	|
    \ set shiftwidth=2	|
    \ set expandtab	|
    \ set autoindent

au BufNewFile,BufRead *.htm
    \ set tabstop=4	|
    \ set softtabstop=4	|
    \ set shiftwidth=4	|
    \ set expandtab	|
    \ set autoindent

au BufNewFile,BufRead *.yml
    \ set tabstop=4	|
    \ set softtabstop=4	|
    \ set shiftwidth=4	|
    \ set expandtab	|
    \ set autoindent

" 通用配置
" 取消swap文件
set noswapfile

"""""""""""""""""设置折叠"""""""""""""""""""""
set foldmethod=indent
set foldlevel=99
"根据语法折叠
set fdm=syntax
"手动折叠
"set fdm=manual
"设置键盘映射，通过空格设置折叠
nnoremap <space> @=((foldclosed(line('.')<0)?'zc':'zo'))<CR>

""""""""""""""""""""""""""""""""""""""""""""""

" 设置默认进行大小写不敏感查找
set ignorecase
" 如果有一个大写字母，则切换到大小写敏感查找
set smartcase 
" 设置查询高亮
set hlsearch

" 设置一键运行python
map <F5> :w<cr>:!python %<cr>

" 开启鼠标
set mouse=a
