cask "yap" do
  version "0.9.4"
  sha256 "51871a9fe040d90437da890ac8d361cdb1e40a957b28824a6a3f900bcb72c1bc"

  url "https://github.com/latent-variable/Yap/releases/download/v#{version}/Yap-#{version}.dmg"
  name "Yap"
  desc "Local text-to-speech and dictation"
  homepage "https://github.com/latent-variable/Yap"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Yap.app"

  # Yap is not notarized. Clear the download
  # quarantine after install so macOS doesn't say "damaged" — no manual step.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-cr", "{{appdir}}/Yap.app"],
        sudo: false
  end

  caveats <<~EOS
    On first run, grant Accessibility (to dictate / read selected text) and
    Microphone (for dictation), or use Clipboard mode for reading (no
    permission needed). First launch downloads the Kokoro voice model
    (~340 MB). Everything runs locally — no cloud, no account, no tracking.
  EOS
end
