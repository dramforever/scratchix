{ mkDerivation, fetchurl }:

mkDerivation {
  name = "binutils-2.36.1";

  src = fetchurl {
    url = "http://ftp.gnu.org/gnu/binutils/binutils-2.36.1.tar.xz";
    hash = "sha256-6B2e3zc/GTr0KKDyVmdK6mKp103+k/ZRktTq4DCw87A=";
  };

  configureFlags = [ "--disable-nls" "--disable-werror" ];
}
