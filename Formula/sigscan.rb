class Sigscan < Formula
  desc "Inspect container images and other artifacts for signatures"
  homepage "https://github.com/venafi/sigscan"
  url "https://github.com/venafi/sigscan/archive/refs/tags/v0.1.0.tar.gz"
  version "0.1.0"
  license "Apache-2.0"
  head "https://github.com/venafi/sigscan.git", tag: "v0.1.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Venafi/sigscan/releases/download/v#{version}/sigscan-darwin-amd64"
      sha256 "6365128a172eb19053eee81d274724e96a29640a9366230e90213183f551e93b"
    end

    if Hardware::CPU.arm?
      url "https://github.com/Venafi/sigscan/releases/download/v#{version}/sigscan-darwin-arm64"
      sha256 "8022f6350489c03400ce6cc441d864c747f6d645df47ff60c854e05c3c4dd24e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Venafi/sigscan/releases/download/v#{version}/sigscan-linux-amd64"
      sha256 "53c84ff2888f509477cafd903402f8afe51c81912afc451b26bfba42e9107264"
    end

    if Hardware::CPU.arm?
      url "https://github.com/Venafi/sigscan/releases/download/v#{version}/sigscan-linux-arm64"
      sha256 "bfbc28191d0717344f2e46ef10e0609272b87e74bcb9e9ee459bb0b26faea0ba"
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
