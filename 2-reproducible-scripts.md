## Reproducible scripts

In 'normal' Linux shell scripts you are assume certain dependencies and configuration is done on the machine.
You expect git to be present, you expect curl to be present etc. 
With nix-shell you can also make scripts that will install these dependencies upon execution.
With the benefit that it should work on all machines regardless if they have the dependencies or not.
Such script could be:

```
#!/usr/bin/env nix-shell
#! nix-shell -i bash
#! nix-shell -p curl jq 
#! nix-shell -I nixpkgs=https://github.com/NixOS/nixpkgs/tarball/f8aaff9e0bbccb629aef4e54f41bdfdc98e05a48

curl --silent -H "Accept: application/json" https://icanhazdadjoke.com | jq ".joke"
```

The second shebang is important, this tells the nix shell to use bash as it's interpeter.
If you do not specify the intepreter, it will just open another nix-shell.

