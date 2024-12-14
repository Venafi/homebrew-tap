class Vcert < Formula
  desc "Venafi Machine Identity Services Golang CLI and SDK"
  homepage "https://github.com/Venafi/vcert"
  url "https://github.com/Venafi/vcert/archive/refs/tags/v5.7.2.tar.gz"
  license "Apache-2.0"
  head "https://github.com/venafi/vcert.git", tag: "v5.7.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Venafi/vcert/releases/download/v5.7.2/vcert_v5.7.2_darwin.zip"
      sha256 "74a7741cbd9608f6fa4b86c1bb899be0e1e14d278fd643bf19efa550e0bd6781"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.7.2/vcert_v5.7.2_darwin_arm.zip"
      sha256 "9b9d2eff230e5c96437186b8cde6b4b4e087f91818cf8142aa076fc9658244ef"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.7.2/vcert_v5.7.2_linux.zip"
      sha256 "fa90d5290a11efcd1e7a467c0c0e4d6b8585a8fb529bbb4ad81e1373db382c02"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.7.2/vcert_v5.7.2_linux86.zip"
      sha256 "189296fe13a5949cab19bcb5de6a9aeffed227db902baeca80eff96a7a9c1b2c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.7.2/vcert_v5.7.2_linux_arm.zip"
      sha256 "bdb8d97b34895920aedd3ec88c47b3f3e62ff0025f3de803d7085d5034f292dd"
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
