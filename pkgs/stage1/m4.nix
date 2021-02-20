{ mkDerivation, fetchurl }:

mkDerivation {
  name = "m4-1.4.18";

  src = fetchurl {
    url = "http://ftp.gnu.org/gnu/m4/m4-1.4.18.tar.xz";
    hash = "sha256-8sHobKCkBP8oFjG9yDd2OJknRLF1r7gG4lhxokqTTgc=";
  };
}
