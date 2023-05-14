. "$HOME/.cargo/env" # Adds $HOME/.cargo/bin to path

# Default programs
export TERMINAL="alacritty"
export EDITOR="nvim"
export BROWSER="firefox"
export MAILCLIENT="betterbird"

# NICs
export WLAN=$(ls /sys/class/net | grep -m 1 wl)
export ETH=$(ls /sys/class/net | grep -m 1 et)

# Path for snap
export SNAPPATH="${HOME}/pictures/scrot"

# Colors for sudo prompt 
# [[ setab backgrounds: 23 for green, 24 for blue ]].
export SUDO_PROMPT="$(tput bold setab 24 setaf 0)[sudo]$(tput sgr0) $(tput setaf 6)password for$(tput sgr0) $(tput setaf 5)%p$(tput sgr0): "

# Socket for ssh-agent
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"

# Patch xdg-open failure cross-opening links in browser
# (from applications in session started from ly)
# [[ May cause other issues with applications using mpris
#    such as cmus ]]
#export DBUS_SESSION_BUS_ADDRESS="autolaunch:"

# Firefox pixel perfect scrolling
export MOZ_USE_XINPUT2=1

# Update PATH
export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/.local/share/solana/install/active_release/bin"
