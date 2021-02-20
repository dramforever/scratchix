{ mkDerivation, fetchurl
, gmp
}:

mkDerivation {
  name = "mpfr-4.1.0";

  src = fetchurl {
    url = "http://www.mpfr.org/mpfr-4.1.0/mpfr-4.1.0.tar.xz";
    hash = "sha256-DJij8XMv9spOppBVIHnanFl4ctMOluwoQU7iPJVVin8=";
  };

  buildInputs = [ gmp ];
}
