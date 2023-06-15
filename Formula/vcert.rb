class Vcert < Formula
  desc "Venafi Machine Identity Services Golang CLI and SDK"
  homepage "https://github.com/Venafi/vcert"
  url "https://github.com/Venafi/vcert/archive/refs/tags/v4.24.0.tar.gz"
  license "Apache-2.0"
  head "https://github.com/venafi/vcert.git", tag: "v4.24.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Venafi/vcert/releases/download/v4.24.0/vcert_v4.24.0_darwin.zip"
      sha256 "745e0bb119b3e2431da0f78b26fa4dd53cd64e0f10ed433e41bcdf941025f702"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v4.24.0/vcert_v4.24.0_darwin_arm.zip"
      sha256 "d8027da098227bf5521a8128906eedf56d1d3a90007b19b34662a6ce8f4e1b5e"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Venafi/vcert/releases/download/v4.24.0/vcert_v4.24.0_linux.zip"
      sha256 "d0924262e49f8927fa2cfdf8d21a272125084bed7cbd4eb11725f6b8abe79f78"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/Venafi/vcert/releases/download/v4.24.0/vcert_v4.24.0_linux86.zip"
      sha256 "ebc3de35400bbb663b6cfb5c284f1a836ec6417183dc63defdd0fb1b560523f4"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v4.24.0/vcert_v4.24.0_linux_arm.zip"
      sha256 "b3fbe0c3f25cf08eb9e5bc665cbeb3636637e30d00098f72178a37d916eb8ea4"
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
