{
  outputs = { self }: {
    legacyPackages.x86_64-linux = import ./pkgs/stage1;
  };
}
