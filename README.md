```
sudo apt install git stow
git clone https://github.com/hiroki706/dotconfig.git ~/Documents/dotfiles

cd ~/Documents/dotfiles
stow --no-folding -t ~/.config config
stow --no-folding -t ~ home
```
conflict
```
stow --adopt -t ~/.config config
```
