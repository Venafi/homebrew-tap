class VSign < Formula
  desc "Venafi CodeSign Protect Golang CLI and SDK"
  homepage "https://github.com/venafi/vsign"
  url "https://github.com/Venafi/vsign/archive/refs/tags/v1.0.1.tar.gz"
  version "1.0.1"
  license "Apache-2.0"
  head "https://github.com/venafi/vsign.git", tag: "v1.0.1"
  
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Venafi/vsign/releases/download/v#{version}/vsign-darwin-amd64"
      sha256 "23ea8bddbd2e483c1671e96b98cb3d966d3a8f09b6e5c5a15f30b53aa53fdafe"
    end
  end
  
  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Venafi/vsign/releases/download/v#{version}/vsign-linux-amd64"
      sha256 "5a6b3dec6d9883beaeab4fd7445cfc5269c45c0115da6d35964febd75187462a"
    end
  end
  
  def install
    cpu = "amd64"
    os = OS.mac? ? "darwin" : "linux"
    bin.install "vsign-#{os}-#{cpu}" => "vsign"
  end
  
  test do
    # Validate install
    system "#{bin}/vsign", "version"
  end
end
  