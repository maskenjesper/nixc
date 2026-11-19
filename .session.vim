let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
doautoall SessionLoadPre
silent only
silent tabonly
cd ~/nixc
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
set shortmess+=aoO
badd +16 modules/system/theme/cursor.nix
badd +4 modules/features/niri/dotfiles/cfg/rules.kdl
badd +2 modules/features/niri/dotfiles/cfg/animation.kdl
badd +13 modules/system/theme/default.nix
badd +1 modules/system/core/default.nix
badd +1 modules/system/core/user.nix
badd +1 modules/system/theme/gtk.nix
badd +6 modules/system/theme/font.nix
argglobal
%argdel
edit modules/system/theme/cursor.nix
argglobal
balt modules/system/theme/font.nix
setlocal foldmethod=indent
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=99
setlocal foldminlines=1
setlocal foldnestmax=10
setlocal foldenable
12
sil! normal! zo
24
sil! normal! zo
let s:l = 17 - ((16 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 17
normal! 024|
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
