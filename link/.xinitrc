xmodmap ~/.Xmodmap

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

unclutter -idle 1 &
xsetroot -cursor_name left_ptr
xset +fp /usr/share/fonts/local
nitrogen --restore &
exec herbstluftwm &>~/herbstluft.log
