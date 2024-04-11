class Vcert < Formula
  desc "Venafi Machine Identity Services Golang CLI and SDK"
  homepage "https://github.com/Venafi/vcert"
  url "https://github.com/Venafi/vcert/archive/refs/tags/v5.6.4.tar.gz"
  license "Apache-2.0"
  head "https://github.com/venafi/vcert.git", tag: "v5.6.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Venafi/vcert/releases/download/v5.6.4/vcert_v5.6.4_darwin.zip"
      sha256 "b0f0f1fb027fa8550012b9e55ad26ad71bb89f0c38100663c612779eca25127e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.6.4/vcert_v5.6.4_darwin_arm.zip"
      sha256 "45f96c336724690bab93228ff601ca8e0707320024515b9e3d692c9fbef5c0e5"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.6.4/vcert_v5.6.4_linux.zip"
      sha256 "0083232c294a01d8c45f3c4b476c1fff9241eb15508a94327b58e36800d4ba77"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.6.4/vcert_v5.6.4_linux86.zip"
      sha256 "12ea3030b5895989bd6fd494e40bfdac9d5c6fafbba72a1fbc0e6302209db52f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.6.4/vcert_v5.6.4_linux_arm.zip"
      sha256 "993449c30c994aaf128f0e820d03169cd233545127e22b803a133d890c212cc3"
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
