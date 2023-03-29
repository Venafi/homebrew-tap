class Sigscan < Formula
    desc "Inspect container images and other artifacts for signatures and code signing certificates"
    homepage "https://github.com/venafi/sigscan"
    url "https://github.com/venafi/sigscan/archive/refs/tags/v0.1.0.tar.gz"
    sha256 "626e2b78b327cffd3d43407c981e0ba961fc21d2f7dfb1d202a9eb175dfe5880"
    license "Apache-2.0"
    head "https://github.com/venafi/sigscan.git", branch: "main"
  
    bottle do
      root_url "https://github.com/venafi/homebrew-venafi/releases/download/sigscan-0.1.0"
      sha256 cellar: :any_skip_relocation, monterey:     "72247ad301045a7ae873c9ac1b06e967ae9ef7bae03d52345997ca228821ad7c"
      sha256 cellar: :any_skip_relocation, x86_64_linux: "eae0d69009f562a3f42ed2b777442df34a1de642f21325514114a173e678d6ee"
    end
  
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
      # TODO
    end
  end