# config.nu
#
# Installed by:
# version = "0.102.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

$env.config.buffer_editor = "/opt/homebrew/bin/nvim"

#################
# Custom commands
#################

export def filter-time-csv [
    in_file: string,   # Input CSV file
    out_file: string,  # Output CSV file
] {
    # Process the CSV: Open, remove columns, save
    open $in_file 
    | reject User Email Client Task Billable Tags
    | to csv 
    | save $out_file

    print $"Processed CSV saved to ($out_file)"
}
