class Licenzio < Formula
  desc "CLI tool for licensing your projects"
  homepage "https://github.com/khalidbelk/licenzio"
  license "MIT"

  pkg_version = "0.2.2"
  base_url = "https://github.com/khalidbelk/licenzio/releases/download/v#{pkg_version}/licenzio"

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    depends_on arch: :x86_64
  end

  if OS.mac?
    url "#{base_url}-macos"
    sha256 "6e1f102bb6a519c033524e935da1d6c68c34908392a9f670132e4ffd375d05a7"
  elsif OS.linux?
    url "#{base_url}-linux"
    sha256 "61756767cbd487c695a67db4fafff25b0e21a3b214d57fa36a3e24e311cf6067"
  end

  def install
    bin.install Dir["licenzio-*"].first => "licenzio"
  end

  test do
    system bin/"licenzio", "--version"
  end
end
