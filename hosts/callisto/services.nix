{ inputs
, outputs
, lib
, config
, pkgs
, ...
}:
#Services for x13s battery-sound etc. functionality, relies on firmware
{
  systemd.services = {
    pd-mapper = {
      unitConfig = {
        Requires = "qrtr-ns.service";
        After = "qrtr-ns.service";
      };
      serviceConfig = {
        Restart = "always";
        ExecStart = "${pkgs.pd-mapper}/bin/pd-mapper";
      };
      wantedBy = [
        "multi-user.target"
      ];
    };
    qrtr-ns = {
      serviceConfig = {
        ExecStart = "${pkgs.qrtr}/bin/qrtr-ns -f 1";
        Restart = "always";
      };
      wantedBy = [ "multi-user.target" ];
    };
    bt-address = {
      serviceConfig = {
        ExecStart = "${pkgs.bluez5-experimental}/bin/btmgmt public-addr F4:A8:0D:30:A3:47";
        Type = "oneshot";
      };
      wantedBy = [ "multi-user.target" ];
    };
  };
}
