class Vcert < Formula
  desc "Venafi Machine Identity Services Golang CLI and SDK"
  homepage "https://github.com/Venafi/vcert"
  url "https://github.com/Venafi/vcert/archive/refs/tags/v5.6.2.tar.gz"
  license "Apache-2.0"
  head "https://github.com/venafi/vcert.git", tag: "v5.6.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Venafi/vcert/releases/download/v5.6.2/vcert_v5.6.2_darwin.zip"
      sha256 "222d2d3e319acec5221dada8a83b39cbcd3c02b1f19ecb84ef02878dc6316631"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.6.2/vcert_v5.6.2_darwin_arm.zip"
      sha256 "89c702bcb88afc8635bd1821455ac6540b375632f398a93a456289792023aae5"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.6.2/vcert_v5.6.2_linux.zip"
      sha256 "82b71253d6be254add3cc389e40bd77a862e3a192433bcd8636502b70e554b69"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.6.2/vcert_v5.6.2_linux86.zip"
      sha256 "bc4b5ed5a04597df283ec10f8e1c921664ee5b749040b811f8eb6959f41bf689"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.6.2/vcert_v5.6.2_linux_arm.zip"
      sha256 "ce05f49944686778e531b8331404041a084c0103d89201cf4e5350c84ec3dca8"
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
