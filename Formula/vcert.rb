class Vcert < Formula
  desc "Venafi Machine Identity Services Golang CLI and SDK"
  homepage "https://github.com/Venafi/vcert"
  url "https://github.com/Venafi/vcert/archive/refs/tags/v5.0.0.tar.gz"
  license "Apache-2.0"
  head "https://github.com/venafi/vcert.git", tag: "v5.0.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Venafi/vcert/releases/download/v5.0.0/vcert_v5.0.0_darwin.zip"
      sha256 "b3344d42adf71967a3058e4ec18cdffc39f08e8460df56e38f2c0e104f77b344"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.0.0/vcert_v5.0.0_darwin_arm.zip"
      sha256 "5655285c30465577646e5322c2562a2ab219c0f6ca47d88de74e26cd5dd16945"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.0.0/vcert_v5.0.0_linux.zip"
      sha256 "01ead26c67a00ebc771d545a72f9ce421bdb560f65be77af4b75f27fe469d162"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.0.0/vcert_v5.0.0_linux86.zip"
      sha256 "7c415bc5dd90cc40b9bd06e258519f526b60104b1b9d8f8456527bd1b711ef43"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.0.0/vcert_v5.0.0_linux_arm.zip"
      sha256 "42468819d0939d26a9275b61bd43282f4fcec2e40b58b7d8da2b5089d4d37454"
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
