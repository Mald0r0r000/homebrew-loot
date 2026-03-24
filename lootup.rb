class Lootup < Formula
  desc "Network Transfer Companion for LOOT — SFTP, SSH automation, project templates"
  homepage "https://github.com/Mald0r0r000/LOOTup"
  license "MIT"

  # Stable Release via Git Tag
  url "https://github.com/Mald0r0r000/LOOTup.git",
      tag:      "v0.1.4",
      revision: "42985508a482094cdb3f6017eea0bc7a027dfa40"

  head "https://github.com/Mald0r0r000/LOOTup.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/lootup"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lootup --version")
  end
end
