# Add Homebrew to the path on Apple Silicon Macs
if [ -d "/opt/homebrew" ]; then
    export HOMEBREW_PREFIX="/opt/homebrew";
    export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
    export HOMEBREW_REPOSITORY="/opt/homebrew";
    export HOMEBREW_SHELLENV_PREFIX="/opt/homebrew";
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
    export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
    export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
fi

# https://flutter.dev/docs/get-started/install/macos
export PATH="${HOME}/src/flutter/bin:${PATH}"

# https://stackoverflow.com/questions/26483370
# https://www.stkent.com/2017/08/10/update-your-path-for-the-new-android-emulator-location.html
export ANDROID_SDK_ROOT="${HOME}/Library/Android/sdk"
export ANDROID_HOME="$ANDROID_SDK_ROOT"
export PATH="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:${PATH}"
export PATH="$ANDROID_SDK_ROOT/platform-tools:${PATH}"
export PATH="$ANDROID_SDK_ROOT/tools:${PATH}"
export PATH="$ANDROID_SDK_ROOT/emulator:${PATH}"

# Add ~/.local/bin to the path – this is where pipx puts executables.
# https://pipxproject.github.io/pipx/installation/
export PATH="${HOME}/.local/bin:${PATH}"

# Add ~/bin to the path, ahead of all others.
export PATH="${HOME}/bin:${PATH}"
