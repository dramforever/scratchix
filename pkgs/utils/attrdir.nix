base:

with builtins;

let
  dirContents = readDir base;
  attrset = listToAttrs (concatMap genAttr (attrNames dirContents))
    // { recurseForDerivations = true; };

  genAttr = file:
    let
      matchResult = match ''(.+)\.(.+)'' file;
      name = elemAt matchResult 0;
      ext = elemAt matchResult 1;
      okay =
        (dirContents.${file} == "regular" && length matchResult == 2 && ext == "nix" && name != "default")
          || dirContents.${file} == "directory";
      contents = import (base + "/${file}");
      args = intersectAttrs (functionArgs contents) attrset;
    in
      if okay
      then [
        {
          name =
            if dirContents.${file} == "directory"
            then file else name;
          value = contents args;
        }
      ]
      else [];

in attrset
