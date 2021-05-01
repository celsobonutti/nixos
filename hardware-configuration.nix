# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];
  
  hardware = {
    opengl.driSupport32Bit = true;
    opengl.enable = true;
    opengl.extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
    opengl.setLdLibraryPath = true;
  };

  environment.systemPackages = with pkgs; [
    vulkan-tools
    vulkan-loader
    vulkan-validation-layers
  ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/b5dadef1-a21c-420c-989e-960dd628d686";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/592E-1226";
      fsType = "vfat";
    };

  fileSystems."/coisas" =
    { device = "/dev/sdb2";
      fsType = "ntfs";
    };

  fileSystems."/joguinhos" =
    { device = "/dev/sdc1";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/d462e645-ef3e-4ee8-a94c-905df6c00ae8"; }
    ];

  services.xserver.dpi = 96;

  # high-resolution display
  # hardware.video.hidpi.enable = true;
}
