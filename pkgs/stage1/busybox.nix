{ mkDerivation
, fetchurl
, musl
, gcc
, linux-headers
}:

mkDerivation {
  name = "busybox-1.33.1";

  src = fetchurl {
    url = "https://busybox.net/downloads/busybox-1.33.1.tar.bz2";
    hash = "sha256-Es7GvSsW2KlEbdFhMPK5KYLxgZ9uHF9Yh7bbA/VmDSg=";
  };

  CC = "${gcc}/bin/gcc";
  NIX_BUILD_CORES=1;

  makeFlags = [
    "-isystem ${musl}/include -B${musl}/lib -L${musl}/lib"
  ];

  configurePhase = ''
    bash ${./busybox-config.sh}
  '';

  buildPhase = ''
    make  ${musl}/include -B ${musl}/lib -L ${musl}/lib busybox;
  '';

  installPhase = ''
    mkdir -p $out/bin;
    cp busybox $out/bin/;
    $out/bin/busybox --install -s $out/bin;
  '';


  buildInputs = [ linux-headers ];
}
