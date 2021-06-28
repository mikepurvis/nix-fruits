final: prev: {
  peach = prev.callPackage ./peach.nix {};
  
  apple = prev.callPackage ./apple.nix {};

  pie = prev.callPackage ./pie.nix {};
}
