//
//  SoftwareYearDictionaryTests.swift
//  DictionaryLib
//
//  Created by Anastasiya Yarmolik on 5.04.26.
//

import XCTest
@testable import DictionaryLib

final class SoftwareYearDictionaryTests: XCTestCase {

    func testInputFromConsoleParsesPairs() {
        let d = SoftwareYearDictionary()
        d.inputFromConsole("Swift 2014 Kotlin 2011")
        XCTAssertEqual(d.count(), 2)
        XCTAssertEqual(d.getValue(for: "Swift"), 2014)
        XCTAssertEqual(d.getValue(for: "Kotlin"), 2011)
    }

    func testInputFromConsoleSkipsInvalidYear() {
        let d = SoftwareYearDictionary()
        d.inputFromConsole("Good 2020 Bad xyz")
        XCTAssertEqual(d.count(), 1)
        XCTAssertEqual(d.getValue(for: "Good"), 2020)
    }

    func testAddModifyRemove() {
        let d = SoftwareYearDictionary()
        d.add(name: "App", year: 2020)
        XCTAssertEqual(d.getValue(for: "App"), 2020)
        d.modify(name: "App", newYear: 2024)
        XCTAssertEqual(d.getValue(for: "App"), 2024)
        d.remove(name: "App")
        XCTAssertNil(d.getValue(for: "App"))
    }

    func testRemoveAll() {
        let d = SoftwareYearDictionary(initialData: ["a": 1, "b": 2])
        XCTAssertEqual(d.count(), 2)
        d.removeAll()
        XCTAssertEqual(d.count(), 0)
    }

    func testSortedByKey() {
        let d = SoftwareYearDictionary(initialData: ["c": 3, "a": 1, "b": 2])
        let keys = d.sortedByKey().map(\.0)
        XCTAssertEqual(keys, ["a", "b", "c"])
    }

    func testSortedByValue() {
        let d = SoftwareYearDictionary(initialData: ["x": 30, "y": 10, "z": 20])
        let values = d.sortedByValue().map(\.1)
        XCTAssertEqual(values, [10, 20, 30])
    }
}
