class Vcert < Formula
  desc "Venafi Machine Identity Services Golang CLI and SDK"
  homepage "https://github.com/Venafi/vcert"
  url "https://github.com/Venafi/vcert/archive/refs/tags/v5.1.0.tar.gz"
  license "Apache-2.0"
  head "https://github.com/venafi/vcert.git", tag: "v5.1.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Venafi/vcert/releases/download/v5.1.0/vcert_v5.1.0_darwin.zip"
      sha256 "579db10290d13cdd9b227ea23766a35159c997ed5db5ab4fe4fc83eabbaf13b4"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.1.0/vcert_v5.1.0_darwin_arm.zip"
      sha256 "e6930559eca5b75f1e50ab2fbdcfc78f3d0a6f51e954bd2e45b6371aaa3ea802"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.1.0/vcert_v5.1.0_linux.zip"
      sha256 "e3d1a7159fe5424391618167a5ea7625f6bf4247244c8b46bb1617a828abc2ab"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.1.0/vcert_v5.1.0_linux86.zip"
      sha256 "aca382c600b6c7aede59537ed9e2bc744de6fe30f2b26714ad8365dbd4ae8aab"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.1.0/vcert_v5.1.0_linux_arm.zip"
      sha256 "dab82bda153d26ac8ecefaf82c5dbf9638fe7768d50509b742dfd9733fdc709d"
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
