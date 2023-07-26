{
  description = "Domenic's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, home-manager, hyprland, ... }@inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          {
            environment.etc."nix/inputs/nixpkgs".source = nixpkgs.outPath;
            nix.nixPath = [ "nixpkgs=/etc/nix/inputs/nixpkgs" ];
            nix.registry.nixpkgs.flake = nixpkgs;
          }
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.domenic = import ./home;
          }
        ];
      };
    };
  };
}
