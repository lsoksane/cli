source (status dirname)/fzf-funcs.fish
# ctrl+space
bind -k nul fzf-file-widget
# ctrl+down
bind \e\[1\;5B fzf-history-widget

if test -d $LOCALDIR/config
    source (status dirname)/appearance.fish
end

if set -q KITTY_INSTALLATION_DIR
    set --global KITTY_SHELL_INTEGRATION enabled
    source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
    set --prepend fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d"
end

if set -q CONDADIR
    conda-init
end
