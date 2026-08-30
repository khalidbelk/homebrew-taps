class Licenzio < Formula
  desc "CLI tool for licensing your projects"
  homepage "https://github.com/khalidbelk/licenzio"
  license "MIT"

  pkg_version = "0.2.1"
  base_url = "https://github.com/khalidbelk/licenzio/releases/download/v#{pkg_version}/licenzio"

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    depends_on arch: :x86_64
  end

  if OS.mac?
    url "#{base_url}-macos"
    sha256 "dd16b4bf8d8cba25a9d1cbdcec12cd11c40f64b8e8ed7a231c07839cef07be36"
  elsif OS.linux?
    url "#{base_url}-linux"
    sha256 "f61990db33f26ce5bfe8ac8425fcb55f2aa6438cc993f66b579e5fda8f44d6b6"
  end

  def install
    bin.install Dir["licenzio-*"].first => "licenzio"
  end

  test do
    system bin/"licenzio", "--version"
  end
end
