//
//  SwiftFakeTests.swift
//  SwiftFakeTests
//
//  Created by Alex Golub on 10/14/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import XCTest
@testable import SwiftFake

class SwiftFakeTests: XCTestCase {

    // MARK: Contact

    func testEmail() {
        let email = SwiftFake.email()

        XCTAssertNotNil(email, "email should not be nil")
        XCTAssertTrue(email.characters.count > 0, "email should not be of null length")
        XCTAssertTrue(email.contains("@"), "email should contain at sign symbol")
        XCTAssertTrue(email.contains("."), "email should contain dot symbol")
        XCTAssertFalse(email.contains(" "), "email should not contain whitesplace symbol")

        var prefix: String = ""
        var postfix: String = ""
        var isPrefix = true
        for character in email.characters {
            if character != "@" {
                if isPrefix == true {
                    prefix.append(character)
                } else {
                    postfix.append(character)
                }
            } else {
                isPrefix = false
            }
        }
        XCTAssertTrue(prefix.characters.count > 0, "email's prefix should not be of null length")
        XCTAssertTrue(postfix.characters.count > 0, "email's postfix should not be of null length")
        XCTAssertTrue(postfix.contains("."), "email postfix should contain dot symbol")

        var subDomain = ""
        var topLevelDomain = ""
        var isSubDomain = true
        for character in postfix.characters {
            if character != "." {
                if isSubDomain == true {
                    subDomain.append(character)
                } else {
                    topLevelDomain.append(character)
                }
            } else {
                isSubDomain = false
            }
        }
        XCTAssertTrue(subDomain.characters.count > 0, "subdomain should not be of null length")
        XCTAssertTrue(topLevelDomain.characters.count > 0, "top level domain should not be of null length")
    }

    func testPhoneNumber() {
        let phoneNumber = SwiftFake.phoneNumber()

        XCTAssertNotNil(phoneNumber, "phone number should not be nil")
        XCTAssertTrue(phoneNumber.characters.count == 13, "phone number should not be of correct length")
        XCTAssertTrue(phoneNumber.hasPrefix("+"), "phone number should have plus prefix")

        let codeStartIndex = phoneNumber.index(phoneNumber.startIndex, offsetBy: 3)
        let codeEndIndex = phoneNumber.index(phoneNumber.startIndex, offsetBy: 6)
        let codeRange = Range(uncheckedBounds: (codeStartIndex, codeEndIndex))
        let codeSubstring = phoneNumber.substring(with: codeRange)
        XCTAssertTrue(areSymbolsEqualIn(string: codeSubstring), "code symbols should be equal")

        let phoneNumberEndIndex = phoneNumber.endIndex
        let phoneNumberStartIndex = phoneNumber.index(phoneNumberEndIndex, offsetBy: -7)
        let phoneNumberRange = Range(uncheckedBounds: (phoneNumberStartIndex, phoneNumberEndIndex))
        let phoneNumberSubstring = phoneNumber.substring(with: phoneNumberRange)
        XCTAssertTrue(areSymbolsEqualIn(string: phoneNumberSubstring), "phone number symbols should be equal")
    }
}

private extension SwiftFakeTests {
    func areSymbolsEqualIn(string: String) -> Bool {
        var codeCharacter: String = ""
        var areSymbolsEqual = false
        for (index, character) in string.characters.enumerated() {
            if index != 0 {
                areSymbolsEqual = codeCharacter == String(character)
            }
            codeCharacter = String(character)
        }
        return areSymbolsEqual
    }
}
