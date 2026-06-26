cask "yap" do
  version "0.5.2"
  sha256 "ee8b6e46ce1e59f786134da0fee94717b5f1a7640bada5a42d5f7fc00cf1847a"

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
