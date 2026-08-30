cask "yap" do
  version "0.9.0"
  sha256 "63968911fc76110e5fbbf89c3a7b0bb9fe633fa057e43298bddab7bd857ca1e8"

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
