# ------- SYNTAX ------- #
# -- Aliases --
# alias NAME COMMAND

# -- Abbreviations -- 
# abbr -add NAME COMMAND
# abbr --erase NAME
# abbr --list

# -- Vi / Emacs Mode --
# fish_default_key_bindings
# fish_vi_key_bindings

# if status is-interactive
# end

# ====================== #
# ------- Config ------- #
# ====================== #
# Starts Xorg
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

# Environment Variables
set -gx PAGER less
set -gx EDITOR nvim	
set -gx SUDO_EDITOR nvim	
set -gx TERMINAL kitty
set -gx LUTRIS_SKIP_INIT 1
set -gx MOZ_USE_XINPUT2 1 # Touchpad Support

# Paths
fish_add_path $HOME/.local/bin


# --- Abbreviations ---
abbr --add oo "nvim ~/docs/vaults/personal/obsidian.md"

# - Chezmoi Abbreviations - 
abbr --add cz chezmoi
abbr --add czapp chezmoi apply
abbr --add cze chezmoi edit
abbr --add czadd chezmoi add
abbr --add czc chezmoi cd

# - TMUX Abbr - #
abbr --add t tmux                                   # [T]mux
abbr --add ta tmux a                                # [T]mux [A]ttach
abbr --add tat tmux a -t                            # [T]mux [A]ttach [T]o
abbr --add tk tmux kill-session -t                  # [T]mux [K]ill Session
abbr --add tl tmux ls                               # [T]mux [L]s

alias eza='eza -l -g --icons --sort extension'
alias ls='eza'

# ====================== #
# ------ Bindings ------ #
# ====================== #
bind \cs "source ~/.config/fish/config.fish"


# ====================== #
# ------ Plugins ------- #
# ====================== #

# -- FZF for Fish --
if type -q fzf_key_bindings # if plugin is installed

    # Default bindings but bind Search Directory to Ctrl+F
    fzf_configure_bindings --directory=\cf --git_log=\cl --processes=\cp --variables=\cv
    set fzf_preview_dir_cmd eza --all --color=always

end
