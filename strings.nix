let
  editor = "nvim";
in
{
  greeting = "hello, Nix user!";

  message = "your editor is " + editor;

  configLine = "export EDITOR=${editor}";

  script = ''
    #!/usr/bin/env bash
    echo "Launching ${editor}..."
    ${editor} "$@"
  '';
}
