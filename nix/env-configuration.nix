{ config, pkgs, ... }:

{
  users.defaultUserShell = pkgs.zsh;

  programs.thunar.enable = true;
  programs.zsh.enable = true;
  programs.rog-control-center.enable = true;
  programs.steam.enable = true;

  home-manager.users.tctinh = {
    /* The home.stateVersion option does not have a default and must be set */
    home.stateVersion = "24.05";
    /* Here goes the rest of your home-manager config, e.g. home.packages = [ pkgs.foo ]; */
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        ll = "ls -l";
        update = "sudo nixos-rebuild switch";
      };
      history.size = 10000;
      history.path = "$HOME/.zsh/history";

      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "robbyrussell";
      };
    };
  };

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
      fcitx5-unikey
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    killall
    wget
    bash
    git
    kitty
    waybar
    vim
    brave
    zsh
    rofi-wayland
    kanshi
    vscode-fhs
    htop
    powertop
    pywal
    swww
    swaynotificationcenter
    swaylock
    swappy
    wlogout
    glib
    libsForQt5.qtstyleplugin-kvantum
    brightnessctl
    pulseaudioFull
    libnotify
    lm_sensors
    hyprland-autoname-workspaces
    home-manager
    pavucontrol
    easyeffects
    pamixer
    remmina
    openfortivpn
    skypeforlinux
    caprine-bin
    cider
    jq
    slurp
    grim
    cliphist
    playerctl
    mpv
    ytfzf
    ueberzugpp
    curl
    wl-clipboard
    neofetch
  ];

  fonts.packages = with pkgs; [
    nerdfonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
  ];
}
