set number
set hidden
syntax on
set incsearch
set completeopt=longest,menuone
set mouse=a
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'digitaltoad/vim-pug'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'

Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim', { 'for': 'vimwiki' }

Plug 'vim-syntastic/syntastic'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mtscout6/syntastic-local-eslint.vim'
Plug 'heavenshell/vim-jsdoc'

Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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
nmap [q :cp<CR>
nmap ]q :cnext<CR>
nmap [l :lp<CR>
nmap ]l :lnext<CR>
nmap <C-p> :Files<CR>
nmap <C-\> :Ag<Space>
vmap <C-\> y:Ag<Space><C-R>"<CR>
nmap ; :Buffers<CR>
map <leader><tab><tab> :Commands<CR>
nmap <leader><tab>m <plug>(fzf-maps-n)
xmap <leader><tab>m <plug>(fzf-maps-x)
omap <leader><tab>m <plug>(fzf-maps-o)

autocmd FileType typescript nmap <C-]><C-]> :TsuquyomiDefinition<CR>
autocmd FileType typescript nmap <C-]><C-[> :TsuquyomiGoBack<CR>
autocmd FileType typescript nmap <C-]><C-R> :TsuquyomiReferences<CR>
autocmd FileType typescript nmap <C-]><C-E> :TsuquyomiGeterr<CR>
autocmd FileType typescript nmap <C-]><C-I> :TsuquyomiImport<CR>

"remove trailing spaces
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
nnoremap <F6> o<Esc>"=strftime("%H:%M:%S ")<CR>P

nmap <leader>wf :VimwikiSearch<Space>

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_typescript_tslint_exe = 'npx tslint'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {"mode": "passive"}

let g:javascript_plugin_jsdoc = 1

let g:tsuquyomi_completion_detail = 1
let g:tsuquyomi_disable_quickfix = 1
let g:tsuquyomi_disable_default_mappings = 1
let g:tsuquyomi_single_quote_import = 1

let g:jsdoc_input_description = 1
let g:jsdoc_allow_input_prompt = 1
let g:airline_theme = 'angr'
let g:jsx_ext_required = 0
" for airline to be visible always
set laststatus=2
" hide bottom mode line
set noshowmode
" no delay after esc
set ttimeoutlen=50
" indentation
autocmd Filetype javascript,typescript,css,scss setlocal tabstop=2 shiftwidth=2 softtabstop=0 expandtab
autocmd Filetype json setlocal tabstop=4 shiftwidth=4 softtabstop=0 expandtab
autocmd Filetype php,html setlocal tabstop=4 shiftwidth=4 softtabstop=0 expandtab
autocmd FileType typescript nmap <buffer> <C-B> : <C-u>echo tsuquyomi#hint()<CR>
