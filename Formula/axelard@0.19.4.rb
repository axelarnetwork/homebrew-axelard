class AxelardAT0194 < Formula
  desc "The Axelar Network Core binary"
  homepage "https://github.com/axelarnetwork/axelar-core"
  license "Apache-2.0"

  # Define the available versions and platforms
  VERSIONS = {
    "0.19.4" => {
      amd64: "358c791c9bc0c6f01713a76cce45fe288dafef1987918c1bb90ebb8d974614f5",
      arm64: "2bfde14d7d85980377941be41e88b9b7dd5ec554ec8b886126cc984688f3d24c",
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