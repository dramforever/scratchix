{ mkDerivation, fetchurl
, gmp, mpfr
}:

mkDerivation {
  name = "mpc-1.2.1";

  src = fetchurl {
    url = "https://ftp.gnu.org/gnu/mpc/mpc-1.2.1.tar.gz";
    hash = "sha256-F1A9LDld/PEGtiLcFCaDwRmUMdCVNnxqrLpu7DA0BFk=";
  };

  buildInputs = [ gmp mpfr ];
}
