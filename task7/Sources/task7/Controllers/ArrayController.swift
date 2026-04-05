//
//   ArrayController.swift
//  task7
//
//  Created by Anastasiya Yarmolik on 5.04.26.
//
class ArrayController {
    private let model = ArrayModel()
    private let view  = ArrayView()

    func run() {
        var running = true
        while running {
            view.showMenu()
            let choice = view.getInput(prompt: "Выберите пункт:")
            switch choice {
            case "1":
                view.showArray(model.immutableArray, title: "Неизменяемый массив")
                view.showArray(model.mutableArray,   title: "Изменяемый массив")

            case "2":
                view.showCount(model.immutableArray.count, label: "неизменяемый")
                view.showCount(model.mutableArray.count,   label: "изменяемый")

            case "3":
                model.mutableArray = []
                let input = view.getInput(prompt: "Введите числа через пробел:")
                model.mutableArray = input.split(separator: " ").compactMap { Int($0) }
                view.showArray(model.mutableArray, title: "Введённый массив")

            case "4":
                let input = view.getInput(prompt: "Введите число:")
                if let num = Int(input) {
                    model.mutableArray.append(num)
                    view.showArray(model.mutableArray, title: "После добавления")
                } else {
                    view.showMessage("Ошибка: введите целое число")
                }

            case "5":
                let idxInput = view.getInput(prompt: "Введите индекс:")
                let numInput = view.getInput(prompt: "Введите число:")
                if let idx = Int(idxInput), let num = Int(numInput),
                   idx >= 0, idx <= model.mutableArray.count {
                    model.mutableArray.insert(num, at: idx)
                    view.showArray(model.mutableArray, title: "После вставки")
                } else {
                    view.showMessage("Ошибка: неверный индекс или число")
                }

            case "6":
                if model.mutableArray.isEmpty {
                    view.showMessage("Массив уже пуст")
                } else {
                    model.mutableArray.removeLast()
                    view.showArray(model.mutableArray, title: "После удаления последнего")
                }

            case "7":
                let input = view.getInput(prompt: "Введите индекс:")
                if let idx = Int(input), idx >= 0, idx < model.mutableArray.count {
                    model.mutableArray.remove(at: idx)
                    view.showArray(model.mutableArray, title: "После удаления по индексу")
                } else {
                    view.showMessage("Ошибка: неверный индекс")
                }

            case "8":
                model.mutableArray.removeAll()
                view.showMessage("Массив очищен")

            case "9":
                let splitter = ArraySplitter(numbers: model.mutableArray.isEmpty ? nil : model.mutableArray)
                let result = splitter.splitEvenOdd()
                view.showArray(result.even, title: "Чётные")
                view.showArray(result.odd,  title: "Нечётные")

            case "0":
                running = false
                view.showMessage("Выход")

            default:
                view.showMessage("Неверный пункт меню")
            }
        }
    }
}

