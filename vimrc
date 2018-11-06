" Leader
let mapleader = " "

" Allow async
let g:has_async = 1

" Plugins
call plug#begin('~/dotfiles/vim/plugins')
Plug 'christoomey/vim-tmux-navigator'
Plug 'elixir-lang/vim-elixir'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'w0rp/ale'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

set backspace=2		" Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler		" shows cursor position all the time
set showcmd " display incomplete commands
set autowrite " Automatically :write before running commands

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespaces
set list listchars=tab:»·,trail:·,nbsp:·

" Use 1 space after punctuation
set nojoinspaces

" Make it obvious where 80 characters is
set textwidth=110
set colorcolumn=+1

" Numbers
set number
set numberwidth=5
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<Tab>"
  else
    return "\<C-p>"
  endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Color scheme
let g:solarized_termcolors = 16
let g:solarized_contrast = "high"
set bg=dark

" Ctrl-P configuration
let g:ctrlp_custom_ignore = 'node_modules\|DS_STORE\|git\|vendor\|public\|tmp\|spec/fixtures'

" ruby syntax highlighting is fucked on new vim
set regexpengine=1
let g:ruby_indent_block_style = 'do'

" Use The Silver Searcher over native grep if it exists
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  " use ag in CtrlP for listing files. Respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
  " ag is so fast we dont need a cache
  let g:ctrlp_use_caching = 0
endif

