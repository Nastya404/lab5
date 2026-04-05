// Sources/DictionaryLib/DictionaryOperations.swift
import Foundation

// MARK: - Словарь 1: ПО → Год выпуска

public class SoftwareYearDictionary {
    
    public var data: [String: Int] = [:]
    
    public init() {}
    
    public init(initialData: [String: Int]) {
        self.data = initialData
    }
    
    public func inputFromConsole(_ line: String) {
        let tokens = line.split(separator: " ")
        var i = 0
        while i + 1 < tokens.count {
            let name = String(tokens[i])
            if let year = Int(tokens[i + 1]) {
                data[name] = year
            }
            i += 2
        }
    }
    
    // Количество элементов
    public func count() -> Int { data.count }
    
    // Значение по ключу
    public func getValue(for key: String) -> Int? { data[key] }
    
    // Все элементы
    public func printAll() {
        for (k, v) in data { print("\(k): \(v)") }
    }
    
    // Добавить элемент
    public func add(name: String, year: Int) { data[name] = year }
    
    // Изменить элемент
    public func modify(name: String, newYear: Int) { data[name] = newYear }
    
    // Сортировка по ключу (имени)
    public func sortedByKey() -> [(String, Int)] {
        data.sorted { $0.key < $1.key }
    }
    
    // Сортировка по значению (году)
    public func sortedByValue() -> [(String, Int)] {
        data.sorted { $0.value < $1.value }
    }
    
    // Удалить один элемент
    public func remove(name: String) { data.removeValue(forKey: name) }
    
    // Удалить все
    public func removeAll() { data.removeAll() }
}

// MARK: - Словарь 2: ПО → Лицензия

public class SoftwareLicenseDictionary {
    
    // Заранее заполненный словарь
    public var data: [String: String] = [
        "Linux":   "GPL",
        "VS Code": "MIT",
        "Windows": "Proprietary",
        "Xcode":   "Proprietary",
        "Firefox": "MPL"
    ]
    
    public init() {}
    
    public func count() -> Int { data.count }
    
    public func getValue(for key: String) -> String? { data[key] }
    
    public func printAll() {
        for (k, v) in data { print("\(k): \(v)") }
    }
    
    public func add(name: String, license: String) { data[name] = license }
    
    public func modify(name: String, newLicense: String) { data[name] = newLicense }
    
    public func sortedByKey() -> [(String, String)] {
        data.sorted { $0.key < $1.key }
    }
    
    public func sortedByValue() -> [(String, String)] {
        data.sorted { $0.value < $1.value }
    }
    
    public func remove(name: String) { data.removeValue(forKey: name) }
    
    public func removeAll() { data.removeAll() }
}
