#!/bin/bash

# Функция для анализа и сортировки содержимого директории
analyze_and_sort() {
    local dir=$1

    echo "Анализ содержимого директории: $dir"
    echo "---------------------------------"

    # Используем команду `du` для получения размеров и сортируем по убыванию
    du -sh "$dir"/* 2>/dev/null | sort -hr | while read -r size path; do
        if [ -d "$path" ]; then
            echo "Директория: $(basename "$path") - Размер: $size"
        elif [ -f "$path" ]; then
            echo "Файл: $(basename "$path") - Размер: $size"
        else
            echo "Другой тип: $(basename "$path") - Размер: $size"
        fi
    done

    echo "---------------------------------"
}

# Запуск анализа для текущей директории
analyze_and_sort "."