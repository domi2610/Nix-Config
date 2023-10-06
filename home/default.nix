{ pkgs, ... }:

{

  imports = [ ./neovim ./starship ./tmux ./kitty ./zsh ./git ./hyprland ];

  home.username = "domenic";
  home.homeDirectory = "/home/domenic";
  home.packages = with pkgs; [
    ungoogled-chromium
    lazygit
    bottles
    curl
    wget
    sshfs
    nil
    nixfmt
    stylua
    ripgrep
    heroic
    obsidian
    bat
    whatsapp-for-linux
    teamspeak_client
    teams-for-linux
    thunderbird
    protonup-qt
    ani-cli
    htop
    keepassxc
    mpv
    spotify
    libreoffice
    zip
    rar
    unzip
    helvum
    webcord
  ];

  programs.obs-studio.enable = true;

  programs.bash.enable = true;

  home.stateVersion = "23.11";
}
