# ============================================================================
# lib/types.nix — Nix Type System Demonstration
# ============================================================================
# This file demonstrates every primitive and composite type in Nix.
# Import it in the REPL or in flake.nix to explore.
# ============================================================================

{
  # --- Integer ---
  # Arbitrary precision. No overflow.
  int = 42;
  negative = -7;

  # --- Float ---
  # Exist but are less common in packaging.
  float = 3.1459;

  # --- String ---
  # Double-quoted strings support interpolation with ${}.
  string = "hello";
  interpolated = "hello ${toString 42}";
  # => "hello 42"

  # Indented strings (two single quotes) preserve formtting.
  # Used for multi-line shell scripts, config files, etc.
  multiline = ''
    #!/usr/bin/env bash
    echo "Line one"
    echo "Line two"
  '';

  # --- Boolean ---
  boolTrue = true;
  boolFalse = false;

  # --- Null ---
  # Represents the absence of a value. Used sparingly.
  nothing = null;

  # --- Path ---
  # Paths are a distinct type, not strings. They are resolved relative
  # to the containing file.
  relative = ./hello.nix;
  absolute = /etc/passwd;

  # --- List ---
  # SPACES as separators. Commas are syntax errors.
  numbers = [
    1
    2
    3
  ];
  mixed = [
    1
    "two"
    true
    { a = 4; }
  ];

  # --- Attribute Set (attrset) ---
  # The most important type in Nix. Like JSON objects but with functions.
  person = {
    name = "lin";
    age = 30;
    skills = [
      "Nix"
      "Rust"
      "Python"
    ];
  };

  # --- Function ---
  # Functions are first-class values. They can be passed as arguments,
  # returned from other functions, and stored in attrsets.
  greet = name: "Hello, ${name}!";
}
