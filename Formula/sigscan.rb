class Sigscan < Formula
  desc "Inspect container images and other artifacts for signatures"
  homepage "https://github.com/venafi/sigscan"
  url "https://github.com/venafi/sigscan/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "626e2b78b327cffd3d43407c981e0ba961fc21d2f7dfb1d202a9eb175dfe5880"
  license "Apache-2.0"
  head "https://github.com/venafi/sigscan.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
    # Generate and then install man pages
    system "go", "run", "./hack/generate-manual"
    man1.install Pathname.glob("man/*.1")
    # Use the binary to generate shell completions
    generate_completions_from_executable(bin/"sigscan", "completion")
  end

  test do
    system "false"
  end
end
