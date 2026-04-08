{
  pkgs,
  lib,
  config,
  isDesktop,
  isMac,
  isLinux,
  isLinuxDesktop,
  ...
}:
let
  configDir = ../configs;
in
{
  imports = [
    ./shells
    ./dev
    ./multiplexers
    ./gaming.nix
    ./yazi.nix
    ./git.nix
    ./media.nix
    ./virtualistion.nix
  ]
  ++ (lib.optionals isDesktop [
    ./terminals
  ])
  ++ (lib.optionals isLinuxDesktop [
    ./desktop-utils
  ])
  ++ (lib.optionals isMac [
    ./mac.nix
  ]);
  home.sessionVariables = {

  }
  // (
    if isLinuxDesktop then
      {
        BROWSER = "zen-browser";
        TERM = "kitty";
        # QT_QPA_PLATFORMTHEME = "qt5ct";
      }
    else
      { }
  );

  home.file = {
    ".config/themes".source = "${configDir}/themes";
    ".config/nvim".source = "${configDir}/nvim";
    ".config/zellij".source = "${configDir}/zellij";
    ".config/eza/theme.yml".source = "${configDir}/eza/theme.yml";
  }
  // (
    if isLinuxDesktop then
      {
        ".config/alacritty".source = "${configDir}/alacritty";
      }
    else
      { }
  );
  home.packages =
    with pkgs;
    [
      vhs
      glow
      unzip
      curl
      btop
      jq
      lazygit
      tldr
      sd
      sshfs
    ]
    ++ (lib.optionals isDesktop [
      obsidian
      gifski
    ])
    ++ (lib.optionals isLinux [
      gnumake
      nano
      wget
      sysz
      tailscale
      dua
    ])
    ++ (lib.optionals isLinuxDesktop [

      #User Apps
      # vesktop
      lollypop
      # lutris
      openrgb
      # nwg-look
      (config.lib.nixGL.wrap zoom-us)
      (config.lib.nixGL.wrap read-edid)

      #misc
      nano
      nitch
      # grim
      # slurp
      pamixer
      mpc
      tty-clock
      gearlever
      gtk3
      (config.lib.nixGL.wrap blender)
      (config.lib.nixGL.wrap kdePackages.ark)
      (config.lib.nixGL.wrap harmonoid)
      unityhub

      zenity
      eog

      # Touchpad Gestures
      # fusuma
    ]);
  programs.keychain = {
    enable = if isLinux then true else false;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    keys = [
      "~/.ssh/github-key"
    ];
  };

  # catppuccin = {
  #   enable = true;
  #   flavor = "mocha";
  # };
  # services = {
  #   gpg-agent = {
  #     enable = true;
  #     enableZshIntegration = true;
  #     enableSshSupport = true;
  #     enableNushellIntegration = true;
  #   };
  # };
}
