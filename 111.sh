#!/bin/bash

analyze_and_sort() {
    local dir=$1

    echo "Анализ содержимого директории: $dir"
    echo "---------------------------------"

    du -hl|sort -hr
    echo "---------------------------------"
}

analyze_and_sort "."