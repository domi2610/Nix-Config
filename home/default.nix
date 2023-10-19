{ pkgs, ... }:

{

  imports = [ ./neovim ./starship ./tmux ./kitty ./zsh ./git ];

  home.username = "domenic";
  home.homeDirectory = "/home/domenic";
  home.packages = with pkgs; [
    firefox
    lazygit
    bottles
    curl
    wget
    sshfs
    nil
    nixfmt
    ripgrep
    heroic
    obsidian
    bat
    whatsapp-for-linux
    teamspeak_client
    teams-for-linux
    protonup-qt
    ani-cli
    btop
    gnome-secrets
    mpv
    spotify
    libreoffice
    zip
    rar
    unzip
    helvum
    discord
  ];

  home.file = {
    ".config/nixpkgs/config.nix".text = ''
      {
          allowUnfree = true;
      }
    '';
  };

  programs.obs-studio.enable = true;

  programs.bash.enable = true;

  home.stateVersion = "23.11";
}
