{ ... }:
{
  programs = {
    yazi = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
      shellWrapperName = "y";
    };
  };
  # catppuccin = {
  #   yazi = {
  #     enable = true;
  #     flavor = "macchiato";
  #   };
  # };
}
