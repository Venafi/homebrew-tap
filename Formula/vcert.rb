class Vcert < Formula
  desc "Venafi Machine Identity Services Golang CLI and SDK"
  homepage "https://github.com/Venafi/vcert"
  url "https://github.com/Venafi/vcert/archive/refs/tags/v5.7.1.tar.gz"
  license "Apache-2.0"
  head "https://github.com/venafi/vcert.git", tag: "v5.7.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Venafi/vcert/releases/download/v5.7.1/vcert_v5.7.1_darwin.zip"
      sha256 "08469ce83ee816ea01a2341d26b659c44330839d96ca036406611f9bc37791f5"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.7.1/vcert_v5.7.1_darwin_arm.zip"
      sha256 "199be7c17762e353f9734eba9718d98e1708b0377dee82787913b79efc495c02"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.7.1/vcert_v5.7.1_linux.zip"
      sha256 "a015f0700fd2677a7a82d54d4b1915f649a0dbbebc6b2a0fe7642a017c89eea8"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.7.1/vcert_v5.7.1_linux86.zip"
      sha256 "1e47ed1b18d8d4f6b5b7a028c03e1e3f025529ce8e25e49cf1f36fb8f2d34fad"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.7.1/vcert_v5.7.1_linux_arm.zip"
      sha256 "94955a45af5023e3016248f362da074512786a95977aa4e0c5df702addbbaf58"
    end
  end

  def install
    bin.install "vcert" if OS.mac? && Hardware::CPU.intel?
    bin.install "vcert_arm" => "vcert" if OS.mac? && Hardware::CPU.arm?
    bin.install "vcert86" => "vcert" if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
    bin.install "vcert" if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    bin.install "vcert_arm" => "vcert" if OS.linux? && Hardware::CPU.arm?
  end

  test do
    # Validate install
    system "#{bin}/vcert", "--version"
  end
end
