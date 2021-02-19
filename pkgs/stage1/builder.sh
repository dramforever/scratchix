export PATH="$bootstrapTools/bin"

if [ -z "$NIX_BUILD_CORES" ]; then
  NIX_BUILD_CORES="1"
elif [ "$NIX_BUILD_CORES" -le 0 ]; then
  NIX_BUILD_CORES=$(nproc 2>/dev/null || true)
  if expr >/dev/null 2>&1 "$NIX_BUILD_CORES" : "^[0-9][0-9]*$"; then
    :
  else
    NIX_BUILD_CORES="1"
  fi
fi
export NIX_BUILD_CORES

export CC="$bootstrapTools/bin/gcc -Wl,--dynamic-linker=$bootstrapTools/lib/ld-linux-x86-64.so.2 -Wl,--rpath=$bootstrapTools/lib -idirafter $bootstrapTools/include-glibc -idirafter $bootstrapTools/lib/gcc/x86_64-unknown-linux-gnu/8.3.0/include -idirafter $bootstrapTools/lib/gcc/x86_64-unknown-linux-gnu/8.3.0/include-fixed"
export CXX="$bootstrapTools/bin/g++ -Wl,--dynamic-linker=$bootstrapTools/lib/ld-linux-x86-64.so.2 -Wl,--rpath=$bootstrapTools/lib -idirafter $bootstrapTools/include/c++/8.3.0 -idirafter $bootstrapTools/include/c++/8.3.0/x86_64-unknown-linux-gnu -idirafter $bootstrapTools/include/c++/8.3.0/backward -idirafter $bootstrapTools/include-glibc -idirafter $bootstrapTools/lib/gcc/x86_64-unknown-linux-gnu/8.3.0/include -idirafter $bootstrapTools/lib/gcc/x86_64-unknown-linux-gnu/8.3.0/include-fixed"
export CPP="$bootstrapTools/bin/cpp -idirafter $bootstrapTools/include-glibc -idirafter $bootstrapTools/lib/gcc/x86_64-unknown-linux-gnu/8.3.0/include -idirafter $bootstrapTools/lib/gcc/x86_64-unknown-linux-gnu/8.3.0/include-fixed"

< $src xz -d | tar x -C .

sourceRoot="$(ls | head -1)"
echo sourceRoot is "$sourceRoot"

cd "$sourceRoot"
type -p cpp
./configure --prefix="$out" --host=x86_64-linux $configureFlags
make -j$NIX_BUILD_CORES -l$NIX_BUILD_CORES $makeFlags
make install $makeInstallFlags
