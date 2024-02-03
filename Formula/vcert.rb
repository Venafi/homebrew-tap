class Vcert < Formula
  desc "Venafi Machine Identity Services Golang CLI and SDK"
  homepage "https://github.com/Venafi/vcert"
  url "https://github.com/Venafi/vcert/archive/refs/tags/v5.4.0.tar.gz"
  license "Apache-2.0"
  head "https://github.com/venafi/vcert.git", tag: "v5.4.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Venafi/vcert/releases/download/v5.4.0/vcert_v5.4.0_darwin.zip"
      sha256 "74a102a02c464050872045b2bd4a3c4be4c12dd7de500bedb92f64b2b403fece"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.4.0/vcert_v5.4.0_darwin_arm.zip"
      sha256 "99e1199183f013f98fd8b71c769b56c035645684fa9285d00ea997d5aea14e03"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.4.0/vcert_v5.4.0_linux.zip"
      sha256 "fc923100d0742655c2e43112361042679375399de575828208795291ca563cc8"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.4.0/vcert_v5.4.0_linux86.zip"
      sha256 "8c25343c5c02fe2b1123ad711dec06ab85dbadb34fad92855f6770744d143c8b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.4.0/vcert_v5.4.0_linux_arm.zip"
      sha256 "018bcf2e16b3fa419d6f89d38692a36a82b6cc1ddc0cfcac3f7fb395b6ef04e1"
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
