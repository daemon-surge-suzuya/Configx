{ pkgs, ... }:

{
  imports = [
    (pkgs.callPackage ./a.nix { })
    (pkgs.callPackage ./c.nix { })
    (pkgs.callPackage ./pack.nix { })
    (pkgs.callPackage ./finder.nix { })
    (pkgs.callPackage ./unpack.nix { })
    (pkgs.callPackage ./ch-mac.nix { })
  ];
}
