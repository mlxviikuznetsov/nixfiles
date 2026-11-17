{ ... }:

{
  programs.nnn.enable = true;

  programs.zsh.initContent = ''
    export NNN_COLORS="#04050603;4231"
    export NNN_FCOLORS="030304020706060101050508"
  '';
}
