{ sources ? import ./nix/sources.nix }: let
  pkgs = import sources.nixpkgs {};
  gitignoreSource = (import sources."gitignore.nix" {}).gitignoreSource;
  in pkgs.stdenv.mkDerivation {
    name = "weirdgitignore";
    src = gitignoreSource ./.;
    buildPhase = ''
      mkdir -p $out
      cp * %out/
    '';
  }
