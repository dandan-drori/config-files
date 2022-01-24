colorscheme slate
syntax on
set re=2
set number relativenumber
set nowrap
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set smarttab
set nohlsearch
set incsearch
set visualbell
set noerrorbells
set noswapfile
set nobackup

let mapleader=" "
nnoremap <A-S-down> yyp

function! s:swap_lines(n1, n2)
	let line1 = getline(a:n1)
	let line2 = getline(a:n2)
	call setline(a:n1, line2)
	call setline(a:n2, line1)
endfunction

function! s:swap_up()
	let n = line('.')
	if n == 1
		return
	endif

	call s:swap_lines(n, n - 1)
	exec n - 1
endfunction

function! s:swap_down()
	let n = line('.')
	if n == line('$')
		return
	endif

	call s:swap_lines(n, n + 1)
	exec n + 1
endfunction

nmap <silent> <A-up> :call <SID>swap_up()<CR>
nmap <silent> <A-down> :call <SID>swap_down()<CR>
nnoremap <C-s> :w<CR>
nnoremap <C-c> <Esc>
inoremap kj <Esc>
