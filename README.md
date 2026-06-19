# latent-variable/homebrew-tap

Homebrew tap for [Murmur](https://github.com/latent-variable/Murmur) — local-first text-to-speech for macOS.

```bash
brew install --cask --no-quarantine latent-variable/tap/murmur
```

`--no-quarantine` skips macOS Gatekeeper (Murmur is open-source and ad-hoc signed, not notarized). Drop it if you prefer to clear quarantine yourself later with `xattr -cr /Applications/Murmur.app`.

## Update

```bash
brew update && brew upgrade --cask murmur
```
