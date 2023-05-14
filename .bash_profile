#
# ~/.bash_profile
#

# Source some stuff because it makes sense.

# Sources.
declare -a sources=(".profile"
                    ".bashrc"
                    )

# For each file in the list
for f in "${sources[@]}"; do
  # if file exists then source it.
  [[ -f "$f" ]] && . "$f"
done

#
# Just keep doing all of your gangsta .bash_profile stuff
# down here.
#
