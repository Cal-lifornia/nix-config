let
  configDir = ../configs;
in
{
  imports = [
    ./hypr
    ./media
    ./rofi
    ./utils
  ];

  home.file = {
    ".config/hypr".source = "${configDir}/hyprland";
    ".config/wlogout".source = "${configDir}/wlogout";
    ".config/wofi".source = "${configDir}/wofi";
    ".config/waybar".source = "${configDir}/waybar";
  };
}
