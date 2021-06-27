{ mkDerivation , fetchurl }:

mkDerivation {
  name = "linux-headers.2.1";

  src = fetchurl {
    url = "mirror://kernel/linux/kernel/v5.x/linux-5.12.tar.xz";
    sha256 = "sha256-fQ328r8jhNaNC9jh/j4HHWQ2Tc3GAC57XIfJLUj6w2Y=";
  };

  buildPhase = ''
    make headers
  '';

  installPhase = ''
    mkdir -p $out;
    cp -r usr/include $out;
    find $out -type f ! -name '*.h' -delete;
  '';
  configurePhase = "";


#  buildInputs = [ m4 ];
}
