# mine

Vendored libraries, one directory each, with a [muh-build](https://github.com/UberDever/muh-build)
manifest next to the code. A project lists the ones it needs, and you check out just those next to it:

```sh
git clone --no-checkout git@github.com:UberDever/mine.git ws
git -C ws sparse-checkout set <entry> <entry> ...   # later: git -C ws sparse-checkout add <entry>
git -C ws checkout master
```

Each library keeps its own license, stated in its files.
