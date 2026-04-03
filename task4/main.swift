import Foundation

func isValidGrade(_ grade: Double) -> Bool {
    return grade >= 0 && grade <= 10
}

func calculateRating(grades: [Double], ctScore: Double) -> Double {
    let average = grades.reduce(0, +) / Double(grades.count)
    let diplomaScore = average * 10
    return diplomaScore + ctScore
}

print("Введите количество предметов:")
let countStr = readLine() ?? "0"
let count = Int(countStr) ?? 0

var grades: [Double] = []
for i in 1...count {
    print("Оценка по предмету \(i):")
    let gradeStr = readLine() ?? "0"
    guard let grade = Double(gradeStr) else {
    print("Ошибка: '\(gradeStr)' не является числом")
    exit(1)
    }

    if isValidGrade(grade) {
    grades.append(grade)
    } else {
    print("Ошибка: оценка \(grade) недопустима. Введите от 0 до 10")
    exit(1)
    }
}

print("Введите результат ЦТ:")
let ctStr = readLine() ?? "0"
let ctScore = Double(ctStr) ?? 0

let rating = calculateRating(grades: grades, ctScore: ctScore)
print("Рейтинг: \(rating)")

if rating >= 364 {
    print("Поздравляем! Вы приняты в университет.")
} else {
    print("К сожалению, ваш балл ниже проходного (364).")
}
