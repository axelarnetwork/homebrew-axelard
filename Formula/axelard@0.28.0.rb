class AxelardAT0280 < Formula
  desc "The Axelar Network Core binary"
  homepage "https://github.com/axelarnetwork/axelar-core"
  license "Apache-2.0"

  # Define the available versions and platforms
  VERSIONS = {
    "0.28.0" => {
      amd64: "a505ec5979400fa4247fadeea712b19d9f0712502dbafdb3acb6b23869d15207",
      arm64: "240cc86574e7c972152e96dab9c63e921bd07f8b0f09ff53c1481e47a1bfe632",
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