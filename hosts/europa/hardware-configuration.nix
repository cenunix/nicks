# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-amd"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/a73ae838-0424-4d2f-9aed-ecbc8260e2fd";
    fsType = "ext4";
  };

  boot.initrd.luks.devices."luks-b9954fe3-f509-4eaf-8594-0090a2d5c56c".device = "/dev/disk/by-uuid/b9954fe3-f509-4eaf-8594-0090a2d5c56c";
  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-34400745-6670-4ef8-b5cd-6f3028679645".device = "/dev/disk/by-uuid/34400745-6670-4ef8-b5cd-6f3028679645";
  boot.initrd.luks.devices."luks-34400745-6670-4ef8-b5cd-6f3028679645".keyFile = "/crypto_keyfile.bin";
  boot.binfmt.emulatedSystems = ["aarch64-linux"];

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/D5CE-0673";
    fsType = "vfat";
  };

  swapDevices = [{device = "/dev/disk/by-uuid/5b50c72f-63bb-4a54-9349-78b9bda16434";}];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.networkmanager.insertNameservers = [
  #   "172.17.0.1"
  # ];
  # networking.interfaces.enp10s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp8s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}