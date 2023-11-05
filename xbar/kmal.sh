#!/usr/bin/env bash

# <xbar.title>Keeping Macos Awake List</xbar.title>
# <xbar.version>1.0</xbar.version>
# <xbar.author>A. Kumar</xbar.author>
# <xbar.author.github>ioExpander</xbar.author.github>
# <xbar.desc>List apps preventing macos to sleep and save power</xbar.desc>
# <xbar.image></xbar.image>
# <xbar.dependencies>bash</xbar.dependencies>

apps=$(pmset -g assertions | grep -i "NoDisplaySleepAssertion" | cut -d "(" -f2 | cut -d ")" -f1 | sort -u)

#pmset -g assertions |grep ".*pid.*PreventUserIdleSystemSleep" | cut -d "(" -f2 | cut -d ")" -f1 | sort | uniq

function set_icon () {
    words=($apps)
    if [ "${#words[@]}" == 0 ]; then
        echo "🌙 ok"
    else
        echo "🌙 ⚠️"
    fi
}

function get_app_details () {
    app_name="$1"
    app_details=($(pmset -g assertions |grep ".*pid.*(${app_name})" | cut -d ":" -f5- | awk '{$1=$1};1' | tr \  _))
}

function print_detail () {
    detail=$1
    stripped_detail=$(echo "$detail" | cut -d "\"" -f2)
    config_str="color=#909090"
    echo "--${stripped_detail} | ${config_str}"
}

function main () {
    set_icon
    echo '---'
    local IFS=$'\n'
    local lines=($apps)
    for app in "${lines[@]}"
    do
        echo "${app}"
    #    print_man_desc "$app"
        get_app_details "$app"
        for detail in "${app_details[@]}"
        do
            print_detail "$detail"
        done
    #    print_kill "$app"
    done
}

main
