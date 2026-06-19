cask "murmur" do
  version "0.2.0"
  sha256 "809f6cf3779d8bbe8010b96be1e7083b2c6d316d3581803a72503e0897d68c3b"

  url "https://github.com/latent-variable/Murmur/releases/download/v#{version}/Murmur-#{version}.dmg"
  name "Murmur"
  desc "Local-first text-to-speech — highlight text, hear it in a Kokoro voice"
  homepage "https://github.com/latent-variable/Murmur"

  app "Murmur.app"

  # Murmur is open-source and ad-hoc signed (not notarized). Clear the
  # download quarantine after install so macOS doesn't say "damaged" —
  # no manual step, no flag needed.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Murmur.app"],
                   sudo: false
  end

  caveats <<~EOS
    On first run, grant Accessibility (to read selected text) or use
    Clipboard mode (no permission needed). First launch downloads the
    Kokoro voice model (~340 MB). Everything runs locally.
  EOS
end
