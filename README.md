# dotfiles -PC開発環境構築設定
このレポジトリは私のlinux PCの開発環境の設定ファイル集です。
Nix, miseを使用してパッケージ管理をしています。

## WSL-NixOSでのインストール
1. WSL-NixOSのレポジトリからインストール[https://github.com/nix-community/NixOS-WSL](https://github.com/nix-community/NixOS-WSL)
2. NixOS-WSL起動
    ```bash
    wsl -d NixOS
    ```
3. ユーザーネーム変更を適用する
    ```bash
    # nixos-rebuild switchを使用すると正しいユーザーネームが設定されない可能性があります
    sudo nixos-rebuild boot --flake github:hiroki706/dotfiles/main?dir=nix/#wsl
    # WSLシェルを終了しNixOSを停止
    wsl -t NixOS
    # NixOSでシェルを起動しすぐにexit
    wsl -d NixOS --user root exit
    # もう一度NixOSを停止
    wsl -t NixOS
    ```
4. githubからコードをクローン
    ```bash
    git clone git@github.com.hiroki:hiroki706/dotfiles.git
    ```
5. パッケージ更新を適用する
    ```bash
    sudo nixos-rebuild switch --flake ~/nix#wsl
    ```
6. miseに管理されたツールをインストールする
    ```bash
    mise install
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
