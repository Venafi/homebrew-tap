class Venctl < Formula
  desc "Venafi CLI tool can carry out cluster management tasks from the command-line"
  homepage "https://docs.venafi.cloud/vaas/venctl/c-venctl-overview"
  url "https://docs.venafi.cloud/vaas/venctl/c-venctl-releases"
  version "1.3.1"
  on_macos do
    if Hardware::CPU.intel?
      url "https://dl.venafi.cloud/venctl/#{version}/venctl-darwin-amd64.zip"
      sha256 "eaf728c5824b9c317e033fd082a99222b9dcfba858d9b2af0867816273a9d926"
    end
    if Hardware::CPU.arm?
      url "https://dl.venafi.cloud/venctl/#{version}/venctl-darwin-arm64.zip"
      sha256 "9513f6d19afe697a8f04a46bdf0c65b1a34cda15cbcfd53e4b147914ce6f768f"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://dl.venafi.cloud/venctl/#{version}/venctl-linux-amd64.zip"
      sha256 "2743d0ac27a515177c4351a8be70870922332058c2e443868a958ffc865b3cd4"
    end
    if Hardware::CPU.arm?
      url "https://dl.venafi.cloud/venctl/#{version}/venctl-linux-arm64.zip"
      sha256 "c1379600daf9e5f1df0e7dbbb7e3b39e7672844fac98dd72f319259bc2f74596"
    end
  end

  def install
    bin.install "venctl"
  end

  test do
    # Validate install
    system "#{bin}/venctl", "version"
  end
end
