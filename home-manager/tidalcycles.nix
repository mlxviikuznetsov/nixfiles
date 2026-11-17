{ pkgs, inputs, ... }:

let
  tidalPkgs = inputs.tidalcycles.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  home.packages = [
    tidalPkgs.tidal
    tidalPkgs.superdirt-start
    tidalPkgs.superdirt-install
  ];

  programs.neovim.plugins = [ tidalPkgs.vim-tidal ];

  home.shellAliases.sd = "pw-jack superdirt-start";
}
