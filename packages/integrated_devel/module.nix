{ lib, pkgs, config }:
{
  imports = [
    "${lib.expidus.channels.nixpkgs}/nixos/modules/installer/sd-card/sd-image-raspberrypi.nix"
  ];

  config = {
    networking.hostName = "archimedes-amx-devkit";

    environment.systemPackages = with pkgs; [ zig ];

    users.users.devel = {
      createHome = true;
      home = "/home/devel";
      description = "AMx Developer";
      initialPassword = "developer";
      group = "wheel";
      extraGroups = [ "dialout" ];
    };
  };
}
