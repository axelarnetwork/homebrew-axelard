class AxelardAT0173 < Formula
  desc "The Axelar Network Core binary"
  homepage "https://github.com/axelarnetwork/axelar-core"
  license "Apache-2.0"

  # Define the available versions and platforms
  VERSIONS = {
    "0.17.3" => {
      amd64: "32ae28f93bc068c294d491151bfc698723ad9fcb79f360e24f40f00f9bc6c32c",
      arm64: "b2c551b65b13fcef2f73d84faa16755149491a5eba4b41e6f8eaeaa5fb8ffc4f",
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