let
  a = {
    name = "Nix";
    others = "everyone else";
  };
in
with (a);
"hello ${name} and ${others}"
