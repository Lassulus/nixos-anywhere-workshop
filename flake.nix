{
  outputs = {...}: {
    templates.default = {
      description = "A nixos-anywhere example";
      path = ./template;
    };
  };
}
