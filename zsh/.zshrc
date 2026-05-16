# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Путь к Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Тема оформления (Минималистичная и быстрая)
ZSH_THEME="powerlevel10k/powerlevel10k"

# Автоматическое обновление без лишних вопросов
zstyle ':omz:update' mode auto

# Список плагинов
# git - работа с репозиториями
# sudo - нажми Esc дважды, чтобы добавить sudo к команде
# zsh-autosuggestions - подсказки серого цвета
# zsh-syntax-highlighting - раскрашивает правильные/неправильные команды
plugins=(
    git 
    sudo 
    zsh-autosuggestions 
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# --- Личные Алиасы (Удобство) ---
alias ls='ls --color=auto'
alias ll='ls -lah'
alias grep='grep --color=auto'
alias update='sudo pacman -Syu'
alias c='clear'

# Чтобы Ghostty корректно отображал символы
export LANG=en_US.UTF-8

# Интеграция с Ghostty (если установлена через AUR)
if [ -n "$GHOSTTY_RESOURCES_DIR" ]; then
    source "$GHOSTTY_RESOURCES_DIR/shell-integration/zsh/ghostty-integration"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
alias tg='(Telegram &) && exit'
alias lb='(librewolf &) && exit'
alias nt='(nautilus &) && exit'
alias ds='(vesktop --enable-features=UseOzonePlatform --ozone-platform=wayland --disable-gpu-sandbox &) && exit'

export XDG_DATA_DIRS="/home/$USER/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:$XDG_DATA_DIRS"
alias spoty="flatpak run com.spotify.Client --ozone-platform=wayland --disable-gpu >/dev/null 2>&1 & logout"
