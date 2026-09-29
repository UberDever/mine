# vetochka's workspace

The directory [vetochka](https://github.com/UberDever/vetochka) is built in, with
[muh-build](https://github.com/UberDever/muh-build): vetochka, muh-build and the libraries
vetochka uses, side by side. This repo holds the vendored libraries; vetochka and muh-build are
repos of their own, placed next to them.

## Set up

```sh
git clone git@github.com:UberDever/vetochka-repo.git && cd vetochka-repo
git clone git@github.com:UberDever/vetochka.git       # or: ln -s <your clone> vetochka
git clone git@github.com:UberDever/muh-build.git      # or: ln -s <your clone> muh-build
mkdir -p muh-build/build && cc -std=c99 -O2 -DLUA_USE_LINUX \
    -o muh-build/build/lua muh-build/vendor/lua-5.5.1/*.c -lm -ldl
```

## Build

```sh
muh-build/build/lua muh-build/scripts/cli.lua vetochka/recipe.lua
```

The vendored libraries build into `build/` here, vetochka into `vetochka/build/`.

## Reproducing a build

A build is decided by the commits of all three repos. These are known to work together; update
the table when you move one of them forward, and check them out to rebuild an old state.

| repo            | commit    |
|-----------------|-----------|
| vetochka-repo   | this one  |
| vetochka        | 308a648   |
| muh-build       | 968e135   |

## Vendored libraries

- `stb_ds-0.67`: stb_ds.h v0.67, Sean Barrett; public domain or MIT.
- `nob_da-3.8.2`: dynamic arrays from nob.h v3.8.2, tsoding; public domain.
- `arena`: arena.h; Apache-2.0.

Each keeps its own license, stated in its file.
