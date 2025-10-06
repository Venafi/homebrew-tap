class Venctl < Formula
  desc "Venafi CLI serves as an alternative to the Venafi Control Plane web interface"
  homepage "https://docs.venafi.cloud/vaas/venctl/c-venctl-overview"
  url "https://docs.venafi.cloud/vaas/venctl/c-venctl-releases"
  version "1.22.0"
  on_macos do
    if Hardware::CPU.intel?
      url "https://dl.venafi.cloud/venctl/#{version}/venctl-darwin-amd64.zip"
      sha256 "7a2190e9fb8cb7d2744b78778363e18dcc98a94351005fb76d6b8c64690ebecc"
    end
    if Hardware::CPU.arm?
      url "https://dl.venafi.cloud/venctl/#{version}/venctl-darwin-arm64.zip"
      sha256 "66b16db62286646d94bcd04548161ddea39fca079113e49b187490f6927671ae"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://dl.venafi.cloud/venctl/#{version}/venctl-linux-amd64.zip"
      sha256 "75aa9d17a2b3142e14b9f0cadac1c4df6dbe8be0d9ae2def68989da061458cef"
    end
    if Hardware::CPU.arm?
      url "https://dl.venafi.cloud/venctl/#{version}/venctl-linux-arm64.zip"
      sha256 "d0ac7c24dd10c830a59517b4173ab71a3aebe093be663e06fd94c963c1ba7c9f"
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
