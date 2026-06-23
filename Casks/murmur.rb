cask "murmur" do
  version "0.4.0"
  sha256 "43b6419ea833ca0082a44901fa22f8626588782a62925e9e74a42e25f46d4fe1"

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
