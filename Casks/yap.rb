cask "yap" do
  version "0.6.0"
  sha256 "eba1381d7a3857784d6014f7ceba3acc3d3d70bc3d4e8c188da6ca5999510899"

  url "https://github.com/latent-variable/Yap/releases/download/v#{version}/Yap-#{version}.dmg"
  name "Yap"
  desc "Talk to AI, faster — local voice + dictation for your Mac and AI agents"
  homepage "https://github.com/latent-variable/Yap"

  app "Yap.app"

  # Yap is open-source and ad-hoc signed (not notarized). Clear the download
  # quarantine after install so macOS doesn't say "damaged" — no manual step.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Yap.app"],
                   sudo: false
  end

  caveats <<~EOS
    On first run, grant Accessibility (to dictate / read selected text) and
    Microphone (for dictation), or use Clipboard mode for reading (no
    permission needed). First launch downloads the Kokoro voice model
    (~340 MB). Everything runs locally — no cloud, no account, no tracking.
  EOS
end
