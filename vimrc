"""""""""""""""""""""""""""""""""""""""""""""""""""" 基础配置
" 关闭兼容模式
set nocompatible 
" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
" 设置鼠标运行模式为WINDOWS模式
behave mswin
" 历史命令纪录数
set history=50

"""""""""""""""""""""""""""""""""""""""""""""""""""" 插件管理
" 文件类型侦测
filetype off 
" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() 
" 插件管理器
Plugin 'VundleVim/Vundle.vim'
"语法自动补全
Plugin 'https://gitee.com/runtest007/YouCompleteMe.git'
" 主题
Plugin 'tomasr/molokai'
" 状态栏
Plugin 'bling/vim-airline'
" 文件目录状态图
Plugin 'scrooloose/nerdtree'
" 文件搜索
Plugin 'kien/ctrlp.vim'
" 程序结构显示
Plugin 'taglist.vim'
" 注释
Plugin 'vim-scripts/DoxygenToolkit.vim'
call vundle#end() 
" 根据侦测到的不同类型加载对应的插件
filetype plugin indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""" 通用配置
""""""""""""""""""" 快捷键
" 定义快捷键前缀
let mapleader = ";" 

""""""""""""""""""" 语法高亮
" 开启语法高亮
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

""""""""""""""""""" 行号与标尺
" 设置行号
set nu
" 在右下角显示光标位置的状态行
set ruler
"set rulerformat=%15(%c%V\ %p%%%)

""""""""""""""""""" 搜索
" 搜索时高亮显示被找到的文本
set hlsearch
" 开启实时搜索，输入搜索内容时就显示搜索结果
set incsearch
" 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set ignorecase smartcase
" 高亮光标所在的行
set cursorline
" 显示匹配的括号
set showmatch

""""""""""""""""""" 文件读写
" 自动保存
set autowrite
" 文件修改之后自动载入
set autoread
" 不写备份文件
set nowritebackup

""""""""""""""""""" 编码格式
" vim启动时会按照它所列出的字符编码方式逐一探测即将打开的文件的字符编码方式,并且将fileencoding设置为最终探测到的字符编码方式,保存文件时也会将文件保存为这种字符编码方式 (不管是否新文件都如此)。
set fileencodings=utf-8,gbk,cp936,cp950,latin1
" vim内部使用的字符编码方式，包括Vim的buffer(缓冲区)、菜单文本、消息文本等。
" 你可以用另外一种编码来编辑和保存文件,如你的vim的encoding为utf-8,所编辑的文件采用cp936编码,vim会自动将读入的文件转成utf-8(vim的能读懂的方式），而当你写入文件时,又会自动转回成cp936（文件的保存编码)
set encoding=utf-8

""""""""""""""""""" 对齐方式
" 自动对齐,与shiftwidth选项结合使用
set ai
" 智能对齐
set si
" 按照C语言的语法，自动地调整缩进的长度
set ci 

""""""""""""""""""" 制表符与退格符
" 设置退格键,可以删除首的空格，断行，以及开始进入Insert模式之前的位置（即以前编辑过的位置）
" 不设定在插入状态无法用退格键和 Delete 键删除回车符
set backspace=indent,eol,start
" 输入Tab时，自动替换成空格
set expandtab
" tab缩进的字符数
set tabstop=4
" 一个Tab展示成的空格个数
set softtabstop=4
" 换行时自动缩进的字节数
set shiftwidth=4

""""""""""""""""""" 折叠方式
" manual  手工定义折叠
" indent  更多的缩进表示更高级别的折叠
" expr    用表达式来定义折叠
" syntax  用语法高亮来定义折叠
" diff    对没有更改的文本进行折叠
" marker  对文中的标志折叠
"set foldmethod=marker
   
""""""""""""""""""" 提示音
" 关闭错误信息响铃
set noerrorbells 
" 关闭使用可视响铃代替呼叫
set novisualbell
" 置空错误铃声的终端代码
set t_vb= 

"""""""""""""""""""
" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
 set scrolloff=5

""""""""""""""""""" 命令行与状态行
 " 显示vim模式
"set showmode
" 显示命令行
"set showcmd
" 命令行（在状态行下）的高度，设置为1
"set cmdheight=1
" 总是显示状态栏 (默认值为 1, 无法显示状态栏)
set laststatus=2 
" 设置在状态行显示的信息
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ "

if has("autocmd")
   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""" 插件配置
""""""""""""""""""" 主题
set background=dark 
set t_Co=256
colorscheme molokai
let g:molokai_original = 1

""""""""""""""""""" DoxygenToolkit
let g:DoxygenToolkit_fileTag="@filen  : "
let g:DoxygenToolkit_briefTag_pre="@brief  : "
let g:DoxygenToolkit_authorTag="@author : "
let g:DoxygenToolkit_versionTag="@version: "
let g:DoxygenToolkit_dateTag="@date   : "
let g:DoxygenToolkit_authorName="diego" 
let g:DoxygenToolkit_versionString="1.0.0"
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_paramTag_pre="@param  : "
let g:DoxygenToolkit_returnTag="@returns: "
imap <silent> <F3> <Esc>:DoxAuthor<CR>
imap <silent> <F4> <Esc>:Dox<CR>

""""""""""""""""""" YouCompleteMe
set completeopt=longest,menu
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" 回车即选中当前项
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
" 设置全局配置文件的路径
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" 允许自动加载.ycm_extra_conf.py，不再提示
let g:ycm_confirm_extra_conf = 0
" 调用自动补全信息的按键
let g:ycm_key_invoke_completion='<C-a>'
" 是否允许自动补全诊断符号
let g:ycm_enable_diagnostic_signs = 1
" 是否自动补全诊断符号高亮
let g:ycm_enable_diagnostic_highlighting = 1
" 是否收集注释和字符变量值作为自动补全信息
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_python_binary_path = 'python'
" 追加语义补全触发条件(此处为一个正则表达式)
let g:ycm_semantic_triggers =  {
       \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
       \ 'cs,lua,javascript': ['re!\w{2}'],
       \}
" 跳转到定义
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
" 返回到跳转前的位置
nnoremap <c-l> <c-o>

""""""""""""""""""" vim-airline 
" 使用powerline打过补丁的字体
"let g:airline_powerline_fonts = 1
" 顶部tab显示" 
let g:airline#extensions#tabline#enabled=1
" 映射切换buffer的键位
nmap <tab> :bn<cr> 

""""""""""""""""""" nerdtree
map <silent> <F2> :NERDTreeToggle<CR>
" 文件列表在右侧
let g:NERDTreeWinPos="right"
" 忽略以下文件的显示
let g:NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let g:NERDTreeShowBookmarks=1
" 显示文件
let g:NERDTreeShowFiles=1
" 显示隐藏文件
let g:NERDTreeShowHidden=1
" 修改默认箭头符号
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" 显示行号
"let NERDTreeShowLineNumbers=1
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""""""""""""""""""" taglist.vim 
map <silent> <F1> :TlistToggle<cr>
" 只显示当前文件的tags
let g:Tlist_Show_One_File=1
" 随文件自动更新
"let Tlist_Auto_Update=1
" 高亮显示
let g:Tlist_Auto_Highlight_tag=1
" taglist窗口是最后一个窗口，则退出vim
let g:Tlist_Exit_OnlyWindow=1
