{ ... }:
{
  programs.noctalia = {
    enable = true;
    systemd.enable = true;
    settings = {
      shell = {
        polkit_agent = true;
      };
    };
  };
}
