class AxelardAT0240 < Formula
  desc "The Axelar Network Core binary"
  homepage "https://github.com/axelarnetwork/axelar-core"
  license "Apache-2.0"

  # Define the available versions and platforms
  VERSIONS = {
    "0.24.0" => {
      amd64: "3b0b943163f99a61106acf1aca7fb3ba2beea1424c90361b5d541d56a4cb9794",
      arm64: "54771ff5b378f646a0b9f78dd5ed80b1be758c887c398e9c090b53a52ba0d6bc",
    },
  }

  # Determine the platform and URL based on the system architecture
  if Hardware::CPU.arm?
    platform = :arm64
  else
    platform = :amd64
  end

  # Select the latest version if none is specified
  version = VERSIONS.keys.last

  # Retrieve the SHA256 hash for the selected version and platform
  sha256 = VERSIONS[version][platform]

  # Define the URL based on the selected version and platform
  url "https://github.com/axelarnetwork/axelar-core/releases/download/v#{version}/axelard-darwin-#{platform}-v#{version}.zip"
  sha256 sha256

  # Install the binary
  def install
    if Hardware::CPU.arm?
      bin.install "axelard-darwin-arm64-v#{version}" => "axelard"
    else
      bin.install "axelard-darwin-amd64-v#{version}" => "axelard"
    end
  end

  test do
    system "#{bin}/axelard", "version"
  end
end