{ genWrapper, stage0 }:

derivation {
  system = "x86_64-linux";
  name = "wrappers";

  builder = "${stage0.bootstrap-tools}/bin/bash";
  args = [ "-e" "-c" ". $commandPath" ];
  passAsFile = [ "command" ];

  gccWrapper = genWrapper {
    name = "gcc-wrapper";
    label = "gcc";
    wrapped = "${stage0.bootstrap-tools}/bin/gcc";
  };

  gxxWrapper = genWrapper {
    name = "g++-wrapper";
    label = "gxx";
    wrapped = "${stage0.bootstrap-tools}/bin/g++";
  };

  command = ''
    export PATH="${stage0.bootstrap-tools}/bin"
    mkdir -p $out/bin
    cp $gccWrapper $out/bin/gcc
    cp $gxxWrapper $out/bin/g++
  '';
}
