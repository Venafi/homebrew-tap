class Vcert < Formula
  desc "Venafi Machine Identity Services Golang CLI and SDK"
  homepage "https://github.com/Venafi/vcert"
  url "https://github.com/Venafi/vcert/archive/refs/tags/v5.13.9.tar.gz"
  sha256 "8e69e18970eee5ab9fa17ceba14b15e6752e2ecadecc65a4d924f07d6c941332"
  license "Apache-2.0"
  head "https://github.com/venafi/vcert.git", tag: "v5.13.9"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Venafi/vcert/releases/download/v5.13.9/vcert_v5.13.9_darwin.zip"
      sha256 "5dccdd715d953fe6fdf11a1e87183d730938348b85395b0faa5f86012d178730"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.13.9/vcert_v5.13.9_darwin_arm.zip"
      sha256 "ef4bd38d323446d4ce908cbd0c005ec267916bc4c8b6e7b1043e839e9cca55fb"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.13.9/vcert_v5.13.9_linux.zip"
      sha256 "16c774d9c44da57042cb2e7ff506765634e102354af3a61e8648414091686b25"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/Venafi/vcert/releases/download/v5.13.9/vcert_v5.13.9_linux86.zip"
      sha256 "c34ecda8e14871c625f327ebe8635cc5221def12431b0e95190ff675e55ee48d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vcert/releases/download/v5.13.9/vcert_v5.13.9_linux_arm.zip"
      sha256 "a6e2106a40f28378434819856510ceae2c526f368046143200c48149785dbf12"
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
