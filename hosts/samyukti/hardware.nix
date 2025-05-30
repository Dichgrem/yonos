{
  config,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usbhid" "uas" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-intel"];
  boot.extraModulePackages = [];

  boot.zfs.extraPools = ["backup"];

  fileSystems."/run/media/admin/backup" = {
    device = "backup";
    fsType = "zfs";
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/8713458b-45c1-430c-b545-585fb7296001";
    fsType = "xfs";
  };

  boot.initrd.luks.devices."luks-50c130bb-d2fd-4719-8b27-252e0e586edb".device = "/dev/disk/by-uuid/50c130bb-d2fd-4719-8b27-252e0e586edb";

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/9965-0792";
    fsType = "vfat";
    options = ["fmask=0077" "dmask=0077"];
  };

  swapDevices = [];

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
