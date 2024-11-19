import os
from humanize import naturalsize  # Убедитесь, что установлен модуль `humanize`

def analyze_directory(directory="."):
    """Анализирует содержимое директории и выводит размер файлов и папок."""
    items = [
        (entry.name, os.path.getsize(entry.path) if entry.is_file() else 0, "Файл" if entry.is_file() else "Директория")
        for entry in os.scandir(directory)
    ]

    # Сортируем по убыванию размера
    items.sort(key=lambda x: x[1], reverse=True)

    print(f"Анализ содержимого директории: {directory}")
    print("---------------------------------")
    for name, size, item_type in items:
        print(f"{item_type}: {name} - Размер: {naturalsize(size, binary=True)}")
    print("---------------------------------")

if __name__ == "__main__":
    analyze_directory()
