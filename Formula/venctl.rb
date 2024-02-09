class Venctl < Formula
  desc "Venafi CLI serves as an alternative to the Venafi Control Plane web interface"
  homepage "https://docs.venafi.cloud/vaas/venctl/c-venctl-overview"
  url "https://docs.venafi.cloud/vaas/venctl/c-venctl-releases"
  version "1.5.0"
  on_macos do
    if Hardware::CPU.intel?
      url "https://dl.venafi.cloud/venctl/#{version}/venctl-darwin-amd64.zip"
      sha256 "ba3dd02f21f99e5a75b32cd28ddd83478c578fc427d7158359af7fc7348182a9"
    end
    if Hardware::CPU.arm?
      url "https://dl.venafi.cloud/venctl/#{version}/venctl-darwin-arm64.zip"
      sha256 "37038c99e9b39e4c06b94124e139b6ade73ce87afaacba2b9e55441dc49a6611"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://dl.venafi.cloud/venctl/#{version}/venctl-linux-amd64.zip"
      sha256 "3f3b41b9808b4af71491a147d2d42e962780548ce4188d21bb3de7a98d547722"
    end
    if Hardware::CPU.arm?
      url "https://dl.venafi.cloud/venctl/#{version}/venctl-linux-arm64.zip"
      sha256 "1984c6a5c6b8a4a2d5ad50b227bc006a6ec8e42792fb363ef594c2bc825cdaba"
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
