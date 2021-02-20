{ stage0, wrappers }:

{ name
, src
, configureFlags ? []
, makeFlags ? []
, makeInstallFlags ? []
, buildInputs ? []
}:

derivation {
  inherit name src;
  inherit wrappers;
  inherit configureFlags makeFlags makeInstallFlags;
  inherit buildInputs;

  system = "x86_64-linux"; # FIXME

  builder = "${stage0.bootstrap-tools}/bin/bash";
  args = [ "-e" ./builder.sh ];

  bootstrapTools = stage0.bootstrap-tools;
}
