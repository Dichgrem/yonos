{ lib, pkgs, username, ... }:
let
  inherit (import ./env.nix)
  Bluetooth GPU-AMD GPU-Intel GPU-Nvidia;
in
{
  imports = [
    ./hardware.nix
    ]
      ++ lib.filesystem.listFilesRecursive ../../modules;

  # Driver module options
  drivers = {
    amdgpu.enable = GPU-AMD;
    bluetooth.enable = Bluetooth;
    intel.enable = GPU-Intel;
    nvidia.enable = GPU-Nvidia;
  };

  # Define users
  users = {
#    users.root = {
#      hashedPassword = "xxxxxx"; could be generated by mkpasswd
#    };
    users."${username}" = {
      extraGroups = [
        "libvirtd"
        "networkmanager"
        "wheel"
      ];
      homeMode = "755";
      ignoreShellProgramCheck = true;
      isNormalUser = true;
      shell = pkgs.nushell;
    };
  };
}
