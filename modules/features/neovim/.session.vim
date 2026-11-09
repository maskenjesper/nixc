let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
doautoall SessionLoadPre
silent only
silent tabonly
cd ~/nixc/modules/features/neovim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
set shortmess+=aoO
badd +7 dotfiles/lua/config/format/init.lua
badd +104 default.nix
badd +275 /nix/store/1k614xljph1xggd583f8x98ag6xy67wd-neovim-unwrapped-0.12.6/nvim-packdir/pack/myNeovimPackages/opt/conform.nvim/doc/conform.txt
badd +5 dotfiles/lua/config/lsp/init.lua
badd +48 dotfiles/lua/config/lsp/lua_ls.lua
badd +1 dotfiles/lua/config/lsp/nixd.lua
badd +7 dotfiles/lua/config/lsp/roslyn_ls.lua
badd +649 /nix/store/b72618d5pslwg9hn9iq7h40bk2zmak8q-neovim-unwrapped-0.12.6/share/nvim/runtime/doc/lsp.txt
badd +50 /nix/store/1k614xljph1xggd583f8x98ag6xy67wd-neovim-unwrapped-0.12.6/nvim-packdir/pack/myNeovimPackages/start/nvim-lspconfig/doc/lspconfig.txt
badd +1 /nix/store/rwby92z0j93p0n1xg96m7113m3j1alfs-vimplugin-nvim-lspconfig-2.12.0/doc/configs.txt
badd +38 /nix/store/rwby92z0j93p0n1xg96m7113m3j1alfs-vimplugin-nvim-lspconfig-2.12.0/lsp/csharp_ls.lua
badd +1 /nix/store/rwby92z0j93p0n1xg96m7113m3j1alfs-vimplugin-nvim-lspconfig-2.12.0/CONTRIBUTING.md
badd +1 /nix/store/rwby92z0j93p0n1xg96m7113m3j1alfs-vimplugin-nvim-lspconfig-2.12.0/neovim.yml
badd +1 /nix/store/rwby92z0j93p0n1xg96m7113m3j1alfs-vimplugin-nvim-lspconfig-2.12.0/doc/configs.md
badd +1 /nix/store/rwby92z0j93p0n1xg96m7113m3j1alfs-vimplugin-nvim-lspconfig-2.12.0/doc/server_configurations.md
badd +1 /nix/store/rwby92z0j93p0n1xg96m7113m3j1alfs-vimplugin-nvim-lspconfig-2.12.0/doc/server_configurations.txt
badd +1 /nix/store/rwby92z0j93p0n1xg96m7113m3j1alfs-vimplugin-nvim-lspconfig-2.12.0/doc/tags
argglobal
%argdel
edit default.nix
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
balt dotfiles/lua/config/format/init.lua
setlocal foldmethod=indent
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=99
setlocal foldminlines=1
setlocal foldnestmax=10
setlocal foldenable
16
sil! normal! zo
18
sil! normal! zo
let s:l = 104 - ((44 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 104
normal! 024|
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
