{ config, pkgs, ... }:

let myFileSystems = import /etc/nixos/filesystems.nix;
in
{
  imports =
    [ 
    /etc/nixos/hardware-configuration.nix
    ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    supportedFilesystems = [ "ntfs" ];
  };

  fileSystems = myFileSystems.fileSystems;

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    extraHosts = ''
      127.0.0.1 pim.klas.se
    '';
  };

  time.timeZone = "Asia/Ho_Chi_Minh";
  virtualisation = {
    docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
        package = pkgs.docker_26;
      };
      package = pkgs.docker_26;
    };
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "vi_VN";
      LC_IDENTIFICATION = "vi_VN";
      LC_MEASUREMENT = "vi_VN";
      LC_MONETARY = "vi_VN";
      LC_NAME = "vi_VN";
      LC_NUMERIC = "vi_VN";
      LC_PAPER = "vi_VN";
      LC_TELEPHONE = "vi_VN";
      LC_TIME = "vi_VN";
    };
    inputMethod = {
      enabled = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;
        addons = with pkgs; [
          fcitx5-unikey
          fcitx5-gtk
          fcitx5-configtool
        ];
      };
    };
  };

  services = {
    xserver = {
      enable = true;
      displayManager = {
        gdm = {
          enable = true;
          wayland = true;
        };
      };
      desktopManager = {
        gnome.enable = true;
        runXdgAutostartIfNone = true;
      };
      xkb = {
        layout = "us";
        variant = "dvorak";
      };
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.extraConfig = {
        "monitor.bluez.properties" = {
          "bluez5.enable-sbc-xq" = true;
          "bluez5.enable-msbc" = true;
          "bluez5.enable-hw-volume" = true;
          "bluez5.roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];
        };
      };
    };
    printing.enable = true;
  };

  console.keyMap = "dvorak";

  hardware = {
    pulseaudio.enable = false;
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };
  sound.enable = true;
  security.rtkit.enable = true;
  users = {
    users.giang = {
      isNormalUser = true;
      description = "giang";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
        thunderbird
      ];
      # shell = pkgs.nushell;
    };
  };

  programs = {
    firefox.enable = true;
    xfconf.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
          thunar-volman
      ];
    };
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;   
    };
    bash = {
      shellAliases = {
        ls = "ls --color=auto";
        z = "zellij";
        v = "nvim";
        sv = "sudo nvim";
        update = "sudo nixos-rebuild switch";
        gs = "git status";
        gp = "git pull --rebase";
        gP = "git push";
        gf = "git fetch";
        ga = "git add .";
        gm = "git commit -m";
        gam = "git commit --amend -m";
        clean = "sudo nix-collect-garbage -d && sudo nix-collect-garbage && sudo nix-store --optimise && sudo nix-env --delete-generations old";
        config = "sudo nvim /etc/nixos/configuration.nix";
      };
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    # nushell = {
    #   enable = true;
    #   shellAliases = {
    #     ls = "ls --color=auto";
    #     z = "zellij";
    #     v = "nvim";
    #     sv = "sudo nvim";
    #     update = "sudo nixos-rebuild switch";
    #     gs = "git status";
    #     gp = "git pull --rebase";
    #     gP = "git push";
    #     gf = "git fetch";
    #     ga = "git add .";
    #     gm = "git commit -m";
    #     gam = "git commit --amend -m";
    #     clean = "sudo nix-collect-garbage -d && sudo nix-collect-garbage && sudo nix-store --optimise && sudo nix-env --delete-generations old";
    #     config = "sudo nvim /etc/nixos/configuration.nix";
    #   };
    # };
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
      "steam" "steam-original" "steam-run"
    ];
  };
  environment = {
    systemPackages = with pkgs; [
      wget neovim git curl gcc neofetch neovide xclip zellij cmatrix docker_26 warp-terminal
      microsoft-edge vivaldi brave
      wayland wayland-protocols wayland-utils
      kitty waybar dunst libnotify swww rofi-wayland wofi networkmanagerapplet hyprshot
      ffmpeg ffmpegthumbnailer viewnior pavucontrol starship wl-clipboard wf-recorder
      playerctl wlogout swaylock-effects papirus-icon-theme
      jdk17 jdk21 kotlin scala_3 go rustc cargo nodejs bun python3
      jetbrains-toolbox teams-for-linux skypeforlinux whatsapp-for-linux slack discord signal-desktop
    ]; 
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
      DEFAULT_BROWSER = "${pkgs.vivaldi}/bin/vivaldi";
      BROWSER = "${pkgs.vivaldi}/bin/vivaldi";
      XDG_DEFAULT_BROWSER = "${pkgs.vivaldi}/bin/vivaldi";
    };
    variables = {
      GTK_IM_MODULE="fcitx";
      QT_IM_MODULE="fcitx";
      XMODIFIERS="@im=fcitx";
      PATH = [
        "$HOME/bin"
      ];
    };
  };

  fonts.packages = [
    (pkgs.stdenv.mkDerivation {
      name = "custom-fonts";
      src = /home/giang/Downloads/custom-fonts/custom;
      installPhase = ''
        mkdir -p $out/share/fonts
        cp -r $src/* $out/share/fonts/
      '';
    })
  ];
  xdg = {
    portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
    };
  };

  system.stateVersion = "24.05"; 
}
