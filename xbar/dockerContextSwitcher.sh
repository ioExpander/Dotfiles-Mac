#!/usr/bin/env bash

# <xbar.title>Switch your docker context</xbar.title>
# <xbar.version>1.0</xbar.version>
# <xbar.author>A. Kumar</xbar.author>
# <xbar.author.github>ioExpander</xbar.author.github>
# <xbar.desc>shows the current active context and enables quick docker context switch</xbar.desc>
# <xbar.image></xbar.image>
# <xbar.dependencies>bash,docker</xbar.dependencies>
# uses : https://github.com/actuallymentor/battery

currentContext=($(/Users/aditye/.rd/bin/docker context ls --format '{{if .Current}} {{.Name}} {{end}}'))

function set_icon () {
    if [ "$currentContext" = "default" ]; then
        echo "🐳🏠"
    else
        echo "🐳🌎"
    fi
}


function main () {
    set_icon
    echo '---'
    echo "Current Context in use : ${currentContext}"
    echo '🏠 Enable "default" context | shell=/Users/aditye/.rd/bin/docker param1="context" param2="use" param3="default" refresh=true'
    echo '🌎 Enable "DevDeb12" context | shell=/Users/aditye/.rd/bin/docker param1="context" param2="use" param3="DevDeb12" refresh=true'
}

main