{ pkgs, ... }:

{

  imports = [
    ./neovim
    ./starship
    ./tmux
    ./kitty
    ./zsh
    ./git
  ];

  home.username = "domenic";
  home.homeDirectory = "/home/domenic";
  home.packages = with pkgs; [
    mangohud
    firefox
    lazygit
    bottles
    curl
    wget
    sshfs
    nil
    nixfmt-rfc-style
    ripgrep
    heroic
    obsidian
    bat
    whatsapp-for-linux
    teamspeak_client
    protonup-qt
    ani-cli
    btop
    mpv
    gnome-secrets
    spotify
    libreoffice
    zip
    rar
    unzip
    helvum
    discord
    gimp
    rawtherapee
  ];

  home.file = {
    ".config/nixpkgs/config.nix".text = ''
      {
          allowUnfree = true;
      }
    '';
  };

  programs.bash.enable = true;

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  home.stateVersion = "24.05";
}
