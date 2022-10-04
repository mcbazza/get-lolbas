# Name   : get-lolbas.ps1
# Desc   : A Powershell script to turn the LOLBAS API into something that can be queried from the CLI.
# Usage  : .\get-lolbas.ps1 [search-string]
# Author : Bazza
# Twitter: @mcbazza
# Date   : 2022/10/04
#
# Version:
#   0.1    Bazza      2022/10/04   Initial release. PoC. Searches against 'Name' field in the JSON data. No error-handling.
#

# Where the LOLBAS JSON API lives
$lolbasuri = 'https://lolbas-project.github.io/api/lolbas.json'

# The searchstring
$lolbasArg = $Args[0]

# Tell people what this is, and who did it.
write-host -foregroundcolor Cyan "get-lolbas.ps1 by @mcbazza"

# Remind the person what they're searching for.
write-host -foregroundcolor Green -nonewline "Searching LOLBAS for: "
write-host -foregroundcolor Yellow $lolbasArg
write-host ""

# Poll the API, returning the data as JSON
$lolbasData = Invoke-WebRequest -Uri $lolbasuri

# Convert from JSON to custom objects
$data = ConvertFrom-Json $lolbasData.content

# Turn the input searchstring into a wildcard
$searchStr = "*$lolbasArg*"

# Parse out the 'Name's that match against our wildcarded searchstring
$lolbasResults = $data | where-object { $_.Name -like $searchStr}

# Because counter. Obviously
$counter=0

# Loop through our results
foreach ($lolbas in $lolbasResults.Commands) {
    # Display LOLBAS description
    write-host "Desc   : $($lolbas.Description)"

    # Display the example LOLBAS command
    write-host -nonewline "Command: "
    write-host -ForegroundColor White $($lolbas.Command)
    write-host ""

    # Increment counter
    $counter+=1
}

# How many results did we find?
if ($counter -eq 0) {
    write-host "No LOLBAS findings for: '$lolbasArg'"
} else {
    # Nothing to see here. Move along. Move along.
}
