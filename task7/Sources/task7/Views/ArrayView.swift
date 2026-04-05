//
//  ArrayView.swift
//  task7
//
//  Created by Anastasiya Yarmolik on 5.04.26.
//

class ArrayView {
    func showArray(_ array: [Int], title: String) {
        print("\n\(title): \(array)")
    }

    func showCount(_ count: Int, label: String) {
        print("Количество элементов (\(label)): \(count)")
    }

    func showMessage(_ message: String) {
        print(message)
    }

    func showMenu() {
        print("""
        \n=== МЕНЮ ===
        1. Вывести массив
        2. Подсчёт элементов
        3. Ввести элементы с консоли
        4. Добавить элемент
        5. Вставить элемент по индексу
        6. Удалить последний элемент
        7. Удалить элемент по индексу
        8. Удалить все элементы
        9. Разделить на чётные/нечётные (ArraySplitter)
        0. Выход
        """)
    }

    func getInput(prompt: String) -> String {
        print(prompt, terminator: " ")
        return readLine() ?? ""
    }
}
