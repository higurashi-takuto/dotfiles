# 「前の入力ソースを選択」を ⌘ + ␣
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 60 '{
  enabled = 1;
  value = {
    parameters = (32, 49, 1048576);
    type = "standard";
  };
}'

# 「Spotlight　検索を表示」を ⌥ + ␣
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 '{
  enabled = 0;
  value = {
    parameters = (32, 49, 524288);
    type = "standard";
  };
}'

# 時計を秒まで表示する
defaults write com.apple.menuextra.clock ShowSeconds -bool true

killall SystemUIServer

# 隠しフォルダを表示
defaults write com.apple.finder AppleShowAllFiles -bool true

# デスクトップに外部ディスクを非表示
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false

# デスクトップにCD、DVD、および iPod を非表示
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# 新規ウインドウはホームディレクトリで開く
defaults write com.apple.finder NewWindowTarget -string "PfHm"

# すべてのファイル名拡張子を表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# 拡張子を変更する前に警告を非表示
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# ゴミ箱を空にする前に警告を非表示
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# ネットワークディスクに .DS_Store を作成しない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# 外部ディスクに .DS_Store を作成しない
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# フォルダを常に先頭に表示する
defaults write com.apple.finder _FXSortFoldersFirst -bool true

killall Finder

# Dock を自動的に非表示
defaults write com.apple.dock autohide -bool true

# アプリの提案と最近使用したアプリを Dock に非表示
defaults write com.apple.dock show-recents -bool false

killall Dock

# バッテリーの割合を表示
defaults write com.apple.controlcenter BatteryShowPercentage -bool true

killall ControlCenter

# スクリーンショットでサムネイルを非表示
defaults write com.apple.screencapture show-thumbnail -bool false
