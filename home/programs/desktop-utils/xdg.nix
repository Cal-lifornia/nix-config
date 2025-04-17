{ config, pkgs, ... }:
let
  browser = [ "firefox.desktop" ];
  fileManager = [ "nemo.desktop" ];
  # XDG MIME types
  associations = {
    "application/x-extension-htm" = browser;
    "application/x-extension-html" = browser;
    "application/x-extension-shtml" = browser;
    "application/x-extension-xht" = browser;
    "application/x-extension-xhtml" = browser;
    "application/xhtml+xml" = browser;
    "text/html" = browser;
    "x-scheme-handler/about" = browser;
    "x-scheme-handler/chrome" = [ "chromium-browser.desktop" ];
    "x-scheme-handler/ftp" = browser;
    "x-scheme-handler/http" = browser;
    "x-scheme-handler/https" = browser;
    "x-scheme-handler/unknown" = browser;
    "inode/directory" = fileManager;
    "application/x-gnome-saved-search" = fileManager;
    "audio/*" = [ "mpv.desktop" ];
    "video/*" = [ "mpv.desktop" ];
    "application/json" = browser;
    "application/pdf" = [ "org.pwmt.zathura.desktop.desktop" ];
    "x-scheme-handler/discord" = [ "discordcanary.desktop" ];
    "x-scheme-handler/spotify" = [ "spotify.desktop" ];
    "x-scheme-handler/tg" = [ "telegramdesktop.desktop" ];
    "image/aces" = [ "imv.desktop" ];
    "image/apng" = [ "imv.desktop" ];
    "image/avci" = [ "imv.desktop" ];
    "image/avcs" = [ "imv.desktop" ];
    "image/avif" = [ "imv.desktop" ];
    "image/bmp" = [ "imv.desktop" ];
    "image/cgm" = [ "imv.desktop" ];
    "image/dicom-rle" = [ "imv.desktop" ];
    "image/dpx" = [ "imv.desktop" ];
    "image/emf" = [ "imv.desktop" ];
    "image/example" = [ "imv.desktop" ];
    "image/fits" = [ "imv.desktop" ];
    "image/g3fax" = [ "imv.desktop" ];
    "image/gif" = [ "imv.desktop" ];
    "image/heic" = [ "imv.desktop" ];
    "image/heic-sequence" = [ "imv.desktop" ];
    "image/heif" = [ "imv.desktop" ];
    "image/heif-sequence" = [ "imv.desktop" ];
    "image/hej2k" = [ "imv.desktop" ];
    "image/hsj2" = [ "imv.desktop" ];
    "image/ief" = [ "imv.desktop" ];
    "image/j2c" = [ "imv.desktop" ];
    "image/jaii" = [ "imv.desktop" ];
    "image/jais" = [ "imv.desktop" ];
    "image/jls" = [ "imv.desktop" ];
    "image/jp2" = [ "imv.desktop" ];
    "image/jpeg" = [ "imv.desktop" ];
    "image/jph" = [ "imv.desktop" ];
    "image/jphc" = [ "imv.desktop" ];
    "image/jpm" = [ "imv.desktop" ];
    "image/jpx" = [ "imv.desktop" ];
    "image/jxl" = [ "imv.desktop" ];
    "image/jxr" = [ "imv.desktop" ];
    "image/jxrA" = [ "imv.desktop" ];
    "image/jxrS" = [ "imv.desktop" ];
    "image/jxs" = [ "imv.desktop" ];
    "image/jxsc" = [ "imv.desktop" ];
    "image/jxsi" = [ "imv.desktop" ];
    "image/jxss" = [ "imv.desktop" ];
    "image/ktx" = [ "imv.desktop" ];
    "image/ktx2" = [ "imv.desktop" ];
    "image/naplps" = [ "imv.desktop" ];
    "image/png" = [ "imv.desktop" ];
    "image/prs.btif" = [ "imv.desktop" ];
    "image/prs.pti" = [ "imv.desktop" ];
    "image/pwg-raster" = [ "imv.desktop" ];
    "image/svg+xml" = [ "imv.desktop" ];
    "image/t38" = [ "imv.desktop" ];
    "image/tiff" = [ "imv.desktop" ];
    "image/tiff-fx" = [ "imv.desktop" ];
    "image/vnd.adobe.photoshop" = [ "imv.desktop" ];
    "image/vnd.airzip.accelerator.azv" = [ "imv.desktop" ];
    "image/vnd.cns.inf2" = [ "imv.desktop" ];
    "image/vnd.dece.graphic" = [ "imv.desktop" ];
    "image/vnd.djvu" = [ "imv.desktop" ];
    "image/vnd.dwg" = [ "imv.desktop" ];
    "image/vnd.dxf" = [ "imv.desktop" ];
    "image/vnd.dvb.subtitle" = [ "imv.desktop" ];
    "image/vnd.fastbidsheet" = [ "imv.desktop" ];
    "image/vnd.fpx" = [ "imv.desktop" ];
    "image/vnd.fst" = [ "imv.desktop" ];
    "image/vnd.fujixerox.edmics-mmr" = [ "imv.desktop" ];
    "image/vnd.fujixerox.edmics-rlc" = [ "imv.desktop" ];
    "image/vnd.globalgraphics.pgb" = [ "imv.desktop" ];
    "image/vnd.microsoft.icon" = [ "imv.desktop" ];
    "image/vnd.mix" = [ "imv.desktop" ];
    "image/vnd.ms-modi" = [ "imv.desktop" ];
    "image/vnd.mozilla.apng" = [ "imv.desktop" ];
    "image/vnd.net-fpx" = [ "imv.desktop" ];
    "image/vnd.pco.b16" = [ "imv.desktop" ];
    "image/vnd.radiance" = [ "imv.desktop" ];
    "image/vnd.sealed.png" = [ "imv.desktop" ];
    "image/vnd.sealedmedia.softseal.gif" = [ "imv.desktop" ];
    "image/vnd.sealedmedia.softseal.jpg" = [ "imv.desktop" ];
    "image/vnd.svf" = [ "imv.desktop" ];
    "image/vnd.tencent.tap" = [ "imv.desktop" ];
    "image/vnd.valve.source.texture" = [ "imv.desktop" ];
    "image/vnd.wap.wbmp" = [ "imv.desktop" ];
    "image/vnd.xiff" = [ "imv.desktop" ];
    "image/vnd.zbrush.pcx" = [ "imv.desktop" ];
    "image/webp" = [ "imv.desktop" ];
    "image/wmf" = [ "imv.desktop" ];
    "image/x-emf" = [ "imv.desktop" ];
    "image/x-wmf" = [ "imv.desktop" ];
  };
in
{
  home.packages = with pkgs; [
    nautilus
    gvfs
    nemo-with-extensions
  ];
  xdg = {
    enable = true;

    mimeApps = {
      enable = true;
      defaultApplications = associations;
    };

    cacheHome = config.home.homeDirectory + "/.cache";
    configHome = config.home.homeDirectory + "/.config";
    dataHome = config.home.homeDirectory + "/.local/share";
    userDirs = {
      enable = true;
      createDirectories = true;
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
      };
    };
    # configFile = {
    #   "gtk-4.0/assets".source =
    #     "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    #   "gtk-4.0/gtk.css".source =
    #     "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    #   "gtk-4.0/gtk-dark.css".source =
    #     "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
    # };
  };
  # programs.zsh.initExtra = "export XDG_DATA_DIRS=$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share";
}
