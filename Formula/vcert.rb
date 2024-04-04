class Vcert < Formula
  desc "Venafi Machine Identity Services Golang CLI and SDK"
  homepage "https://github.com/Venafi/vcert"
  url "https://github.com/Venafi/vcert/archive/refs/tags/v5.6.1.tar.gz"
  license "Apache-2.0"
  head "https://github.com/venafi/vcert.git", tag: "v5.6.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Venafi/vcert/releases/download/v5.6.1/vcert_v5.6.1_darwin.zip"
      sha256 "4d96e2e2926ddde0f41922a5f78b85da5797050d2f81c5285b35b7be659215ab"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.6.1/vcert_v5.6.1_darwin_arm.zip"
      sha256 "8f7d25cdf8874cafbd96d70c94b26b43f7a658a7505145ce25f95a4c66c930b2"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.6.1/vcert_v5.6.1_linux.zip"
      sha256 "8a8de8357e834079a037bb943c86674eebfbd45949e67d73b97bc5704c9cf7ec"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.6.1/vcert_v5.6.1_linux86.zip"
      sha256 "02f377d1adb4fc956042704a36b532a1823b413f66107ff2727f07fcbf6f7b39"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.6.1/vcert_v5.6.1_linux_arm.zip"
      sha256 "3182dede3f3dac854d2871a09d325f89cffbc29039c58f5eca2ec8f08e25e1db"
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
