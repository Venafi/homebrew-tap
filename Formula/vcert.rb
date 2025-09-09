class Vcert < Formula
  desc "Venafi Machine Identity Services Golang CLI and SDK"
  homepage "https://github.com/Venafi/vcert"
  url "https://github.com/Venafi/vcert/archive/refs/tags/v5.12.0.tar.gz"
  license "Apache-2.0"
  head "https://github.com/venafi/vcert.git", tag: "v5.12.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Venafi/vcert/releases/download/v5.12.0/vcert_v5.12.0_darwin.zip"
      sha256 "5e53716c737ae8cbbf7919edf67816734a26119212b6959ebd426db9b5f74948"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.12.0/vcert_v5.12.0_darwin_arm.zip"
      sha256 "f38f5f54e225adaadd88ee51551745109cb7ee80eaf0c843a044d5db11f0e5d4"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.12.0/vcert_v5.12.0_linux.zip"
      sha256 "0537faeebf6c6b34b71169be60c9c026bee301567f8ebb5119dce1f96839ff49"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.12.0/vcert_v5.12.0_linux86.zip"
      sha256 "cfdc34628828e0ac909afc20af6c4f29673462ad3e3b7ff841c824a9d93cc17b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.12.0/vcert_v5.12.0_linux_arm.zip"
      sha256 "ea8ababfdde4aa015d0bc5218206a27bba231eb1f4bfb86616e85352380409d5"
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
