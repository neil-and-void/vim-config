set number
set nocompatible
set foldmethod=syntax
let mapleader = " "
set updatetime=300

" plugins
call plug#begin()
	" Conquer of Completion
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	" nerdtree plugins
	Plug 'preservim/nerdtree' |
    \ Plug 'Xuyuanp/nerdtree-git-plugin' |
		\ Plug 'ryanoasis/vim-devicons'

	" language pack
	Plug 'sheerun/vim-polyglot'

	" TS Syntax
	Plug 'HerringtonDarkholme/yats.vim'

  " tag autopair
  Plug 'alvan/vim-closetag'

  " React snippets
  Plug 'mlaursen/vim-react-snippets'

  " Tailwind snippets
  Plug 'iamcco/coc-tailwindcss'
  
  " lightline
  Plug 'itchyny/lightline.vim'

  " vim git
  Plug 'itchyny/vim-gitbranch'

call plug#end()

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-pairs',
  \ 'coc-pyright',
  \ 'coc-html',
  \ 'coc-css',
  \ ]

" lightline config
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Key remappings
" use <tab> for trigger completion and navigate to the next complete item
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'

" sync nerdtree when opening new tabs
autocmd BufWinEnter * NERDTreeMirror

" Nerd tree navigation"
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h
nnoremap <Leader>. <Esc>:tabn<CR>
nnoremap <Leader>, <Esc>:tabp<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" save and exit remaps
nnoremap <Leader>w <Esc>:w<CR>
nnoremap <Leader>q <Esc>:wq<CR>
nnoremap <Leader>qq <Esc>:wqa<CR>

" Tab settings
autocmd Filetype css setlocal shiftwidth=2 tabstop=2 autocmd Filetype html  setlocal shiftwidth=2 tabstop=2
autocmd Filetype javascript  setlocal  shiftwidth=2 tabstop=2
autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2
autocmd Filetype typescriptreact  setlocal shiftwidth=2 tabstop=2
autocmd Filetype python  setlocal shiftwidth=4 tabstop=4

" auto run commands
autocmd Filetype python nnoremap <Leader>r :w <bar> exec '!python3 '.shellescape('%')<CR>
autocmd Filetype java nnoremap <Leader>r :w <bar> exec '!javac '.shellescape('%').' && java '.shellescape('%:r')<CR>
autocmd Filetype javascript nnoremap <Leader>r :w <bar> exec '!node '.shellescape('%')<CR>
autocmd Filetype c nnoremap <Leader>r :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd Filetype cpp nnoremap <Leader>r :w <bar> exec '!g++ -std=c++11 '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>

" ** Autotag config **
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.tsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,tsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

