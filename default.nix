let
  pkgs = import <nixpkgs> {};
in
{ stdenv ? pkgs.stdenv }:
  
stdenv.mkDerivation {
  name = "cv";
  src = ./.;
  buildInputs = with pkgs; [ texLiveFull ];
  installPhase = "mkdir $out; cp *.pdf $out";
  fixupPhase = "true";
}
