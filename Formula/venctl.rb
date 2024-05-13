class Venctl < Formula
  desc "Venafi CLI serves as an alternative to the Venafi Control Plane web interface"
  homepage "https://docs.venafi.cloud/vaas/venctl/c-venctl-overview"
  url "https://docs.venafi.cloud/vaas/venctl/c-venctl-releases"
  version "1.9.0"
  on_macos do
    if Hardware::CPU.intel?
      url "https://dl.venafi.cloud/venctl/#{version}/venctl-darwin-amd64.zip"
      sha256 "667b8773980ce1342d51466e4f78e0fca1ab95819fca2d1c6b8a2a81198df4e6"
    end
    if Hardware::CPU.arm?
      url "https://dl.venafi.cloud/venctl/#{version}/venctl-darwin-arm64.zip"
      sha256 "d68c5959bc8be6f9e9d2f5d1eec39293414cf466bbb2eb306b3f40817711e9d5"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://dl.venafi.cloud/venctl/#{version}/venctl-linux-amd64.zip"
      sha256 "cfb0a86b98f68b9a7684ab00b8176577c42162c3dfa976b8c99cf02064a092bb"
    end
    if Hardware::CPU.arm?
      url "https://dl.venafi.cloud/venctl/#{version}/venctl-linux-arm64.zip"
      sha256 "78dd48ae03c9a6931d0981d66443fcdb103a055af61db104493c166d5d67831c"
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
