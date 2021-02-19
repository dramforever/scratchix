{}:

import <nix/fetchurl.nix> {
  name = "busybox";
  url = "http://tarballs.nixos.org/stdenv-linux/i686/4907fc9e8d0d82b28b3c56e3a478a2882f1d700f/busybox";
  hash = "sha256-70wb5seuV+T2VO/ZCuLS4gTWdpNkxGRp+p/zdhGVy6E=";
  executable = true;
}
