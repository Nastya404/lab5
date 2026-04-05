import Testing
@testable import task7

// MARK: - ArraySplitter Tests

@Suite("ArraySplitter Tests")
struct ArraySplitterTests {

    @Test("Разделение обычного массива")
    func testSplitEvenOdd_normalArray() {
        let splitter = ArraySplitter(numbers: [1, 2, 3, 4, 5, 6])
        let result = splitter.splitEvenOdd()
        #expect(result.even == [2, 4, 6])
        #expect(result.odd  == [1, 3, 5])
    }

    @Test("nil массив возвращает пустые массивы")
    func testSplitEvenOdd_nilArray() {
        let splitter = ArraySplitter(numbers: nil)
        let result = splitter.splitEvenOdd()
        #expect(result.even == [])
        #expect(result.odd  == [])
    }

    @Test("Пустой массив")
    func testSplitEvenOdd_emptyArray() {
        let splitter = ArraySplitter(numbers: [])
        let result = splitter.splitEvenOdd()
        #expect(result.even == [])
        #expect(result.odd  == [])
    }

    @Test("Только чётные числа")
    func testSplitEvenOdd_allEven() {
        let splitter = ArraySplitter(numbers: [2, 4, 6, 8])
        let result = splitter.splitEvenOdd()
        #expect(result.even == [2, 4, 6, 8])
        #expect(result.odd  == [])
    }

    @Test("Только нечётные числа")
    func testSplitEvenOdd_allOdd() {
        let splitter = ArraySplitter(numbers: [1, 3, 5, 7])
        let result = splitter.splitEvenOdd()
        #expect(result.even == [])
        #expect(result.odd  == [1, 3, 5, 7])
    }

    @Test("Отрицательные числа")
    func testSplitEvenOdd_negativeNumbers() {
        let splitter = ArraySplitter(numbers: [-4, -3, -2, -1, 0])
        let result = splitter.splitEvenOdd()
        #expect(result.even == [-4, -2, 0])
        #expect(result.odd  == [-3, -1])
    }
}

// MARK: - ArrayModel Tests

@Suite("ArrayModel Tests")
struct ArrayModelTests {

    @Test("Добавление элемента")
    func testAppendElement() {
        let model = ArrayModel()
        model.mutableArray.append(42)
        #expect(model.mutableArray.count == 1)
        #expect(model.mutableArray.last  == 42)
    }

    @Test("Вставка по индексу")
    func testInsertAtIndex() {
        let model = ArrayModel()
        model.mutableArray = [1, 2, 3]
        model.mutableArray.insert(99, at: 1)
        #expect(model.mutableArray == [1, 99, 2, 3])
    }

    @Test("Удаление последнего элемента")
    func testRemoveLast() {
        let model = ArrayModel()
        model.mutableArray = [1, 2, 3]
        model.mutableArray.removeLast()
        #expect(model.mutableArray == [1, 2])
    }

    @Test("Удаление по индексу")
    func testRemoveAtIndex() {
        let model = ArrayModel()
        model.mutableArray = [1, 2, 3]
        model.mutableArray.remove(at: 0)
        #expect(model.mutableArray == [2, 3])
    }

    @Test("Удаление всех элементов")
    func testRemoveAll() {
        let model = ArrayModel()
        model.mutableArray = [1, 2, 3]
        model.mutableArray.removeAll()
        #expect(model.mutableArray.isEmpty)
    }

    @Test("Неизменяемый массив содержит 10 элементов")
    func testImmutableArrayCount() {
        let model = ArrayModel()
        #expect(model.immutableArray.count == 10)
    }

    @Test("Изменяемый массив изначально пуст")
    func testMutableArrayInitiallyEmpty() {
        let model = ArrayModel()
        #expect(model.mutableArray.isEmpty)
    }
}
