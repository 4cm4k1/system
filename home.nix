{ config, pkgs, ... }:

{
  imports = [
    # https://github.com/kclejeune/system/blob/master/home.nix
    # ./modules/core.nix
    # ./modules/dotfiles
  ];
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "4cm4k1";
  home.homeDirectory = "/Users/4cm4k1";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";
}
