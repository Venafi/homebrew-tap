class Sigscan < Formula
  desc "Inspect container images and other artifacts for signatures"
  homepage "https://github.com/venafi/sigscan"
  url "https://github.com/venafi/sigscan/archive/refs/tags/v0.2.0.tar.gz"
  version "0.2.0"
  license "Apache-2.0"
  head "https://github.com/venafi/sigscan.git", tag: "v0.2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Venafi/sigscan/releases/download/v#{version}/sigscan-darwin-amd64"
      sha256 "42a7f628b78db736f0530f99e8453bb2628021bf464e2ca54dc7993bd59b9d2d"
    end

    if Hardware::CPU.arm?
      url "https://github.com/Venafi/sigscan/releases/download/v#{version}/sigscan-darwin-arm64"
      sha256 "c93cf85b18e1ba8596fe105ef156f95d73868e8ecfa0b13178e95558aee86896"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Venafi/sigscan/releases/download/v#{version}/sigscan-linux-amd64"
      sha256 "15110854adc85c4ecf783694c308a798945473e1a631a1f3b23099e63841f637"
    end

    if Hardware::CPU.arm?
      url "https://github.com/Venafi/sigscan/releases/download/v#{version}/sigscan-linux-arm64"
      sha256 "35074ec7d85452c08e15f853f67f2e252e610565481a699f0436f046931b2e6c"
    end
  end

  def install
    cpu = Hardware::CPU.intel? ? "amd64" : "arm64"
    os = OS.mac? ? "darwin" : "linux"
    bin.install "sigscan-#{os}-#{cpu}" => "sigscan"
  end

  test do
    system "#{bin}/sigscan", "version"
  end
end
