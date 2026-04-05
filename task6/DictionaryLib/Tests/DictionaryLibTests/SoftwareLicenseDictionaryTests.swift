//
//  SoftwareLicenseDictionaryTests.swift
//  DictionaryLib
//
//  Created by Anastasiya Yarmolik on 5.04.26.
//

import XCTest
@testable import DictionaryLib

final class SoftwareLicenseDictionaryTests: XCTestCase {

    func testInitialDataContainsLinux() {
        let d = SoftwareLicenseDictionary()
        XCTAssertEqual(d.getValue(for: "Linux"), "GPL")
        XCTAssertEqual(d.getValue(for: "VS Code"), "MIT")
        XCTAssertEqual(d.count(), 5)
    }

    func testAddAndModify() {
        let d = SoftwareLicenseDictionary()
        d.add(name: "MyApp", license: "Apache-2.0")
        XCTAssertEqual(d.getValue(for: "MyApp"), "Apache-2.0")
        d.modify(name: "MyApp", newLicense: "BSD-3-Clause")
        XCTAssertEqual(d.getValue(for: "MyApp"), "BSD-3-Clause")
    }

    func testRemove() {
        let d = SoftwareLicenseDictionary()
        d.remove(name: "Linux")
        XCTAssertNil(d.getValue(for: "Linux"))
        XCTAssertEqual(d.count(), 4)
    }

    func testRemoveAll() {
        let d = SoftwareLicenseDictionary()
        d.removeAll()
        XCTAssertEqual(d.count(), 0)
    }

    func testSortedByKeyOrder() {
        let d = SoftwareLicenseDictionary()
        let keys = d.sortedByKey().map(\.0)
        XCTAssertEqual(keys, ["Firefox", "Linux", "VS Code", "Windows", "Xcode"])
    }

    func testSortedByValueGroupsSameLicense() {
        let d = SoftwareLicenseDictionary()
        let sorted = d.sortedByValue()
        let proprietary = sorted.filter { $0.1 == "Proprietary" }.map(\.0).sorted()
        XCTAssertEqual(proprietary, ["Windows", "Xcode"])
    }
}
