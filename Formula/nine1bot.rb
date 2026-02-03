class Nine1bot < Formula
  desc "Nine1Bot - AI Assistant"
  homepage "https://github.com/contrueCT/nine1bot"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/contrueCT/nine1bot/releases/download/v1.0.0/nine1bot-darwin-arm64-v1.0.0.tar.gz"
      sha256 "b7e6fccfcd519a3308363d1662c606824f9c3f799c0da12b2ee789e53cc0e0d8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/contrueCT/nine1bot/releases/download/v1.0.0/nine1bot-linux-arm64-v1.0.0.tar.gz"
      sha256 "e5a5eee6049b2815bca607f3129400912c9dda9e06abf3c12152a56e82dc7fab"
    end
    on_intel do
      url "https://github.com/contrueCT/nine1bot/releases/download/v1.0.0/nine1bot-linux-x64-v1.0.0.tar.gz"
      sha256 "c0734f257fe617a5d01e087a62813517e0e40210faeecc7098bcedaba2be7287"
    end
  end

  def install
    # Homebrew 解压后会自动进入顶层目录，所以直接引用文件即可
    bin.install "nine1bot"
    prefix.install "bin" => "libexec/bin"
    prefix.install "skills"
    prefix.install "web"
    prefix.install "scripts"
  end

  def caveats
    <<~EOS
      Nine1Bot 已安装成功！

      启动服务:
        nine1bot start

      配置向导:
        nine1bot setup

      更多帮助:
        nine1bot --help
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nine1bot --version")
  end
end
