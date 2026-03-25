"======== basic settings =========
set nocompatible
filetype plugin indent on
syntax on

" encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=-utf-8,gbk,gb2312,cp936

" UI
set number
set relativenumber
set cursorline
set showcmd
set showmode
set wildmenu
set laststatus=2
set ruler
set signcolumn=yes
set cmdheight=1

" serch
set ignorecase
set smartcase
set incsearch
set hlsearch

" indentation
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent

" expierence
set mouse=a
set clipboard=unnamedplus
set hidden
set updatetime=300
set timeoutlen=400

" split
set splitbelow
set splitright

"no backupfiles
set nobackup
set nowritebackup
set noswapfile
set undofile
set undodir=~/.vim/undodir

" leader key
let mapleader=" "

"========= plugins =========
call plug#begin('~/.vim/plugged') 

" appearance
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" file searching & fuzzy
Plug 'junegunn/fzf',{ 'do':{ -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" syntax improved
Plug 'sheerun/vim-polyglot'

" Git
Plug 'tpope/vim-fugitive'

Plug 'neoclide/coc.nvim',{'branch':'release'}

call plug#end()

" colors
set termguicolors
colorscheme gruvbox
set background=dark

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'

" cancel search highlight
nnoremap <leader>h :nohlsearch<CR>

" file/content navigation
" fzf
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>fw :Rg<CR>

">>> coc.nvim
let g:coc_global_extentions = [
  \ 'coc-json',
  \ 'coc-vimlsp',
  \ 'coc-clangd',
  \ 'coc-pyright']

" Tab  completion
" 用 Tab 选择补全项
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 回车确认补全
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" 常用 LSP 操作
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gy <Plug>(coc-type-definition)

nmap <leader>rn <Plug>(coc-rename)
nmap <leader>ca <Plug>(coc-codeaction)
nmap <leader>e  :CocDiagnostics<CR>

" === Symbol / code navigation ===
" 当前文件符号（函数/类/变量列表）：类似 IDE 的 Outline
nnoremap <silent> <leader>o :CocList outline<CR>

" 工作区符号搜索：输入函数名/类名，跨项目跳转
nnoremap <silent> <leader>ss :CocList -I symbols<CR>

" 已打开 buffers 列表（比 :ls 好用）
nnoremap <silent> <leader>sb :CocList buffers<CR>

" 代码操作/修复建议列表（比按一次 ca 更可控）
nnoremap <silent> <leader>sa :CocList actions<CR>

" 对当前光标位置应用“最可能的” quickfix（例如补 include、修复小问题）
nnoremap <silent> <leader>qf  :call CocActionAsync('doQuickfix')<CR>

" Better Hover
" 光标停一下就高亮同名引用
autocmd CursorHold * silent call CocActionAsync('highlight')

" 光标停留时浮窗显示当前错误信息（可选）
" autocmd CursorHold * silent call CocActionAsync('diagnosticHover')


" === Diagnostics navigation ===
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" 快速在浮窗里看当前光标处的错误信息（不用打开列表）
nnoremap <silent> <leader>k :call CocActionAsync('diagnosticInfo')<CR>

" 悬浮文档
nnoremap <silent> K :call CocActionAsync('doHover')<CR>
"format manually
nnoremap <leader>f :call CocAction('format')<CR>
"<<< coc.nvim

" 新手友好键位体系
" save & quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" split
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-l>l
