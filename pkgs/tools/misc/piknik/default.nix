{ lib
, fetchFromGitHub
, buildGoModule
}:

let
  pname = "piknik";
  version = "2020-06-13";
  rev = "0b600785ff5833fdc3e8823ec82f304cea2923fc"; # 0.9,1 with a number of minor updates
  sha256 = "03q7v387z0a0ihvqmd445qmmrmbkzb5jyk5wm4h2ng3clp663ysa";
in
buildGoModule rec {
  inherit pname;
  inherit version;

  goPackagePath = "github.com/jedisct1/piknik";

  src = fetchFromGitHub {
    owner = "jedisct1";
    repo = "piknik";
    inherit rev;
    inherit sha256;
  };

  modSha256 = "1i6nwr5p0dpnwg8i20kzvazdf72zw10ahsqshl8x4rwigjkvia72"; 

  subPackages = [ "." ]; 

  meta = with lib; {
    description = "E2E encrypted clipboard usable across networks.";
    homepage = https://github.com/jedisct1/piknik;
    license = licenses.isc;
    maintainers = with maintainers; [ wamserma ];
    platforms = platforms.linux ++ platforms.darwin;
  };
}