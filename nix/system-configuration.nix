{ config, pkgs, ... }:

{
  # Enable hardware module
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  # DM, DE, XDG
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  programs.hyprland.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-kde
    ];
  };

  # Services
  services.envfs.enable = true;
  security.polkit.enable = true;
  security.rtkit.enable = true;
  services.blueman.enable = true;
  services.supergfxd.enable = true;
  services.power-profiles-daemon.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };
}
