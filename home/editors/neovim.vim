set nobackup
set number
set termguicolors " 24-bit colors

nmap <leader>b :BufferLineCycleNext<cr>
nmap <leader>B :BufferLineCyclePrev<cr>

set number           " Line numbers
set showcmd          " Show command issued
set fillchars=vert:\│

set list
set listchars=nbsp:☠,tab:│\ ,trail:-,extends:>,precedes:<,nbsp:+
set textwidth=81

set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P
set laststatus=2

" UX
noremap j gj
noremap k gk

" Make Y act consistant with C and D
nnoremap Y y$

" Don't leave visual mode after indenting
vnoremap < <gv
vnoremap > >gv

" Window movement
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"
