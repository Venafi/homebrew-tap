class Vcert < Formula
  desc "Venafi Machine Identity Services Golang CLI and SDK"
  homepage "https://github.com/Venafi/vcert"
  url "https://github.com/Venafi/vcert/archive/refs/tags/v5.12.3.tar.gz"
  license "Apache-2.0"
  head "https://github.com/venafi/vcert.git", tag: "v5.12.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Venafi/vcert/releases/download/v5.12.3/vcert_v5.12.3_darwin.zip"
      sha256 "f14e4b8706fccfd39d4ee27a79a09b53878547580b016a6a5e09150dcfb5f72a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.12.3/vcert_v5.12.3_darwin_arm.zip"
      sha256 "38c2aad2e8365923da9851518cc2bca92cbe180647dfe880ac7249e9d9504845"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.12.3/vcert_v5.12.3_linux.zip"
      sha256 "10343274ab722e09e902585afb7b8ac5964f5846142390f51ab096af79e2bcbf"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.12.3/vcert_v5.12.3_linux86.zip"
      sha256 "773275c217dc99af7ca9cff6a83bf06acd782f4f825460d7487b200dc58e8b1f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.12.3/vcert_v5.12.3_linux_arm.zip"
      sha256 "f14614dbb3450f079105d6103375b0d0a040849657c731f47546a45809c108a0"
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
