let
  a = {
    x = 1;
    y = 2;
  };
  inherit (a) x y;
in
[
  x
  y
]
