{ stage0 }:

{ name, contents, executable ? false }:

derivation {
  system = "x86_64-linux";

  inherit name contents executable;

  builder = "${stage0.bootstrap-tools}/bin/bash";
  args = [ "-e" "-c" ". $commandPath" ];
  passAsFile = [ "contents" "command" ];

  command = ''
    ${stage0.bootstrap-tools}/bin/cp $contentsPath $out
    [ $executable -eq 1 ] && ${stage0.bootstrap-tools}/bin/chmod +x $out
  '';
}
