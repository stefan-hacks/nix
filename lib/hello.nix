# ============================================================================
# lib/hello.nix — Your First Nix Expression
# ============================================================================
# This file demonstrates the core Nix language features:
#   - attrsets (attribute sets)
#   - functions
#   - string interpolation
#   - the 'let ... in' binding
#
# It is imported by flake.nix as a package output.
# ============================================================================

{
  pkgs ? null,
}:

let
  # Bind values to names using 'let'
  greeting = "hello";
  subject = "Nix";

  # A function that takes a name and returns a personalized greeting
  mkGreeting = name: "${greeting}, ${name}! Welcome to ${subject}.";
in
{
  # The 'in' block defines what this expression RETURNS.
  # This attrset is the result of evaluating lib/hello.nix.

  # --- A simple string --
  message = mkGreeting "world";
  # => "Hello, World! Welcome to Nix"

  # --- A nested attrset (like JSON) ---
  info = {
    language = "Nix";
    paradigm = "purely functional";
    evaluation = "lazy";
    storePath = "/nix/store";
  };

  # --- A list ---
  features = [
    "reproducible"
    "declaritive"
    "atomic"
    "rollback"
  ];

  # --- A function exposed as an attribute ---
  greet = mkGreeting;
}
