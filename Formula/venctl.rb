class Venctl < Formula
  desc "Venafi CLI serves as an alternative to the Venafi Control Plane web interface"
  homepage "https://docs.venafi.cloud/vaas/venctl/c-venctl-overview"
  url "https://docs.venafi.cloud/vaas/venctl/c-venctl-releases"
  version "1.4.0"
  on_macos do
    if Hardware::CPU.intel?
      url "https://dl.venafi.cloud/venctl/#{version}/venctl-darwin-amd64.zip"
      sha256 "50dae730b043d498ae16149be22a5c0edb57b1f12c68b4bb40f72b1ac58af171"
    end
    if Hardware::CPU.arm?
      url "https://dl.venafi.cloud/venctl/#{version}/venctl-darwin-arm64.zip"
      sha256 "7d41273e9e44e082d29cd5aa9e6cdb7a9d083cbb76b79699fd825075053d5279"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://dl.venafi.cloud/venctl/#{version}/venctl-linux-amd64.zip"
      sha256 "f913e9cce9d29f2bdd0d165d9829ace60e49075ed02139a42d761cfb5ef05d9d"
    end
    if Hardware::CPU.arm?
      url "https://dl.venafi.cloud/venctl/#{version}/venctl-linux-arm64.zip"
      sha256 "8520421b39c09a2b8b56cd1e53e1b1df758ce92840f0778c7eed8a7cdc58f3af"
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
