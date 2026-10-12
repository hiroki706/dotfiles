# stowシンボリックリンク
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
# fish インストール
```
sudo apt install fish
chsh -s $(which fish)
```
### mise インストール
```
sudo apt update -y && sudo apt install -y curl
sudo install -dm 755 /etc/apt/keyrings
curl -fSs https://mise.jdx.dev/gpg-key.pub | sudo tee /etc/apt/keyrings/mise-archive-keyring.asc 1>/dev/null
echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.asc] https://mise.jdx.dev/deb stable main" | sudo tee /etc/apt/sources.list.d/mise.list
sudo apt update -y
sudo apt install -y mise
```

dokcer インストール
### docker
