{ mkDerivation
, fetchurl
, m4
}:

mkDerivation {
  name = "gmp-6.2.1";

  src = fetchurl {
    url = "http://ftp.gnu.org/gnu/gmp/gmp-6.2.1.tar.xz";
    hash = "sha256-/UgpkSzd0S+EGBw0Ucx1K+IkZD6H+sSXtp7d2txJtPI=";
  };

  buildInputs = [ m4 ];
}
