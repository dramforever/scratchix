{ stage0, wrappers }:

{ name
, src
, builder ? ./mkDerivation-builder.sh
, configureFlags ? [ ]
, makeFlags ? [ ]
, makeInstallFlags ? [ ]
, buildInputs ? [ ]
, ...
}@args:

derivation ( args // {
  inherit name src;
  inherit wrappers;
  inherit configureFlags makeFlags makeInstallFlags;
  inherit buildInputs;

  system = "x86_64-linux"; # FIXME

  builder = "${stage0.bootstrap-tools}/bin/bash";
  args = [ "-e" builder ];

  bootstrapTools = stage0.bootstrap-tools;
})
