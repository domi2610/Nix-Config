# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # latest Nix package Manager Version
  nix.package = pkgs.nixUnstable;

  # enable experimental features
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  # systmed stop job timer
  systemd.extraConfig = ''
    DefaultTimeoutStopSec=10s
  '';

  # environment variables
  environment.sessionVariables = {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # latest Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # enable thermald
  services.thermald.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # dbus and portal
  services.dbus.enable = true;

  # Enable the GNOME Desktop Environment.

  # for Hyprland
  #services.xserver.displayManager.sddm.enable = true;
  #services.xserver.displayManager.lightdm.greeter.enable = false;

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "de";
    xkbVariant = "nodeadkeys";
  };

  # Configure console keymap
  console.keyMap = "de-latin1-nodeadkeys";

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.samsung-unified-linux-driver ];

  # enable locate
  services.locate = {
    enable = true;
    package = pkgs.mlocate;
    localuser = null;
    interval = "hourly";
  };

  # Enable sound with pipewire.
  sound.enable = false;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # enable zsh for user
  programs.zsh.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.domenic = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "Domenic Dewald";
    extraGroups = [ "networkmanager" "wheel" "docker" "audio" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = [ ];

  programs.noisetorch.enable = true;

  # Virtualization with virt-manager
  programs.dconf.enable = true;

  # Gamemode
  programs.gamemode.enable = true;

  # flatpak support
  services.flatpak.enable = true;

  # Fonts
  fonts.packages = with pkgs;
    [ (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; }) ];

  virtualisation.docker.enable = true;
  system.stateVersion = "23.11"; # Did you read the comment?

}
