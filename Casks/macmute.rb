cask "macmute" do
  version "1.2.7,1"
  sha256 "602db87be264dd51f0d116290b7be003bd8f93b379737b6017d31fc33c57d709"

  url "https://github.com/TuanBT/MacMute/releases/download/v#{version.csv.first}/MacMute-#{version.csv.first}-#{version.csv.second}.dmg"
  name "MacMute"
  desc "Menu bar app that adds a global microphone mute hotkey"
  homepage "https://tuanbt.github.io/MacMute/"

  livecheck do
    url :url
    regex(/^MacMute[._-]v?(\d+(?:\.\d+)+)[._-](\d+)\.dmg$/i)
    strategy :github_latest do |json, regex|
      json["assets"]&.map do |asset|
        match = asset["name"]&.match(regex)
        next if match.blank?

        "#{match[1]},#{match[2]}"
      end
    end
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "MacMute.app"

  # MacMute is ad-hoc signed and not notarized, so Gatekeeper blocks it on
  # first launch. Upstream's install instructions remove the quarantine
  # attribute; do the same here.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/MacMute.app"]
  end

  uninstall quit: "com.tuanbt.macmute"

  zap trash: "~/Library/Preferences/com.tuanbt.macmute.plist"

  caveats <<~EOS
    To let MacMute press the Teams mute button, grant it access in:
      System Settings > Privacy & Security > Accessibility

    MacMute's signature changes with every build, so after each upgrade
    remove the old MacMute entry there and grant access again. Without
    this permission MacMute still works, but falls back to muting the
    default input device through CoreAudio.
  EOS
end
