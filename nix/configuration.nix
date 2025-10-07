# ~/nix/configuration.nix
{ config, pkgs, ... }: {
  wsl.enable = true;
  wsl.defaultUser = "iniad";

  users.users.yourname = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
  };

  environment.systemPackages = with pkgs; [
    docker
    mise
    nushell
    git
    curl
    wget # vscode-serverのために必要
    gnupg # miseのパッケージハッシュ検証にgpgコマンドが必要
    #gnumake # lua@5.1 のインストールにmakeコマンドが必要
    #gcc # lua@5.1のためにgccが必要
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # vscode-serverとmiseがダウンロードしたバイナリファイルを動作させるための設定
  programs.nix-ld.enable = true;
  time.timeZone = "Asia/Tokyo";
  i18n.defaultLocale = "ja_JP.UTF-8";
}
