{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  osConfig,
  ...
}:
with lib; let
  device = osConfig.modules.device;
in {
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;
  home.packages = with pkgs;
    [
      firefox
      networkmanagerapplet
      git
      gh
      nitch
      inputs.agenix.packages.${pkgs.system}.default
    ]
    ++ optionals (builtins.elem device.type ["armlaptop"]) [
      # additional packages for arm laptop (x13s as of now) machines that use home-manager
    ];
}
