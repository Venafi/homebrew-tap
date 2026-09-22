class Venctl < Formula
  desc "Venafi CLI serves as an alternative to the Venafi Control Plane web interface"
  homepage "https://docs.venafi.cloud/vaas/venctl/c-venctl-overview"
  url "https://docs.venafi.cloud/vaas/venctl/c-venctl-releases"
  version "1.30.0"
  on_macos do
    if Hardware::CPU.intel?
      url "https://dl.venafi.cloud/venctl/#{version}/venctl-darwin-amd64.zip"
      sha256 "ac5509622a27e79f7cfe9289dea5f7930f438bd0f6576d55651bf97f7fd1cf3f"
    end
    if Hardware::CPU.arm?
      url "https://dl.venafi.cloud/venctl/#{version}/venctl-darwin-arm64.zip"
      sha256 "96fd4e274c99395b459af6f76df39a0830e937dd59720f92205e9420e56d3008"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://dl.venafi.cloud/venctl/#{version}/venctl-linux-amd64.zip"
      sha256 "92310d4866ddc2b5fe14bd486708e26cf432f0ca556b0a8b445bbc8cea377158"
    end
    if Hardware::CPU.arm?
      url "https://dl.venafi.cloud/venctl/#{version}/venctl-linux-arm64.zip"
      sha256 "51a2268645e1b10a1576b9fb6cd081de22144bce1c1766e67a7bced34a6a7685"
    end
  end

  def install
    bin.install "venctl"
  end

  test do
    # Validate install
    system "#{bin}/venctl", "version"
  end
end
