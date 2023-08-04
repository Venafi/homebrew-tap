class Vcert < Formula
  desc "Venafi Machine Identity Services Golang CLI and SDK"
  homepage "https://github.com/Venafi/vcert"
  url "https://github.com/Venafi/vcert/archive/refs/tags/v5.0.1.tar.gz"
  license "Apache-2.0"
  head "https://github.com/venafi/vcert.git", tag: "v5.0.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Venafi/vcert/releases/download/v5.0.1/vcert_v5.0.1_darwin.zip"
      sha256 "5962520a6f803d1a5504a689b8b32ad9ecf4ab2de35758ac1fdd3015a71b33d3"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.0.1/vcert_v5.0.1_darwin_arm.zip"
      sha256 "c85bc3e5bbaad0b8ffdc62fa66e63f35dcbecfbf3546c142fa630a068ca55457"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.0.1/vcert_v5.0.1_linux.zip"
      sha256 "ff63139835c73810a1603022ee393c3d54047d1845259452244c0c7d76407968"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.0.1/vcert_v5.0.1_linux86.zip"
      sha256 "8711b882db7d20695df1496ebf4af4809fdbd27cd546890e06128fe052d0ae90"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.0.1/vcert_v5.0.1_linux_arm.zip"
      sha256 "d93ae4184129ac38d7287d829666e515e878eb4680e901139740e1d602f2028e"
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
