class Vcert < Formula
  desc "Venafi Machine Identity Services Golang CLI and SDK"
  homepage "https://github.com/Venafi/vcert"
  url "https://github.com/Venafi/vcert/archive/refs/tags/v5.8.0.tar.gz"
  license "Apache-2.0"
  head "https://github.com/venafi/vcert.git", tag: "v5.8.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Venafi/vcert/releases/download/v5.8.0/vcert_v5.8.0_darwin.zip"
      sha256 "e863e2b7e9778fb313dce8ae77254fe8724121e68035e7302c73eec2a8d4689c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.8.0/vcert_v5.8.0_darwin_arm.zip"
      sha256 "c23cbba2c959397798d264710cb6d485c13c1588f85545a197372c6073463aee"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.8.0/vcert_v5.8.0_linux.zip"
      sha256 "ae4f790c31bc458f865ef7aa49f47d1189ee9ec0d3f1e56bf9b69a97f82d5a83"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.8.0/vcert_v5.8.0_linux86.zip"
      sha256 "dca0af0684e44fd3279b117e5b35280fb320f43c50d2e6f90fd16925702aaa78"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.8.0/vcert_v5.8.0_linux_arm.zip"
      sha256 "5604c031dedbfe604a250c0a7f466ce4d23979281ad82e3d5f47ea9b43f6ae8c"
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
