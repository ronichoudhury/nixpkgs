{ stdenv, nodePackages, git, nodejs }:

stdenv.mkDerivation {
    name = "tangelo-git";
    src = /home/roni/work/tangelo;
    builder = ./builder.sh;
    grunt = nodePackages.grunt-cli;
    npm = nodePackages.npm;
    inherit nodejs;
    inherit git;
}
