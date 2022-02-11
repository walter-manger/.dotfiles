#!/usr/bin/env bash

#echo placeholder

# check to see if there are any changes in personal
check_personal() {
    for d in ~/repos/walter-manger/* ; do
        if [ -d "$d/.git" ]
        then
            changes=$(git -C $d status -s | wc -l 2>&1 | tr -d ' ')
            if [ "$changes" -ne "0" ]
            then
                is_remote=$(git ls-remote --heads --exit-code origin "$(git symbolic-ref --short HEAD)")
                if [[ -z $is_remote ]]
                then
                    echo "$d has $changes changes, but does not exist remotely"
                else
                    echo "$d has $changes changes and exists remotely"
                fi
            fi

        fi
    done
}

check_ssh_config() {
    awk '/IdentityFile/ {print $2}' ~/.ssh/config | while IFS= read -r line; do echo "checking $line"; if [ -f "$line" ]; then echo "file $line exists!"; fi; done
}

#check_personal;
check_ssh_config;
