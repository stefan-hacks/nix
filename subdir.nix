let
  a = {
    subdir = "subdir";
  };
in
with (a);
./${subdir}/foo
