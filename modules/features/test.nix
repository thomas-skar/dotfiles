{

  # TODO: try accessing attrs from other modules and do *something* if a value is set
  flake.homeModules.test =
    {
      config,
      lib,
      ...
    }:
    let
      foo = "test";
    in
    { };
}
