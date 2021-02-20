{ writeFile, stage0 }:

{ name, label, wrapped }:

writeFile {
  inherit name;
  executable = true;

  contents = ''
    #!${stage0.bootstrap-tools}/bin/bash
    exec ${wrapped} $NIX_WRAPPER_${label}_ARGS "$@"
  '';
}
