if status is-interactive
    # Commands to run in interactive sessions can go here

    # initialize starship prompt
    starship init fish | source

    # Enable vim key bindings
    fish_vi_key_bindings

    # Tools setup
    zoxide init fish | source
end
