{ mkDerivation
, fetchurl
, m4
}:

mkDerivation {
  name = "bison-3.7.6";

  src = fetchurl {
    url = "https://ftp.gnu.org/gnu/bison/bison-3.7.6.tar.xz";
    hash = "sha256-Z9aM4eIhkgUFJWQ/wKeiIpdXZoK+9qXFFEaQP1ru888=";
  };

  buildInputs = [ m4 ];

}
