set nobackup
set number
set termguicolors " 24-bit colors

set number           " Line numbers
set showcmd          " Show command issued
set fillchars=vert:\│

set list
set listchars=nbsp:☠,tab:│\ ,trail:-,extends:>,precedes:<,nbsp:+
set textwidth=81

set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P
set laststatus=2


"" Bindings {{{

	" map leader key to <space>
	let mapleader = ' '

	" map local leader key to <comma>
	let maplocalleader = ','

	nmap <leader>bs :w<cr>

	" Window movement
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

	nmap <leader>b :BufferLineCycleNext<cr>
	nmap <leader>B :BufferLineCyclePrev<cr>

	nmap <leader>bs :w<cr>

	nnoremap <silent> <leader><space> :Files<CR>
	nnoremap <silent> <leader>a :Buffers<CR>
	nnoremap <silent> <leader>A :Windows<CR>
	nnoremap <silent> <leader>; :BLines<CR>
	nnoremap <silent> <leader>o :BTags<CR>
	nnoremap <silent> <leader>O :Tags<CR>
	nnoremap <silent> <leader>? :History<CR>
	nnoremap <silent> <leader>/ :execute 'Rg ' . input('Rg/')<CR>
	nnoremap <silent> <leader>. :RgIn

	nnoremap <silent> K :call SearchWordWithRg()<CR>
	vnoremap <silent> K :call SearchVisualSelectionWithRg()<CR>
	nnoremap <silent> <leader>gl :Commits<CR>
	nnoremap <silent> <leader>ga :BCommits<CR>
	nnoremap <silent> <leader>ft :Filetypes<CR>
	nnoremap <silent> <leader>bb :Buffers<CR>

	imap <C-x><C-f> <plug>(fzf-complete-file-rg)
	imap <C-x><C-l> <plug>(fzf-complete-line)

	noremap <silent> <leader>? :nohlsearch<CR>
	nnoremap <ESC><ESC> :nohl<CR>

	" UX
	noremap j gj
	noremap k gk

	" Make Y act consistant with C and D
	nnoremap Y y$

	" Don't leave visual mode after indenting
	vnoremap < <gv
	vnoremap > >gv

" }}}

let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
nnoremap <c-p> :FZF<cr>

" Functions {{{
	function! SearchWordWithRg()
	  execute 'Rg' expand('<cword>')
	endfunction

	function! SearchVisualSelectionWithRg() range
	  let old_reg = getreg('"')
	  let old_regtype = getregtype('"')
	  let old_clipboard = &clipboard
	  set clipboard&
	  normal! ""gvy
	  let selection = getreg('"')
	  call setreg('"', old_reg, old_regtype)
	  let &clipboard = old_clipboard
	  execute 'Rg' selection
	endfunction

	function! SearchWithRgInDirectory(...)
	  call fzf#vim#rg(join(a:000[1:], ' '), extend({'dir': a:1}, g:fzf#vim#default_layout))
	endfunction
	command! -nargs=+ -complete=dir RgIn call SearchWithRgInDirectory(<f-args>)

	augroup fzf
	  autocmd!
	  autocmd! FileType fzf
	  autocmd  FileType fzf set laststatus=0 noshowmode noruler
	    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
	augroup END
" }}}

" Command {{{
    " Annoying command mistakes <https://github.com/spf13/spf13-vim>
    com! -bang -nargs=* -complete=file E e<bang> <args>
    com! -bang -nargs=* -complete=file W w<bang> <args>
    com! -bang -nargs=* -complete=file Wq wq<bang> <args>
    com! -bang -nargs=* -complete=file WQ wq<bang> <args>
    com! -bang Wa wa<bang>
    com! -bang WA wa<bang>
    com! -bang Q q<bang>
    com! -bang QA qa<bang>
    com! -bang Qa qa<bang>
    " Forget to sudo?
    com! WW w !sudo tree % >/dev/null

    " Shortcuts
    cnoremap ;/ <C-R>=expand('%:p:h').'/'<CR>
    cnoremap ;; <C-R>=expand("%:t")<CR>
    cnoremap ;. <C-R>=expand("%:p:r")<CR>

    " Mimic shortcuts in the terminal
    cnoremap <C-a> <Home>
    cnoremap <C-e> <End>
" }}}
