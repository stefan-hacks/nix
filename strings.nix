"hello world"
"hello" + " " + "world"

let
  name = "nginx";
in
  "package name is ${name}"

"He said \"Hello\""

''
  This is line one
  This is line two
''

let
  port = 8080;
in
''
  server {
    listen ${toString port};
  }
''
