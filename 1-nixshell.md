# Absolute basics of NixOS and the Nix scripting language.

This tutorial assumes you have installed NixOS and can run nix:
```
$ nix --version
nix (Nix) 2.31.2 
```

## Using nix-shell

With nix-shell you can create a temporary shell environment with extra packages that are not installed system wide.
Nix manages these packages per shell, even can setup an auto clean in the configuration.
To spin up a shell with an extra package, you can run the following:

```
$ nix-shell -p cowsay
```

Upon running the command, you will notice Nix downloading the cowsay dependency.
Cowsay should be available in the nix-shell, and if you exit the nix-shell (by writing `exit` or using CTRL + D), you cannot run cowsay (unless you had it installed previously).
 
This is part of the Nix package manager and not neccessarily to do with NixOS.
Nix can be used on any Linux distro and is not limited to NixOS.

Or even faster
```
nix-shell -p cowsay --run "cowsay Hello from the nix shell"
```

And can even perform pipe operations over the output:
```
nix-shell -p cowsay --run "cowsay Look at me" | grep -i (oo)
```

## Reproducibility

Over time new versions will be added to popular packages like git. You cannot be sure what works today will continue to work many years in the future.
Strictly speaking its not a reproducable setup. But Nix has found ways of dealing with this.
When using the Nix shell, you can pin a certain snapshot of the Nix package repository and additional options:

--pure | Avoid depending on the systems environment as much as possible, that could impact reproduceability
-I nixpkgs=<url> | The URL typically is https://github.com/NixOS/nixpkgs, here you can pin it a certain commit of their package repository.

For example:
```
nix-shell -p git --run "git --version" --pure -I nixpkgs=https://github.com/NixOS/nixpkgs/tarball/2a601aafdc5605a5133a2ca506a34a3a73377247
```



