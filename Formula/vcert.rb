class Vcert < Formula
  desc "Venafi Machine Identity Services Golang CLI and SDK"
  homepage "https://github.com/Venafi/vcert"
  url "https://github.com/Venafi/vcert/archive/refs/tags/v5.1.1.tar.gz"
  license "Apache-2.0"
  head "https://github.com/venafi/vcert.git", tag: "v5.1.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Venafi/vcert/releases/download/v5.1.1/vcert_v5.1.1_darwin.zip"
      sha256 "a2cf4e620b53ad2f37ee9f9e0a6da6b72b508fc49c34a2d539c44eb0faef29f5"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.1.1/vcert_v5.1.1_darwin_arm.zip"
      sha256 "0901b548ccda7422742ea2a401c8101fa47ed6e61fce98d8cb6c0355345ba99e"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.1.1/vcert_v5.1.1_linux.zip"
      sha256 "0627826ee0a18993e62fcd3ebdbd5906655a08cc8ae2a0b38b97d145368aff1a"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.1.1/vcert_v5.1.1_linux86.zip"
      sha256 "11bf2d86632d8ef417ebc7159b40bff3999ddaee94667af9598b29d0eff85610"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.1.1/vcert_v5.1.1_linux_arm.zip"
      sha256 "6f1106223d8a7a68c4289f1dea461cb3a512e1c69867403daeb0fd2e605000b3"
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
