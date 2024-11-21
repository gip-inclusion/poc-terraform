with import <nixpkgs> {
    config.allowUnfree = true;
};
mkShell {
  name = "terraform config";
  buildInputs = [
    terraform
    terraform-ls
    tflint
  ];
}
