"0   ------vim 必知会

"0.1    -------------.vimrc

" 定义快捷键的前缀，即<Leader>
let mapleader=";"

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on

" 定义快捷键到行首和行尾
nmap LB 0
nmap LE $
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转
nmap <Leader>M %

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu

"  3		----------------------插件管理
" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/vundle/
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"3.1	主题
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
"3.4	状态栏主题
Plugin 'Lokaltog/vim-powerline'
"4.1	语法高亮
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'jiangmiao/auto-pairs.git'
"关联缩进
Plugin 'nathanaelkane/vim-indent-guides'
"8.3	快速移动
Plugin 'Lokaltog/vim-easymotion'
"8.1	快速选中
Plugin 'gcmt/wildfire.vim'
"8.5	中/英输入平滑切换
" 插件列表结束
call vundle#end()
filetype plugin indent on

" 3.1 	-----------------------主题风格
" 配色方案
set background=dark
"colorscheme solarized
colorscheme molokai
"colorscheme phd

"3.2	---------------------营造专注氛围
" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
fun! ToggleFullscreen()
    call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf
" 全屏开/关快捷键
map <silent> <F11> :call ToggleFullscreen()<CR>
" 启动 vim 时自动全屏
autocmd VimEnter * call ToggleFullscreen()

"3.3	-----------------------添加辅助信息
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch

"3.4	-------------------------其他美化
" 禁止折行
set nowrap
" 设置状态栏主题风格
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set t_Co=256
"let g:Powerline_symbols = 'fancy'


"4		----------------------代码分析
"4.1	----------------------语法高亮
" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
" 'octol/vim-cpp-enhanced-highlight'插件
syntax keyword cppSTLtype initializer_list

"4.2	----------------------代码缩进
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" 插件 nathanaelkane/vim-indent-guides
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

"8		-----------------------------其他辅助功能
"8.1	-----------------------------快速编辑结对节

"  自动选中 快捷键
map <SPACE> <Plug>(wildfire-fuel)
vmap <S-SPACE> <Plug>(wildfire-water)
" 适用于哪些结对符
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip"]

"8.3	----------------------------快速移动
"插件	Lokaltog/vim-easymotion 

"8.5	---------------------------中英文平滑切换
"插件 lilydjwg/fcitx.vim

