{ mkDerivation
, fetchurl
, gcc
, binutils
}:

mkDerivation {
  name = "musl-1.2.2";

  CC = "${gcc}/bin/gcc";
  AR = "${binutils}/bin/ar";
  RANLIB = "${binutils}/bin/ranlib";

  src = fetchurl {
    url = "https://musl.libc.org/releases/musl-1.2.2.tar.gz";
    hash = "sha256-m5aTIgEteW3CPdono1hmA0+mfY+2fg4sRckTw9QyGd0=";
  };

  configureFlags = [
    "--enable-shared"
    "--enable-static"
    "--enable-debug"
    "--enable-wrapper=all"
    "--syslibdir=${placeholder "out"}/lib"
  ];
}
