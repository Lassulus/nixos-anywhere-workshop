this is an example repo for nixos-anywhere and disko.
to run the interactive vm test run:
```
nix run github:numtide/nixos-anywhere -- --flake '.#mysystem' --vm-test
```

you can also install the vm on some remote system when running
```
nix run github:numtide/nixos-anywhere -- --flake '.#mysystem' root@192.168.0.10
```
