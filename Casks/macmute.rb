cask "macmute" do
  version "1.2.8,1"
  sha256 "bb382decef7d9cca7678a9c8776a283d7c99a45ff64b4689dc3aeccf29ed19f4"

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

  uninstall quit: "com.tuanbt.macmute"

  zap trash: "~/Library/Preferences/com.tuanbt.macmute.plist"

  caveats do
    unsigned_accessibility
    <<~EOS
      MacMute is not notarized, so macOS blocks it the first time it opens
      after each install or upgrade. To allow it, open it once, then click
      Open Anyway in System Settings > Privacy & Security.

      Without Accessibility access MacMute still works, but mutes the default
      input device through CoreAudio instead of pressing the Teams mute button.
    EOS
  end
end
