class Vsign < Formula
  desc "Venafi CodeSign Protect Golang CLI and SDK"
  homepage "https://github.com/venafi/vsign"
  url "https://github.com/Venafi/vsign/archive/refs/tags/v1.0.2.tar.gz"
  version "1.0.2"
  license "Apache-2.0"
  head "https://github.com/venafi/vsign.git", tag: "v1.0.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Venafi/vsign/releases/download/v#{version}/vsign-darwin-amd64"
      sha256 "0255718270ec4db3668de4ed4b0a48cd6cde68993469b4721b641637a2ac0505"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Venafi/vsign/releases/download/v#{version}/vsign-linux-amd64"
      sha256 "0a594c3bfadc6ab8e74797087be1d26b6ede626ae94b40065b62391faf9746f9"
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
