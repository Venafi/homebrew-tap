class Vcert < Formula
  desc "Venafi Machine Identity Services Golang CLI and SDK"
  homepage "https://github.com/Venafi/vcert"
  url "https://github.com/Venafi/vcert/archive/refs/tags/v5.14.0.tar.gz"
  sha256 "8e69e18970eee5ab9fa17ceba14b15e6752e2ecadecc65a4d924f07d6c941332"
  license "Apache-2.0"
  head "https://github.com/venafi/vcert.git", tag: "v5.14.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Venafi/vcert/releases/download/v5.14.0/vcert_v5.14.0_darwin.zip"
      sha256 "6ef301101b65506dbeccdf3f6e1782723a154abed2ad662d49263da9385a93b3"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.14.0/vcert_v5.14.0_darwin_arm.zip"
      sha256 "75f1323314b966a27741b4302f72be2bf19f6912c3d7d58532f4549ac278632c"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.14.0/vcert_v5.14.0_linux.zip"
      sha256 "e23d69580300974e9eebdb5ae92f80411f4277d19d9ff7cdbe753547919690cc"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.14.0/vcert_v5.14.0_linux86.zip"
      sha256 "191745f72cd225915890fd95f417991ab72812d887716c8ce88c3857b9813909"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.14.0/vcert_v5.14.0_linux_arm.zip"
      sha256 "47e7af086d9358e80815b6ece6525d16840bcc12c4f377144371f054d1e59af1"
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
