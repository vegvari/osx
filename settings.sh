################################################################################
# Dock
################################################################################

echo "Dock - reset to default";
defaults delete com.apple.dock;

echo "Dock - killing process";
killall Dock;
sleep 3;

echo "Dock - turn on autohide";
defaults write com.apple.dock autohide -int 1;

echo "Dock - turn off autohide animation";
defaults write com.apple.dock autohide-time-modifier -int 0;

echo "Dock - turn off autohide delay";
defaults write com.apple.dock autohide-delay -int 0;

echo "Dock - turn off app launch animation";
defaults write com.apple.dock launchanim -int 0;

echo "Dock - turn off magnification";
defaults write com.apple.dock magnification -int 0;

echo "Dock - set minimize effect to scale";
defaults write com.apple.dock mineffect -string scale;

echo "Dock - minimize windows to application";
defaults write com.apple.dock minimize-to-application -int 1;

echo "Dock - place the dock to the right side";
defaults write com.apple.dock orientation -string right;

echo "Dock - set hot corner top left to app expose";
defaults write com.apple.dock wvous-tl-corner -int 3;
defaults write com.apple.dock wvous-tl-modifier -int 0;

echo "Dock - turn off expose animation";
defaults write com.apple.dock expose-animation-duration -int 0;

echo "Dock - killing process";
killall Dock;
sleep 3;

echo "Dock - remove apps";
defaults delete com.apple.dock persistent-apps;

echo "Dock - remove other stuff";
defaults delete com.apple.dock persistent-others;

echo "Dock - killing process";
killall Dock;
sleep 3;

echo "Dock - done";