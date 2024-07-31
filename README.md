## MakrenOS Users

A NixOS config flake enforcing user and home creation within certain parameters, and using some environment variables to enforce xdg dirs where possible.

```
inputs.makrenos-users.url = "github:makrennel/makrenos-users";
```

```
imports = [
    inputs.makrenos-users.nixosModules.default
];
```

```
users.source = ${./users};
```

```
mkdir -p users/name
echo "wheel\nkvm\ninput" > users/name/groups # Where \n creates a new line

```

Also generate a hashed password to users/name/password

