cask "yap" do
  version "0.8.1"
  sha256 "03c15e5cbdacc8fa04ca03db1d9433dc416ee5bdd36dcd4582a221162159c9c6"

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
