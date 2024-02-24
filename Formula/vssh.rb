class Vssh < Formula
  desc "Venafi Machine Identity Services CLI for SSH access"
  homepage "https://github.com/Venafi/vssh-cli"
  url "https://github.com/Venafi/vssh-cli/archive/refs/tags/v1.0.2023091815.tar.gz"
  license "Apache-2.0"
  head "https://github.com/venafi/vssh-cli.git", tag: "v1.0.2023091815"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Venafi/vssh-cli/releases/download/v1.0.2023091815/vssh_darwin_amd64.zip"
      sha256 "b8f315a71f8fe493bb434a18129954dd8b3af903422c3687272f6a17040ee897"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Venafi/vssh-cli/releases/download/v1.0.2023091815/vssh_darwin_arm64.zip"
      sha256 "061bd8ddb198dc0a0668dfc74a09ea6193c5b5541b22f4c1000fa4a994190bc6"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Venafi/vssh-cli/releases/download/v1.0.2023091815/vssh_linux_amd64.zip"
      sha256 "2a5f38c10e2debcde9d27f92a336734f2f5c741c66aa4f39b993066d6ec46d4c"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/Venafi/vssh-cli/releases/download/v1.0.2023091815/vssh_linux_386.zip"
      sha256 "28c2207621c4b2073d17bcb70f243a3e5c41d70c1aadc3dad20e5aa707c89715"
    end
  end

  def install
    bin.install "vssh"
  end

  test do
    # Validate install
    system "#{bin}/vssh", "version"
  end
end
