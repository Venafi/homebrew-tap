class Vcert < Formula
  desc "Venafi Machine Identity Services Golang CLI and SDK"
  homepage "https://github.com/Venafi/vcert"
  url "https://github.com/Venafi/vcert/archive/refs/tags/v5.8.1.tar.gz"
  license "Apache-2.0"
  head "https://github.com/venafi/vcert.git", tag: "v5.8.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Venafi/vcert/releases/download/v5.8.1/vcert_v5.8.1_darwin.zip"
      sha256 "a842e435cd91ee8a0af7dca0ffa6c1c6a7d1ac998fabdf858ba0f21fb4d17c87"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.8.1/vcert_v5.8.1_darwin_arm.zip"
      sha256 "ad2a76da52cbe2fe9cdd0f7ee6d9a3b59e286d711479cbb4dcefea5f207223d5"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.8.1/vcert_v5.8.1_linux.zip"
      sha256 "4e634e4c05ce0b3bd6eb1787645a8f309a01b1d6a061ef573f67f3a7a57acd65"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.8.1/vcert_v5.8.1_linux86.zip"
      sha256 "425e3f2ee58a65fdfa6e6b0bfce89e0bbbebc9b0690794f3e6b3376e7993301e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.8.1/vcert_v5.8.1_linux_arm.zip"
      sha256 "932b93e4d116f2c7de0e3bf5683d0e72ec71cb31ae8b336db1c0aadb61e16f0a"
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
