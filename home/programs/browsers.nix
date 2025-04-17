{
  isLinuxDesktop,
  username,
  ...
}:
{
  programs = {
    firefox = {
      enable = if isLinuxDesktop then true else false;
      profiles.${username} = {
        isDefault = true;
      };
    };
  };
}
