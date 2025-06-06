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

killall SystemUIServer
