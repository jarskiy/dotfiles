{
  description = "Home Manager configuration using Flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";  # Replace with your system architecture (e.g., x86_64-linux)
    in
    {
      # Home Manager configuration for a specific user
      homeConfigurations.jarskiy = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;  # Enable unfree packages, if necessary
        };

        # home.nix configuration file
        modules = [
          ./home.nix  # This imports the home.nix file
        ];
      };
    };
}
 
