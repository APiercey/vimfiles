mkdir ~/.local
mkdir ~/.config
mkdir ~/.local/share/nvim

(ln -sf ~/vimfiles/.vim ~/)
(ln -sf ~/vimfiles/.config/coc ~/.config)
(ln -sf ~/vimfiles/.config/nvim ~/.config)
(ln -sf ~/vimfiles/.local/share/nvim ~/.local/share)
