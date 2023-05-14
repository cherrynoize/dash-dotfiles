if status is-interactive
  # Commands to run in interactive sessions can go here

  # Colorscheme
  set -l teal 94e2d5
  set -l flamingo f2cdcd
  set -l mauve cba6f7
  set -l pink f5c2e7
  set -l red f38ba8
  set -l peach fab387
  set -l green a6e3a1
  set -l yellow f9e2af
  set -l blue 89b4fa
  set -l gray 1f1d2e
  set -l black 191724

  # Startup commands
# ~/.config/fish/colors.sh & # Source colors
  starship init fish | . & # Source starship
	thefuck --alias | . & # Source thefuck

  # Source plugins
  # Useful plugins: archlinux bang-bang cd colorman sudope vcs
  if test -d "$HOME/.local/share/omf/pkg/colorman/"
	  source ~/.local/share/omf/pkg/colorman/init.fish
  end

  # Greeting message
  function fish_greeting
      set LAUNCH_TIME $(date +%T)
      set _time_msg $(set_color yellow; echo $LAUNCH_TIME; set_color normal)

#     echo Welcome back, $USER!
      echo "              おかえりなさい, $USER!"
      echo "The time is $_time_msg""and you're currently on $hostname"
  end

  # Title format
  function fish_title
      # `prompt_pwd` shortens the title. This helps prevent tabs from becoming very wide.
      echo $argv[1] \((pwd)\)
  end

  # Completion pager colors
  set -g fish_pager_color_progress $gray
  set -g fish_pager_color_prefix $mauve
  set -g fish_pager_color_completion $peach
  set -g fish_pager_color_description $gray

  # Make su launch fish
  function su
     command su --shell=/usr/bin/fish $argv
  end

  # Change multiple parent directories with ...+
  function multicd
      echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
  end
  abbr --add dotdot --regex '^\.\.+$' --function multicd

  # Shell abbreviations 
  abbr fishrc '$EDITOR ~/.config/fish/config.fish'
  abbr -- - 'cd $HOME'
  abbr -- -- 'cd $HOME'
  abbr hw 'echo hello, world!'
  abbr im 'sudo -iu' # Run interactive shell as user
  abbr runas 'sudo -u' # Run command as user
  abbr sudo 'sudo -v; sudo' # Refresh sudo privileges
  abbr l 'ls'
  abbr e 'echo'
  abbr d 'dirs'
  abbr cls 'clear'
  abbr h 'history'
  abbr xcopy 'xclip -selection clipboard'
  abbr sshon 'sudo systemctl start sshd.service'
  abbr sshoff 'sudo systemctl stop sshd.service'
  abbr wloff "rfkill block $WLAN"
  abbr wlon "rfkill unblock $WLAN"
  abbr untar 'tar -zxvf'
  abbr killdio 'kill -9' # Kill ala DIO
  abbr killvlc 'kill -9 (pgrep vlc)' # Kill zombie vlc
  abbr priv 'fish --private' # Fish incognito mode
  abbr genpass 'openssl rand -base64 12' # Random 12-char passwd
  abbr sha 'shasum -a 256' # Test sha256
  abbr con 'ping -c 5 8.8.8.8' # Check network
  abbr myip 'curl ifconfig.co' # Print public IP
  abbr nic 'ip link show' # List NICs
  abbr set-powersave 'cpupower frequency-set -g powersave'
  abbr set-schedutil 'cpupower frequency-set -g schedutil'
  abbr set-ondemand 'cpupower frequency-set -g ondemand'
  abbr show-gov 'cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor' # Print scaling governor for each cpu
  abbr gpg-sym-encrypt "gpg -c --s2k-cipher-algo AES256 --s2k-digest-algo SHA512 --s2k-count 65536"

  # Bash !! emulation
  function last_history_item
      echo $history[1]
  end
  abbr -a !! --position anywhere --function last_history_item

  # Program shortcuts
  abbr vimconfig '$EDITOR ~/.vimrc'
  abbr xobfu 'zzxorcopy' # Simple xor obfuscate.
  abbr ff 'firefox'
  abbr fni 'firefox-nightly'
  abbr fde 'firefox-developer-edition'
  abbr chrome 'google-chrome-stable'
  abbr ytmp3 'youtube-dl --extract-audio --audio-format mp3' # YT to mp3 download

  # Git --auto-skip death when I'm coding 
  abbr add 'git add .'
  abbr branch 'git branch -M'
  abbr --set-cursor cm 'git commit -m "%"'
  abbr --set-cursor cma 'git commit -a'
  abbr --set-cursor pcm 'git commit -a -m "%";git push -u origin'
  abbr checkout 'git checkout'
  abbr cherry-pick 'git cherry-pick'
  abbr gitdiff 'git diff'
  abbr fetch 'git fetch'
  abbr gitlog 'git log'
  abbr gitmerge 'git merge'
  abbr push 'git push -u origin'
  abbr pushmain 'git push -u origin main'
  abbr force 'git push --force-with-lease -u'
  abbr pull 'git pull'
  abbr origin 'git remote add origin'
  abbr seturl 'git remote set-url origin'
  abbr stash 'git stash'
  abbr gitst 'git status'
  abbr prompt 'fish_git_prompt'
  abbr gid 'git config --local user.name "cherrynoize"; git config --local user.email "cherrynoize9987@outlook.com"; ssh-add ~/.ssh/cherrynoize_ed25519'

  # Git prompt
  set -g __fish_git_prompt_show_informative_status 1
  set -g __fish_git_prompt_showupstream informative
  set -g __fish_git_prompt_showdirtystate yes
  set -g __fish_git_prompt_char_stateseparator ' '
  set -g __fish_git_prompt_char_cleanstate '✔'
  set -g __fish_git_prompt_char_dirtystate '✚'
  set -g __fish_git_prompt_char_invalidstate '✖'
  set -g __fish_git_prompt_char_stagedstate '●'
  set -g __fish_git_prompt_char_stashstate '⚑'
  set -g __fish_git_prompt_char_untrackedfiles '?'
  set -g __fish_git_prompt_char_upstream_ahead ''
  set -g __fish_git_prompt_char_upstream_behind ''
  set -g __fish_git_prompt_char_upstream_diverged 'ﱟ'
  set -g __fish_git_prompt_char_upstream_equal ''
  set -g __fish_git_prompt_char_upstream_prefix ''''

  set -g man_blink -o $teal
  set -g man_bold -o $pink
  set -g man_standout -b $gray
  set -g man_underline -u $blue

  function wa
      set -f APPID "5YX76V-P3UEAP6L3U" # Get one at https://products.wolframalpha.com/api/
      echo $argv | string escape --style=url | read question_string
      set -f url "https://api.wolframalpha.com/v1/result?appid="$APPID"&i="$question_string
      curl -s $url
  end
end
