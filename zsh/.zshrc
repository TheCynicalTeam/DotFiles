ZSH_CUSTOM="$HOME/.config/zsh/"
ZSH_ALIASES="$ZSH_CUSTOM/aliases"
ZSH_PLUGINS="$ZSH_CUSTOM/plugins"
ZSH_THEMES="$ZSH_CUSTOM/themes"

fm6000 -f ~/.config/fm6000/art

#Add aliases into zsh
if [ -d "$ZSH_ALIASES" ]; then
    for file in "$ZSH_ALIASES"/*; do
        [[ -f "$file" && -r "$file" ]] && source "$file"
    done
fi

#Add plugins into zsh
if [ -d "$ZSH_PLUGINS" ]; then
    for file in "$ZSH_PLUGINS"/*; do
        [[ -f "$file" && -r "$file" ]] && source "$file"
    done
fi

#Add themes into zsh
if [ -d "$ZSH_THEMES" ]; then
    for file in "$ZSH_THEMES"/*; do
        [[ -f "$file" && -r "$file" ]] && source "$file"
    done
fi

eval "$(starship init zsh)"
