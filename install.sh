#--- Переменные -----------------------------------------------------
DOTFILES_PATH=$(dirname $(realpath "$0"))


#--- Создание симлинков ---------------------------------------------
mkdir -p ~/Pictures/
ln -sf "$DOTFILES_PATH"/Wallpapers ~/Pictures

for file in ./config/*; do
    filename=$(basename "$file")
    
    rm -rf ~/.config/"$filename"
    ln -sf "$DOTFILES_PATH"/config/"$filename" ~/.config
done

mkdir -p ~/.local/bin
for file in ./scripts/*; do
    filename=$(basename "$file")
    
    ln -sf "$DOTFILES_PATH"/scripts/"$filename" ~/.local/bin
done

wp random