class AxelardAT0265 < Formula
  desc "The Axelar Network Core binary"
  homepage "https://github.com/axelarnetwork/axelar-core"
  license "Apache-2.0"

  # Define the available versions and platforms
  VERSIONS = {
    "0.26.5" => {
      amd64: "8f58911aadae55beb03ace3464bce885ce28e61af9883c335f871677a4a41922",
      arm64: "c43ab5b365f8d661dc923ea0d073e7e95d97ffb67e352d4656c905e20c296457",
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