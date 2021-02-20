{ mkDerivation, fetchurl
, gmp, mpfr, mpc
}:

mkDerivation {
  name = "gcc-10.2.0";

  src = fetchurl {
    url = "http://ftp.gnu.org/gnu/gcc/gcc-10.2.0/gcc-10.2.0.tar.xz";
    hash = "sha256-uN1DaLucfwuYGIMX7gJU3YzJnR46GND/FGyFX+FsHYw=";
  };

  buildInputs = [ gmp mpfr mpc ];

  configureFlags = [
    "--with-newlib"
    "--without-headers"
    "--enable-initfini-array"
    "--disable-nls"
    "--disable-shared"
    "--disable-multilib"
    "--disable-decimal-float"
    "--disable-threads"
    "--disable-libatomic"
    "--disable-libgomp"
    "--disable-libquadmath"
    "--disable-libssp"
    "--disable-libvtv"
    "--disable-libstdcxx"
    "--enable-languages=c,c++"
  ];
}
