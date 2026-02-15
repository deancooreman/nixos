{ config, lib, pkgs, ... }:

{
  boot.extraModulePackages = [ config.boot.kernelPackages.lenovo-legion-module ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = lib.mkDefault true;
    open = false;  # <--- ADD THIS LINE TO FIX THE ERROR
    prime = {
      intelBusId = "PCI:00:02:0";
      nvidiaBusId = "PCI:01:00:0";
    };
  };

  services.thermald.enable = lib.mkDefault true;
  services.xserver.dpi = 189;
}
