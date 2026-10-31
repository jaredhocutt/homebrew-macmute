# homebrew-macmute

Homebrew tap for [MacMute](https://tuanbt.github.io/MacMute/), a menu bar app that adds a global microphone mute hotkey to macOS.

Requires an Apple Silicon Mac running macOS 13 (Ventura) or later.

## How do I install MacMute?

```sh
brew install --cask jaredhocutt/macmute/macmute
```

Installing by the fully qualified name trusts only this cask. To install by the short name instead, tap and trust it first:

```sh
brew tap jaredhocutt/macmute
brew trust --cask jaredhocutt/macmute/macmute
brew install --cask macmute
```

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "jaredhocutt/macmute"
cask "jaredhocutt/macmute/macmute"
```

MacMute is not notarized by Apple, so macOS blocks it the first time it opens after each install or upgrade. Open it once, then click **Open Anyway** in System Settings > Privacy & Security.

## Uninstall

```sh
brew uninstall --cask macmute
```

Add `--zap` to also remove MacMute's preferences.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
