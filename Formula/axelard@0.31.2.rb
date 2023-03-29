class AxelardAT0312 < Formula
  desc "The Axelar Network Core binary"
  homepage "https://github.com/axelarnetwork/axelar-core"
  license "Apache-2.0"

  # Define the available versions and platforms
  VERSIONS = {
    "0.31.2" => {
      amd64: "ead6e4336a496182e142fadf01faf93b15d59d2fefe39ea447f9e8cffecdfd2d",
      arm64: "6dc8d12cd732a0ff19973018bc90332e428e5f7ecbba48999142e362cd4eb176",
    },
  }

  # Determine the platform and URL based on the system architecture
  if Hardware::CPU.arm?
    platform = :arm64
    puts "ARM architecture detected"
    puts "CPU architecture: #{Hardware::CPU.arch}"
    puts "Is 64-bit: #{Hardware::CPU.is_64_bit?}"
  else
    platform = :amd64
    puts "Intel architecture detected"
  end

  # Select the latest version if none is specified
  version = VERSIONS.keys.last
  puts "Selected version: #{version}"

  # Retrieve the SHA256 hash for the selected version and platform
  sha256 = VERSIONS[version][platform]
  ohai "Warning: No SHA256 hash found for Axelard version #{version} and platform #{platform}" unless sha256

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