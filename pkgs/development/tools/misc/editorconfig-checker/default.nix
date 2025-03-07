{ lib, buildGoModule, fetchFromGitHub, installShellFiles }:

buildGoModule rec {
  pname = "editorconfig-checker";
  version = "2.5.0";

  src = fetchFromGitHub {
    owner = "editorconfig-checker";
    repo = "editorconfig-checker";
    rev = version;
    sha256 = "sha256-zbE/je5ZxCX83hxl88c8/FoZzOLatrSEjSAI+eIOVQQ=";
  };

  vendorSha256 = "sha256-SrBrYyExeDHXhezvtfGLtm8NM1eX4/8kzwUICQLZDjo=";

  doCheck = false;

  nativeBuildInputs = [ installShellFiles ];

  ldflags = [ "-X main.version=${version}" ];

  postInstall = ''
    installManPage docs/editorconfig-checker.1
  '';

  meta = with lib; {
    description = "A tool to verify that your files are in harmony with your .editorconfig";
    homepage = "https://editorconfig-checker.github.io/";
    license = licenses.mit;
    maintainers = with maintainers; [ uri-canva zowoq ];
  };
}
