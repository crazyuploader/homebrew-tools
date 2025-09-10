class RcloneExporter < Formula
  desc "Prometheus exporter for rclone"
  homepage "https://github.com/crazyuploader/rclone_exporter"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/crazyuploader/homebrew-tools/releases/download/rclone_exporter-86.64"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "646fa32804228e4d2733b7fd7fa66b3714fa9bf6b0587ae7bc6a91bfd5bff199"
    sha256 cellar: :any_skip_relocation, ventura:       "df06a194c9d4da8f1b980776cad5de6969ddff775d970a63a8438d7871d070f5"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "8a2599f36fa150a21425dd4b14eef05e0829b675f4d4c1f7dbd133efc5812a68"
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/crazyuploader/rclone_exporter/releases/download/v1.2/rclone_exporter_Darwin_arm64.tar.gz"
      sha256 "ae5fc4a74bc86ad3bfafb55b16c3a5f1a3159c16bb1e97e48b820bde581d82ca"
    else
      url "https://github.com/crazyuploader/rclone_exporter/releases/download/v1.2/rclone_exporter_Darwin_x86_64.tar.gz"
      sha256 "951d9fc80a831e6a5804fa7288d4371f41505609d54abfa8490b9a499ced3998"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/crazyuploader/rclone_exporter/releases/download/v1.2/rclone_exporter_Linux_arm64.tar.gz"
      sha256 "7e1766a3076631d2b356c83dee5124f7bfbbea05c1797293c19460082863c193"
    else
      url "https://github.com/crazyuploader/rclone_exporter/releases/download/v1.2/rclone_exporter_Linux_x86_64.tar.gz"
      sha256 "3ba6243373626624508dfff5f9258e4e268cea449ee53c90b2d9341622f63f2c"
    end
  end

  def install
    bin.install "rclone_exporter"
  end

  test do
    system bin/"rclone_exporter", "--help"
  end
end
