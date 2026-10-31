# homebrew-macmute

Homebrew tap for [MacMute](https://tuanbt.github.io/MacMute/), a free,
open-source menu bar app that gives macOS the global microphone mute hotkey it
never shipped with. It mutes the audio device itself, so a single shortcut
covers every app at once.

This is an unoffical tap and is not endorsed by the MacMute project. It was
created for personal use but available for others to use if they would like.

## Install

```sh
brew install --cask jaredhocutt/macmute/macmute
```

Or tap first:

```sh
brew tap jaredhocutt/macmute
brew install --cask macmute
```

Requires an Apple Silicon Mac running macOS 13 (Ventura) or later.

## Uninstall

```sh
brew uninstall --cask macmute
# also remove preferences:
brew uninstall --cask --zap macmute
```
