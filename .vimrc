set number
set hidden
set completeopt=longest,menuone,preview
set splitbelow
set sw=2 ts=2
set mouse=a
set incsearch
set noshowmode
call plug#begin('~/.vim/plugged')
"fs, buffers, search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'

"languages
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'rust-lang/rust.vim'

"language servers/code analyzers
Plug 'vim-syntastic/syntastic'
Plug 'Quramy/tsuquyomi'
Plug 'majutsushi/tagbar'

"organizer
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim', { 'for': 'vimwiki' }

"helpers
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdcommenter'

"git
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

"visual
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

"Custom Mappings
"Filesystem
nmap <C-T> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

nmap <C-p> :Files<CR>
nmap <C-\> :Ag<Space>
vmap <C-\> y:Ag<Space><C-R>"<CR>
nmap ; :Buffers<CR>
nmap <leader>wf :VimwikiSearch<Space>
"reindent all file
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"tsuquyomi
autocmd FileType typescript nmap <C-]><C-]> <Plug>(TsuquyomiDefinition)
autocmd FileType typescript nmap <C-]><C-[> <Plug>(TsuquyomiGoBack)
autocmd FileType typescript nmap <C-]><C-R> <Plug>(TsuquyomiReferences)
autocmd FileType typescript nmap <C-]><C-P> <Plug>(TsuquyomiImplementation)
autocmd FileType typescript nmap <C-]><C-I> :TsuquyomiImport<CR>
autocmd FileType typescript nmap <C-]><C-L> :TsuquyomiAsyncGeterr<CR>
autocmd FileType typescript nmap <C-]><C-H> :TsuquyomiSignatureHelp<CR>
autocmd FileType typescript nmap <buffer> <C-B> : <C-u>echo tsuquyomi#hint()<CR>

"syntastic
nmap <C-C><C-L> :SyntasticCheck<CR>

"variables
"tsuquyomi
let g:tsuquyomi_disable_default_mappings = 1
let g:tsuquyomi_disable_quickfix = 1
let g:tsuquyomi_completion_detail = 1
let g:tsuquyomi_completion_preview = 0
let g:tsuquyomi_disable_default_mappings = 1
let g:tsuquyomi_single_quote_import = 1

"typescript ctags
let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }
"syntastic
let g:syntastic_mode_map = {"mode": "passive"}
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
let g:syntastic_javascript_eslint_exe = 'npx eslint'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

autocmd Filetype javascript,typescript setlocal et sw=2 ts=2 sts=0
