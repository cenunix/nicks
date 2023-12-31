_: {
  # mildly improves performance for the disk encryption
  # boot.initrd.availableKernelModules = [
  #   "aesni_intel"
  #   "cryptd"
  #   "usb_storage"
  # ];

  boot.initrd.luks.devices."enc" = {
    # improve performance on ssds
    # bypassWorkqueues = true;
    keyFileSize = 4096;
    # the device with the maching id will be searched for the key file
    keyFile = "/dev/disk/by-id/usb-Lexar_JD_FireFly_AA04012700009340-0:0";
    # preLVM = true;
    # if keyfile is not there, fall back to cryptsetup password
    fallbackToPassword = true;
  };
}

