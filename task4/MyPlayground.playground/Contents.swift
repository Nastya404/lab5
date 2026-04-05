import Foundation

func isValidGrade(_ grade: Double) -> Bool {
    return grade >= 0 && grade <= 10
}

func calculateRating(grades: [Double], ctScore: Double) -> Double {
    let average = grades.reduce(0, +) / Double(grades.count)
    let diplomaScore = average * 10
    return diplomaScore + ctScore
}

// Тест 1 — принят
let grades1 = [8.0, 9.0, 10.0, 9.0, 8.0]
let rating1 = calculateRating(grades: grades1, ctScore: 280.0)
print("Тест 1 | Рейтинг: \(rating1)")
print(rating1 >= 364 ? "[PASS] Принят" : "[FAIL]")

// Тест 2 — не принят
let grades2 = [5.0, 6.0, 5.0, 6.0, 5.0]
let rating2 = calculateRating(grades: grades2, ctScore: 150.0)
print("Тест 2 | Рейтинг: \(rating2)")
print(rating2 < 364 ? "[PASS] Не принят" : "[FAIL]")

// Тест 3 — граничный случай
let grades3 = [8.0, 8.0, 8.0, 8.0, 8.0]
let rating3 = calculateRating(grades: grades3, ctScore: 284.0)
print("Тест 3 | Рейтинг: \(rating3)")
print(rating3 >= 364 ? "[PASS] Принят" : "[FAIL]")

// Тест 4 — отрицательная оценка
print("Тест 4 | Оценка -1.0: \(!isValidGrade(-1.0) ? "[PASS] Отклонена" : "[FAIL]")")

// Тест 5 — оценка больше 10
print("Тест 5 | Оценка 11.0: \(!isValidGrade(11.0) ? "[PASS] Отклонена" : "[FAIL]")")
