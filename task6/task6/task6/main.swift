import DictionaryLib

let yearDict    = SoftwareYearDictionary()
let licenseDict = SoftwareLicenseDictionary()

func showMenu() {
    print("""
    \nМЕНЮ
    1.  Ввести данные в словарь (год выпуска)
    2.  Количество элементов (год)
    3.  Найти по ключу (год)
    4.  Вывести все (год)
    5.  Добавить элемент (год)
    6.  Изменить элемент (год)
    7.  Сортировать по ключу (год)
    8.  Сортировать по значению (год)
    9.  Удалить один элемент (год)
    10. Удалить все (год)
    11. Вывести все лицензии
    12. Найти лицензию по имени ПО
    0.  Выход
    Выбор:
    """, terminator: "")
}

mainLoop: while true {
    showMenu()
    guard let choice = readLine() else { break }
    
    switch choice {
    case "1":
        print("Введите пары 'Имя Год' через пробел:")
        if let line = readLine() { yearDict.inputFromConsole(line) }
        
    case "2":
        print("Элементов: \(yearDict.count())")
        
    case "3":
        print("Имя ПО:")
        if let key = readLine(), let val = yearDict.getValue(for: key) {
            print("\(key): \(val)")
        } else { print("Не найдено") }
        
    case "4":
        yearDict.printAll()
        
    case "5":
        print("Имя ПО:")
        let name = readLine() ?? ""
        print("Год:")
        if let y = readLine(), let year = Int(y) {
            yearDict.add(name: name, year: year)
        }
        
    case "6":
        print("Имя ПО для изменения:")
        let name = readLine() ?? ""
        print("Новый год:")
        if let y = readLine(), let year = Int(y) {
            yearDict.modify(name: name, newYear: year)
        }
        
    case "7":
        yearDict.sortedByKey().forEach { print("\($0.0): \($0.1)") }
        
    case "8":
        yearDict.sortedByValue().forEach { print("\($0.0): \($0.1)") }
        
    case "9":
        print("Имя для удаления:")
        if let name = readLine() { yearDict.remove(name: name) }
        
    case "10":
        yearDict.removeAll()
        print("Словарь очищен")
        
    case "11":
        licenseDict.printAll()
        
    case "12":
        print("Имя ПО:")
        if let key = readLine(), let val = licenseDict.getValue(for: key) {
            print("\(key): \(val)")
        } else { print("Не найдено") }
        
    case "0":
        print("Выход")
        break mainLoop

    default:
        print("Неверный выбор")
    }
}
