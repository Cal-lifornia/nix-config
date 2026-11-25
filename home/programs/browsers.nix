{
  isLinuxDesktop,
  username,
  ...
}:
{
  programs = {
    firefox = {
      enable = isLinuxDesktop;
      profiles.${username} = {
        isDefault = true;
      };
    };
  };
}
