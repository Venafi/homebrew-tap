class Vcert < Formula
  desc "Venafi Machine Identity Services Golang CLI and SDK"
  homepage "https://github.com/Venafi/vcert"
  url "https://github.com/Venafi/vcert/archive/refs/tags/v5.3.0.tar.gz"
  license "Apache-2.0"
  head "https://github.com/venafi/vcert.git", tag: "v5.3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Venafi/vcert/releases/download/v5.3.0/vcert_v5.3.0_darwin.zip"
      sha256 "6e8c97f74dc4dd4d09805ebe2dea6665d2c26e4b7a6955df56106591cf56fe96"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.3.0/vcert_v5.3.0_darwin_arm.zip"
      sha256 "33edb471001c71fdbf1c93775e2a598e18440ccad8de5d21aaa980ddc51e7d11"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.3.0/vcert_v5.3.0_linux.zip"
      sha256 "40ce5c8668c505fb2d5bead548a1acb2c0aa4f18ffa8842ce66deea7bb0ad6e1"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.3.0/vcert_v5.3.0_linux86.zip"
      sha256 "64b9a2e92f344c5050ea5fd3fd3b70709a507c1a8ccd0fde27f74cf7ebc3af1b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.3.0/vcert_v5.3.0_linux_arm.zip"
      sha256 "0212b759a8f8ae0e45492bebdd0b86aa91e44f1e72621e453734278bbccd4e65"
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
