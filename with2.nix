let
  a = {
    x = 1;
    y = 2;
    z = 3;
  };
in
{
  b = with a; [
    x
    y
    z
  ];
  c = x;
}
