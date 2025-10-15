{ config, pkgs, ... }:

{
  home = {
    sessionVariables = {
      #GBM_BACKEND= "nvidia-drm";
      #__GLX_VENDOR_LIBRARY_NAME= "nvidia";
      #LIBVA_DRIVER_NAME= "nvidia"; # hardware acceleration
      #__GL_VRR_ALLOWED="1";
      # WLR_NO_HARDWARE_CURSORS = "1";
      # WLR_RENDERER_ALLOW_SOFTWARE = "1";
      # CLUTTER_BACKEND = "wayland";
      # WLR_RENDERER = "vulkan";
      # GTK_USE_PORTAL = "1";
      # XDG_CURRENT_DESKTOP = "Hyprland";
      # XDG_SESSION_DESKTOP = "Hyprland";
      # XDG_SESSION_TYPE = "wayland";
      # NIXOS_OZONE_WL = "1";
      # MOZ_ENABLE_WAYLAND = "1";
      # SDL_VIDEODRIVER = "wayland";
      # QT_QPA_PLATFORM = "wayland-egl";
      # QT_QPA_PLATFORM_THEME = "qt6ct";
      # QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      GRIMBLAST_EDITOR = "gimp";
    };
  };
}
