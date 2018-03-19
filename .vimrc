set number
set hidden
syntax on
set incsearch
set mouse=a
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'

Plug 'vim-syntastic/syntastic'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mtscout6/syntastic-local-eslint.vim'

Plug 'elixir-editors/vim-elixir'

Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
call plug#end()
set ts=2 sw=2
set signcolumn=yes

map <C-t><C-t> :NERDTreeFocus<CR>
map <C-t><C-n> :NERDTreeToggle<CR>
map <C-c><C-c> :SyntasticCheck<CR>
map <C-c><C-x> :SyntasticReset<CR>
map <C-c><C-n> :ll<CR>
nmap <C-p> :Files<CR>
nmap <C-\> :Ag<Space>
nmap ; :Buffers<CR>

"remove trailing spaces
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {"mode": "passive"}


let g:jsx_ext_required = 0
" for airline to be visible always
set laststatus=2
" hide bottom mode line
set noshowmode
" no delay after esc
set ttimeoutlen=50
" indentation
autocmd Filetype javascript,css setlocal tabstop=2 shiftwidth=2 softtabstop=0 expandtab
autocmd Filetype json setlocal tabstop=4 shiftwidth=4 softtabstop=0 expandtab
autocmd Filetype php,html setlocal tabstop=4 shiftwidth=4 softtabstop=0 expandtab
