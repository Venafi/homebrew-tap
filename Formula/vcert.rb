class Vcert < Formula
  desc "Venafi Machine Identity Services Golang CLI and SDK"
  homepage "https://github.com/Venafi/vcert"
  url "https://github.com/Venafi/vcert/archive/refs/tags/v5.5.0.tar.gz"
  license "Apache-2.0"
  head "https://github.com/venafi/vcert.git", tag: "v5.5.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Venafi/vcert/releases/download/v5.5.0/vcert_v5.5.0_darwin.zip"
      sha256 "1f5d7f43c3a2b6631addc8dc3db9dcdfccc2179425b87f70deeb1c0862f459a6"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.5.0/vcert_v5.5.0_darwin_arm.zip"
      sha256 "e45310ed00e5867de82c6b609acd99c637bc39911040c1200e28a13ef63f5e8e"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.5.0/vcert_v5.5.0_linux.zip"
      sha256 "6d19e15cf19dff77def676a9d3fc5e3cb1c3ef5d47b9951463549b9a4a8763e5"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.5.0/vcert_v5.5.0_linux86.zip"
      sha256 "df4062ca782f73baf0fd02a042aa5c6cdcc6c91cc99f6b4983b5be899ac7f365"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.5.0/vcert_v5.5.0_linux_arm.zip"
      sha256 "fc0de26834035a55d7b9c6632dee7c113320fb8a400b4e63b5beb1e9b5054dfd"
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
