class Vcert < Formula
  desc "Venafi Machine Identity Services Golang CLI and SDK"
  homepage "https://github.com/Venafi/vcert"
  url "https://github.com/Venafi/vcert/archive/refs/tags/v5.2.0.tar.gz"
  license "Apache-2.0"
  head "https://github.com/venafi/vcert.git", tag: "v5.2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Venafi/vcert/releases/download/v5.2.0/vcert_v5.2.0_darwin.zip"
      sha256 "10e72db578ec35b856fd9c3bd222c5b7ac149e2ed4d357d3c342ac17040789e3"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.2.0/vcert_v5.2.0_darwin_arm.zip"
      sha256 "1c78d5d746412081334c183fa54b97e023d80aa814ef6f9c90c832ca18f05cb1"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.2.0/vcert_v5.2.0_linux.zip"
      sha256 "3f2f1a666622c020c8fef7263f810b95d16e100825b37dd150da03901addcc2b"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.2.0/vcert_v5.2.0_linux86.zip"
      sha256 "565fadc7d721bb9c718f9c837fca7ba5adf30f2cf1877b9537e485fc11242f2d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.2.0/vcert_v5.2.0_linux_arm.zip"
      sha256 "4a2d0601d794396c5d90d2cc2ded87801753f0b95c33ae2911cb8f11bc4f49d2"
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
