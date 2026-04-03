# dotfiles -PC開発環境構築設定

このdotfilesはLinuxとWindowsで共有されています。

## OSごとの設定の違い

### Linux
- 設定ファイル: `~/.config/` 以下
- シェル: bash, fish, nushell
- Neovim: `~/.config/nvim`
- Nushell: `~/.config/nushell`

### Windows
- 設定ファイル: `~/AppData/` 以下
- シェル: PowerShell, Nushell
- Neovim: `~/AppData/Local/nvim`
- Nushell: `~/AppData/Roaming/nushell`
- PowerShell: `~/Documents/PowerShell/`

### OS固有の設定
- `.chezmoi.windows/` - Windows固有の設定が含まれています
- `.chezmoi.linuxignore` - Linuxで無視するファイル（Windows用の設定など）
- `.chezmoi.windowsignore` - Windowsで無視するファイル（Linux用の設定など）

## Windowsでのインストール

### 1. miseのインストール

```powershell
# PowerShellでインストール
winget install jdx.mise
```

### 2. Neovimのインストール

```powershell
winget install Neovim.Neovim
```

### 3. その他のツールのインストール

```powershell
# Git
winget install Git.Git

# Starship
winget install starship

# Lazygit
winget install JesseDuffield.lazygit

# Yazi (optional)
winget install sxyazi.yazi
```

### 4. chezmoiのセットアップ

```powershell
# gitがインストールされていることを確認
git --version

# GitHubからchezmoi管理ディレクトリをクローン
git clone git@github.com.hiroki:hiroki706/dotfiles.git $env:USERPROFILE\.local\share\chezmoi

# chezmoiの初期設定と適用
cd $env:USERPROFILE\.local\share\chezmoi
git remote set-url origin git@github.com.hiroki:hiroki706/dotfiles.git
chezmoi init
chezmoi apply

# miseに管理されたツールをインストールする
mise install
```

### 5. PowerShellプロファイルの再読み込み

```powershell
# プロファイルを再読み込み
. $PROFILE
```

## Debianでのインストール

### 1. miseのインストール

```bash
# Dockerのインストール（nix/setup.shに必要）
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# miseのインストール
curl https://mise.jdx.dev/mise-install.sh | sh

# 残念ながら、mise自体はchezmoiの設定ファイルでは管理しない
# 手動でインストール
git clone https://github.com/jdx/mise ~/.config/mise
```

### 2. chezmoiのセットアップ

```bash
# gitインストール
sudo apt update
sudo apt install -y git

# GitHubからchezmoi管理ディレクトリをクローン
git clone git@github.com.hiroki:hiroki706/dotfiles.git ~/.local/share/chezmoi

# chezmoiの初期設定と適用
cd ~/.local/share/chezmoi
git remote set-url origin git@github.com.hiroki:hiroki706/dotfiles.git
chezmoi init
chezmoi apply

# パッケージ更新を適用する
./nix/setup.sh

# miseに管理されたツールをインストールする
mise install
```

## 設定の更新

### 1. 設定ファイルを変更する

chezmoiを通じて設定を変更します。

```bash
# 設定ファイルを開いて編集
chezmoi edit ~/.config/starship.toml
chezmoi edit ~/.bashrc
chezmoi edit ~/.gitconfig
```

または、直接ファイルを開いて編集した後、chezmoiに登録します。

```bash
# 変更したファイルをchezmoiに追加
chezmoi add ~/.config/starship.toml
```

### 2. 変更を確認

```bash
# 現在の設定と変更内容を確認
chezmoi status

# システムに適用する前のdry-run（実際には適用されない）
chezmoi apply --dry-run
```

### 3. 変更をGitHubにプッシュ

```bash
cd ~/.local/share/chezmoi

# 変更内容を確認
git status

# 変更をステージ
git add .

# コミット
git commit -m "Update configuration"

# GitHubにプッシュ
git push
```

### 4. 他のマシンに適用

別マシンで同じdotfilesを使用する場合：

```bash
# GitHubからリポジトリをクローン
git clone git@github.com.hiroki:hiroki706/dotfiles.git ~/.local/share/chezmoi

# chezmoiで初期設定して適用
cd ~/.local/share/chezmoi
chezmoi init
chezmoi apply

# 必要に応じてnix/setup.shとmise installを実行
./nix/setup.sh
mise install
```

## 一般的なchezmoiコマンド

```bash
# 設定のステータス確認
chezmoi status

# 指定したファイルを開いて編集
chezmoi edit [file]

# 特定のファイルをステージング
chezmoi add [file]

# 一括でステージング
chezmoi add

# 変更を適用
chezmoi apply

# 変更内容を確認（dry-run）
chezmoi apply --dry-run

# 最新の状態をリモートから取得
chezmoi managed --update
```

## github sshの設定

github-cliは複数アカウントのsshkeyに対応していないので従来の方法を選択
1. ssh-key生成
    ```bash
    cd ~/.ssh
    ssh-keygen -t rsa -f id_rsa_hiroki706 # 個人用
    ```
    ```bash
    ssh-keygen -t rsa -f id_rsa_iniad # 学校用
    ```
2. Githubに公開鍵登録
    ```sh
    # nu shell
    open ./id_rsa_hiroki706.pub | clip.exe
    # bash
    cat ./id_rsa_hiroki706.pub | clip.exe
    ```
    ```sh
    # nu shell
    open ./id_rsa_iniad.pub | clip.exe
    # bash
    cat ./id_rsa_iniad.pub | clip.exe
    ```
3. 接続確認
    ```bash
    ssh -T git@github.com.hiroki
    ssh -T git@github.com.iniad
    ```

## 全設定の圧縮アーカイブ

1. 7zを使用
    ```bash
    nix-shell -p p7zip
    ```
2. 必要なファイルを圧縮
    ```bash
    7z a -mx9 -r dotfiles.7z nix/ .ssh/ .config/ .bashrc .gitignore README.md
    ```
## パッケージアップグレードとストレージ開放

1. flakeをupdateすることで再ビルド
    ```bash
    cd ~/nix
    nix flake update
    sudo nixos-rebuild switch --flake ~/nix#wsl
    ```
2. miseパッケージアップグレード
    ```bash
    mise upgrade
    ```
3. ガベージコレクション
    ```bash
    # 古い世代を削除(1世代前は残る)
    sudo nix-collect-garbage -d
    # システムとユーザーキャッシュをクリア
    sudo nix-store --optimise
    ```
