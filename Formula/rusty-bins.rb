class RustyBin < Formula
  if Hardware::CPU.type == :arm
    url "https://github.com/ahd-playgrounds/rusty-bins/releases/download/v0.2.2/rusty-bins-aarch64-apple-darwin.tar.xz"
    sha256 "7295629bed1e0c23ace9a61fc48477926776a28a91d295ef7dd4d66fbac5dd7a"
  else
    url "https://github.com/ahd-playgrounds/rusty-bins/releases/download/v0.2.2/rusty-bins-x86_64-apple-darwin.tar.xz"
    sha256 "2b1d94dabcb1caefde106d7ab7685169bfae76c184b7560b7a52b9dc3776bcb2"
  end
  version "0.2.2"

  def install
    bin.install "rusty-bins"

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
