{ stage0 }:

{ name
, src
, configureFlags ? []
, makeFlags ? []
, makeInstallFlags ? []
}:

derivation {
  inherit name src;
  inherit configureFlags makeFlags makeInstallFlags;

  system = "x86_64-linux"; # FIXME

  builder = stage0.busybox;
  args = [ "ash" "-e" ./builder.sh ];

  bootstrapTools = stage0.bootstrap-tools;
}
