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

export def filter-time-csv-overwrite [
  file: string # Input/Output CSV file
] {
    open $file
    | reject User Email Client Task Billable Tags
    | to csv
    | save --force $file

    print $"Processed CSV saved to ($file)"
}

export def prepare-time-csvs [
  file: string # Input CSV file
] {

  # date format
  let date = date now | format date "%Y-%m" 

  # Customs that want a timesheet
  let customers = [DORDA "STEINER's"]

  let data = open $file

  # prepare timesheets
  $customers | each {|e|
     $data 
      | where Project == $e
      | reject User Email Tags Weekday
      | to csv
      | save --force $"($date)_($e).csv"
  }

  # TODO: prepare a copy&paste table for Anwert containing all the customers and sums


  # prepare timesheet for WiBS 
  # TODO: get columns for WiBS, remove Tag "Arbeit", group by Tag and sum the durations
  # TODO: prepare a copy&paste table for all WiBS Categories (ignoring WiBS Workshops)
  $data
  | where Project == 'WiBS'
  | update Tags {|row|
    split row ',' 
    | filter {|x| $x != 'Arbeit'}
    | str join ','
  }
  | group-by Tags
  | each {|group|
    {
      tag: $group.key,
      duration: ($group.values | get Duration | math sum) # FIXME: this does not yet work. I want to calculate the sum of all the durations for each tag here.
    }
  }
  | reject User Email Tags Weekday
}
