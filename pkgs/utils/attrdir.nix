base:

with builtins;

let
  dirContents = attrNames (readDir base);
  attrset = listToAttrs (concatMap genAttr dirContents)
    // { recurseForDerivations = true; };

  genAttr = file:
    let
      matchResult = match ''(.+)\.(.+)'' file;
      name = elemAt matchResult 0;
      ext = elemAt matchResult 1;
      okay = length matchResult == 2 && ext == "nix" && name != "default";
      contents = import (base + "/${file}");
      args = intersectAttrs (functionArgs contents) attrset;
    in
      if okay
      then [
        {
          inherit name;
          value = contents args;
        }
      ]
      else [];

in attrset
