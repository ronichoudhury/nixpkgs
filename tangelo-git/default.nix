{ stdenv, nodePackages }:

stdenv.mkDerivation {
    name = "tangelo-git";
    src = /home/roni/work/tangelo;
    builder = ./builder.sh;
    grunt = nodePackages.grunt-cli;
    npm = nodePackages.npm;
}
