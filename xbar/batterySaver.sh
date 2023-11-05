#!/usr/bin/env bash

# <xbar.title>Save your macbook battery</xbar.title>
# <xbar.version>1.0</xbar.version>
# <xbar.author>A. Kumar</xbar.author>
# <xbar.author.github>ioExpander</xbar.author.github>
# <xbar.desc>Prevent charging above 80% using the battery CLI</xbar.desc>
# <xbar.image></xbar.image>
# <xbar.dependencies>bash,battery</xbar.dependencies>
# uses : https://github.com/actuallymentor/battery

# Map on new lines
IFS=$'
'
battStatus=($(/usr/local/bin/battery status))
unset IFS

function set_icon () {
    if [ "${battStatus[1]}" ]; then
        echo "🔋🔌"
    else
        echo "🔴🔌"
    fi
}


function main () {
    set_icon
    echo '---'
    echo ${battStatus[0]}
    echo ${battStatus[1]}
    echo '🟢 Enable battery charge limit | shell=/usr/local/bin/battery param1="maintain" param2="80" refresh=true'
    echo '🔴 Disable battery charge limit | shell=/usr/local/bin/battery param1="maintain" param2="stop" refresh=true'
}

main