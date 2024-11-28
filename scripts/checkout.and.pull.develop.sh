#!/bin/bash
cd "$(dirname "$0")"

DIR=$(pwd)

cd ../

PARENT=$(pwd)

func_commands() {
    # git reset --hard
    git checkout main
    git pull
}

for a in $(find . -type d -name ".git"); do
    echo "checking ${a}"
    cd ${a}/..
    func_commands &
done
