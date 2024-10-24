let configDir = ../configs;
in
{
  imports = [
    ./browsers
    ./hypr
    ./media
    ./rofi
    ./shells
    ./terminal
    ./utils
  ];

  home.file = {
      ".config/hypr".source = "${configDir}/hyprland";
      ".config/wlogout".source = "${configDir}/wlogout";
      ".config/wofi".source = "${configDir}/wofi";
      ".config/waybar".source = "${configDir}/waybar";
  };
}
