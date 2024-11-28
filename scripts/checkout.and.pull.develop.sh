#!/bin/bash
cd "$(dirname "$0")"

DIR=$(pwd)

cd ../

PARENT=$(pwd)

func_commands() {
    # git reset --hard
    git checkout develop
    git pull
}

DIRECTORIES="applications common services"

for d in $DIRECTORIES; do
    echo "processing ${d}"
    for a in ${PARENT}/${d}/*; do
        echo "checking ${a}"
        if [ -d "$a" ]; then
            echo "processing ${a}"
            cd ${a}
            func_commands &
        fi
    done
done
