export PATH=$HOME/bin:$PATH
# Use powerline
USE_POWERLINE="false"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

PATH="$HOME/.config/emacs/bin:/home/sc0p3/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/sc0p3/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/sc0p3/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/sc0p3/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/sc0p3/perl5"; export PERL_MM_OPT;

export GTK_THEME=Adwaita:dark

# Aliases
alias ll="exa -la"
alias tt="exa --tree"
alias v="nvim"
alias n="nvim"
alias esp=". $HOME/Documents/gitthings/esp-idf/export.sh"
