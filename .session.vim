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
badd +4 flake.nix
badd +59 modules/features/neovim/dotfiles/lua/config/files/init.lua
badd +17 modules/features/neovim/dotfiles/lua/config/finder/init.lua
badd +1 ~/.icons/hicolor/128x128/apps/gitcomet.png
badd +1 ~/.bash_history
badd +1 /usr/bin/env
badd +1 /run/avahi-daemon/pid
badd +1 /proc/1/cpu_resctrl_groups
badd +27 modules/features/neovim/dotfiles/plugin/session.lua
badd +1 modules/features/neovim/dotfiles/init.lua
badd +8 modules/features/neovim/dotfiles/lua/config/lsp/init.lua
badd +1 modules/hosts/saturn/default.nix
badd +80 modules/features/neovim/default.nix
badd +1242 flake.lock
badd +1 /nix/store/2pdgzyp8jb8qpnhip6jl0a3wr6asv70n-neovim-unwrapped-0.12.5/share/nvim/runtime/tutor/en/vim-01-beginner.tutor
badd +1 .gitignore
badd +8 modules/hosts/iso/default.nix
badd +11 modules/features/fish/default.nix
badd +9 modules/features/neovim/dotfiles/lua/config/keymaps.lua
badd +69 modules/features/neovim/dotfiles_backup/lua/jakob/completion/init.lua
badd +17 modules/features/fish/dotfiles/config.fish
badd +8 modules/features/fish/dotfiles/functions/tmux-sessionizer.fish
badd +3 modules/features/neovim/dotfiles_backup/lua/jakob/format.lua
badd +15 modules/features/neovim/dotfiles_backup/lua/jakob/git.lua
badd +37 modules/features/neovim/dotfiles_backup/lua/jakob/harpoon.lua
badd +41 modules/features/neovim/dotfiles_backup/lua/jakob/keymaps.lua
badd +25 modules/features/neovim/dotfiles_backup/lua/jakob/lsp/keymaps.lua
badd +1 modules/features/neovim/dotfiles_backup/lua/jakob/oil.lua
badd +31 modules/features/neovim/dotfiles_backup/lua/jakob/treesitter.lua
badd +33 modules/features/fish/dotfiles/functions/fish_right_prompt.fish
badd +1 modules/features/neovim/dotfiles_backup/lua/jakob/whichkey.lua
badd +1 modules/features/neovim/dotfiles_backup/lua/jakob/telescope.lua
badd +1 modules/features/neovim/dotfiles_backup/lua/jakob/options.lua
badd +3 modules/features/neovim/dotfiles_backup/lua/jakob/mini.lua
badd +1 modules/features/neovim/dotfiles_backup/lua/jakob/lualine.lua
badd +3 modules/features/neovim/dotfiles/lua/config/ui/init.lua
badd +1 modules/features/neovim/dotfiles_backup/init.lua
badd +3 modules/features/neovim/dotfiles_backup/lua/jakob/colors.lua
badd +4 modules/features/neovim/dotfiles/lua/config/colors.lua
badd +6 modules/features/neovim/dotfiles/lua/config/format/init.lua
argglobal
%argdel
edit modules/features/neovim/dotfiles_backup/lua/jakob/format.lua
argglobal
balt modules/features/neovim/dotfiles_backup/lua/jakob/colors.lua
setlocal foldmethod=indent
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=99
setlocal foldminlines=1
setlocal foldnestmax=10
setlocal foldenable
2
sil! normal! zo
let s:l = 3 - ((2 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 3
normal! 02|
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=1
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
