{ inputs
, outputs
, lib
, config
, pkgs
, ...
}:
with lib; let
  device = config.modules.device;
in
{
  config = {
    modules = {
      device = {
        type = "laptop";
        cpu = "intel";
        gpu = "intel";
        monitors = [
          "eDP-1,1920x1080@60,auto,1"
        ];
        hasBluetooth = true;
        hasSound = true;
      };
      system = {
        boot = {
          loader = "systemd-boot";
        };
        video.enable = true;
        sound.enable = true;
        bluetooth.enable = true;
        username = "cenunix";
      };
      programs = {
        cli.enable = true;
        gui.enable = true;

        gaming = {
          enable = true;
          steam.enable = false;
          chess.enable = true;
          minecraft.enable = true;
        };
        override = { };
      };
      usrEnv = {
        isWayland = true;
        desktop = "Hyprland";
        useHomeManager = true;
        autologin = true;
      };
    };
  };
}
