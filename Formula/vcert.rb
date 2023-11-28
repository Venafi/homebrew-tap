class Vcert < Formula
  desc "Venafi Machine Identity Services Golang CLI and SDK"
  homepage "https://github.com/Venafi/vcert"
  url "https://github.com/Venafi/vcert/archive/refs/tags/v5.2.1.tar.gz"
  license "Apache-2.0"
  head "https://github.com/venafi/vcert.git", tag: "v5.2.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Venafi/vcert/releases/download/v5.2.1/vcert_v5.2.1_darwin.zip"
      sha256 "83048591e4a9814b00082b9a0c4a8fc7d37fc33c72f8338ae78ba72442564154"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.2.1/vcert_v5.2.1_darwin_arm.zip"
      sha256 "5bb02e5ddc997c7a32f7e997fd179dc909c2c249da993291daeff02bee16a5b7"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.2.1/vcert_v5.2.1_linux.zip"
      sha256 "d6f6eb2239e0fd6f3fa99d744d3009b5581dfb30cbdfc309b777915bc65fe298"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.2.1/vcert_v5.2.1_linux86.zip"
      sha256 "388312332b64fe154de5b5141bd00e463d5ccc4c01023325bc8791fd87cc63ce"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.2.1/vcert_v5.2.1_linux_arm.zip"
      sha256 "0bf7f997ede69768a17d6b8f7cee2d9dba64b971262254fae8f2d8270c0f3bbd"
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
