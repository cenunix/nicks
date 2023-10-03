{ inputs
, outputs
, lib
, config
, pkgs
, ...
}: {
  networking = {
    # dns
    networkmanager = {
      enable = true;
    };

    firewall = {
      enable = true;
      # if your minecraft server is not worky
      # this is probably why
      allowedTCPPorts = [ 443 80 22 7000 8080 8096 8097 8112 8920 5452 5432 5433 5454 32400 9117 ];
      allowedUDPPorts = [ 443 80 44857 8080 ];
      allowPing = false;
      logReversePathDrops = true;
    };
  };
  # slows down boot time
  systemd.services.NetworkManager-wait-online.enable = false;
  programs.ssh.startAgent = true;

  services.openssh = {
    enable = true;
    startWhenNeeded = false;
    settings = {
      PermitRootLogin = lib.mkForce "yes";
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = lib.mkDefault false;
      UseDns = false;
      X11Forwarding = false;
    };

    # the ssh port(s) should be automatically passed to the firewall's allowedTCPports
    openFirewall = true;
    ports = [ 2317 ];

    hostKeys = [
      {
        bits = 4096;
        path = "/etc/ssh/ssh_host_rsa_key";
        type = "rsa";
      }
      {
        bits = 4096;
        path = "/etc/ssh/ssh_host_ed25519_key";
        type = "ed25519";
      }
    ];
  };
}
