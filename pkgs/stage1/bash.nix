{ mkDerivation, fetchurl, bison }:

mkDerivation {
  name = "bash-5.1";

  src = fetchurl {
    url = "https://ftp.gnu.org/gnu/bash/bash-5.1.tar.gz";
    hash = "sha256-zAEryGBAbc9C9kQxvNPS+nVgwCkVpgGrqc1Zejkym6o=";
  };

  NIX_BUILD_CORES = 1;

  buildInputs = [ bison ];

}

