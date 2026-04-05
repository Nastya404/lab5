//
//  ArraySplitter.swift
//  task7
//
//  Created by Anastasiya Yarmolik on 5.04.26.
//

class ArraySplitter {
    var numbers: [Int]?

    init(numbers: [Int]?) {
        self.numbers = numbers
    }

    func splitEvenOdd() -> (even: [Int], odd: [Int]) {
        guard let nums = numbers else {
            print("Массив пустой (nil)")
            return ([], [])
        }
        let even = nums.filter { $0 % 2 == 0 }
        let odd  = nums.filter { $0 % 2 != 0 }
        return (even, odd)
    }
}
