# ====================
# macOS の設定
# ====================
setup_macos_preferences() {
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
    enabled = 1;
    value = {
      parameters = (32, 49, 524288);
      type = "standard";
    };
  }'

  defaults write NSGlobalDomain AppleShowAllExtensions -bool true # すべてのファイル名拡張子を表示
  defaults write com.apple.menuextra.clock ShowSeconds -bool true # 時計を秒まで表示する
  defaults write com.apple.finder AppleShowAllFiles -bool true # 隠しフォルダを表示
  defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false # デスクトップに外部ディスクを非表示
  defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false # デスクトップにCD、DVD、および iPod を非表示
  defaults write com.apple.finder NewWindowTarget -string "PfHm" # 新規ウインドウはホームディレクトリで開く
  defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false # 拡張子を変更する前に警告を非表示
  defaults write com.apple.finder WarnOnEmptyTrash -bool false # ゴミ箱を空にする前に警告を非表示
  defaults write com.apple.finder _FXSortFoldersFirst -bool true # フォルダを常に先頭に表示する
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true # ネットワークディスクに .DS_Store を作成しない
  defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true # 外部ディスクに .DS_Store を作成しない
  defaults write com.apple.dock autohide -bool true # Dock を自動的に非表示
  defaults write com.apple.dock show-recents -bool false # アプリの提案と最近使用したアプリを Dock に非表示
  defaults write com.apple.controlcenter BatteryShowPercentage -bool true # バッテリーの割合を表示
  defaults write com.apple.screencapture show-thumbnail -bool false # スクリーンショットでサムネイルを非表示
  defaults write com.apple.PowerChime ChimeOnNoHardware -bool true # 電源接続時の音を有効化

  # 関連サービスの再起動
  killall SystemUIServer
  killall Finder
  killall Dock
  killall ControlCenter
  killall PowerChime
}

# ====================
# シンボリックリンクの作成
# ====================
create_symlinks() {
  mkdir -p ~/.config/git
  ln -s ~/dotfiles/gitignore ~/.config/git/ignore
  ln -s ~/dotfiles/gitconfig ~/.gitconfig
  ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
  ln -s ~/dotfiles/Brewfile ~/.Brewfile
  ln -fs ~/dotfiles/zshrc ~/.zshrc
}

# ====================
# 実行
# ====================
main() {
  setup_macos_preferences
  create_symlinks

  echo "macOS の設定とシンボリックリンクの作成が完了しました。"
}

main
