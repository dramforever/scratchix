{ stage0, wrappers }:

{ name
, src
, builder ? ./mkDerivation-builder.sh
, configureFlags ? [ ]
, makeFlags ? [ ]
, makeInstallFlags ? [ ]
, buildInputs ? [ ]
, configurePhase ? ''./configure --prefix="$out" --host=x86_64-linux $configureFlags''
, buildPhase ? ''make -j$NIX_BUILD_CORES -l$NIX_BUILD_CORES $makeFlags''
, installPhase ? ''make install $makeInstallFlags''
, ...
}@args:

derivation (args // {
  inherit name src;
  inherit wrappers;
  inherit configureFlags makeFlags makeInstallFlags;
  inherit buildInputs;
  inherit configurePhase buildPhase installPhase;

  system = "x86_64-linux"; # FIXME

  builder = "${stage0.bootstrap-tools}/bin/bash";
  args = [ "-e" builder ];

  bootstrapTools = stage0.bootstrap-tools;
})
