
# Starship
# starship init fish | source

# Supress and replace the fish greeting
set fish_greeting
function fish_greeting
  # fortune
end

# Changes to the prompt
set -g theme_display_user yes
set -g theme_color_scheme dark

# Aliases
# Config files abreviations
abbr cfnv "nvim ~/.config/nvim/init.vim"
abbr cff "nvim ~/.config/fish/config.fish"
abbr cft "nvim ~/.config/tmux/.tmux.conf"
abbr cfz "nvim ~/.zshrc"
abbr cfa "nvim ~/.config/alacritty/alacritty.yml"
abbr cfk "nvim ~/.config/kitty/kitty.conf"

# Editor abbreviation
alias n "nvim"

# System abbreviation
abbr s "sudo"
abbr sa "sudo apt"
alias ls "exa -la"
alias cat "batcat"


