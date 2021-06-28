final: prev:
  # Credit: https://www.reddit.com/r/NixOS/comments/6hswg4/how_do_i_turn_an_overlay_into_a_proper_package_set/djfv1va/?context=3
  let
    # prev is what you get upstream; defaults is what is being overridden
    # locally i.e. within this expression; extra is left open for downstream
    # to augment layer by layer
    newScope = extra: prev.lib.callPackageWith (prev // defaults // extra);
    defaults = {};
  in {
    fruit = final.lib.makeScope newScope (fruitPrev: {
      peach = fruitPrev.callPackage ./peach.nix {};
      
      apple = fruitPrev.callPackage ./apple.nix {};

      pie = fruitPrev.callPackage ./pie.nix {};
    });
  }
