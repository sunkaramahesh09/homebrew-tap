class Airbridge < Formula
  desc "Native AirDrop ↔ Quick Share bridge for macOS and Android"
  homepage "https://github.com/sunkaramahesh09/airbridge"
  version "2.0.0"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/sunkaramahesh09/airbridge/releases/download/v2.0.0/airbridge-macos-arm64.tar.gz"
      sha256 "a512e3c67cb4176a9da68c3ef3a3464c1130de782c559684b5dd4cb7eeaec7af"
    end
    on_intel do
      url "https://github.com/sunkaramahesh09/airbridge/releases/download/v2.0.0/airbridge-macos-x86_64.tar.gz"
      sha256 "d8b28b7f9b58351c614c986c77c9e5ec08b61cc532700de327bf9411ff4836a0"
    end
  end

  depends_on :macos

  def install
    bin.install "airbridge"
  end

  service do
    run [opt_bin/"airbridge"]
    keep_alive true
    log_path var/"log/airbridge.log"
    error_log_path var/"log/airbridge.err"
  end

  def caveats
    <<~EOS
      Start AirBridge now and at login:
        brew services start airbridge

      Or run it directly:
        airbridge
    EOS
  end

  test do
    system "#{bin}/airbridge", "--version"
  end
end
