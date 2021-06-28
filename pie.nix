{ lib, coreutils, writeTextFile, apple, peach }:
derivation {
  name = "pie";
  # builder = "${coreutils}/bin/true";
  builder = writeTextFile {
    name = "builder.sh";
    text = ''
      #!/bin/sh
      ${coreutils}/bin/mkdir $out
    '';
    executable = true;
  };
  system = "x86_64-linux";
}
