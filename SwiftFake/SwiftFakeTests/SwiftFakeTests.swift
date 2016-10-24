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

    // MARK: Name

    func testFullName() {
        let fullName = SwiftFake.fullName()

        XCTAssertTrue(fullName.characters.count > 0, "full name should not be of null length")
        let nameComponents = fullName.components(separatedBy: " ")
        XCTAssertTrue(nameComponents.count == 2, "full name should consist from two words")
        let uppercasedFirstName = isUppercased(character: fullName.characters.first!)
        XCTAssertTrue(uppercasedFirstName, "first name should start from an uppercased character")
        let uppercasedLastName = isUppercased(character: fullName.characters.first!)
        XCTAssertTrue(uppercasedLastName, "last name should start from an uppercased character")

        if isFromSource(maleFirstName: nameComponents.first!) == true {
            XCTAssertTrue(isFromSource(maleLastName: nameComponents.last!), "male name should have male last name")
        } else {
            XCTAssertTrue(isFromSource(femaleFirstName: nameComponents.first!), "female name should have female first name")
            XCTAssertTrue(isFromSource(femaleLastName: nameComponents.last!), "female name should have female last name")
        }
    }

    func testMaleFirstName() {
        let maleFirstName = SwiftFake.maleFirstName()

        XCTAssertTrue(maleFirstName.characters.count > 0, "male first name should not be of null length")
        let nameComponents = maleFirstName.components(separatedBy: " ")
        XCTAssertTrue(nameComponents.count == 1, "male first name should consist from one word")
        let uppercased = isUppercased(character: maleFirstName.characters.first!)
        XCTAssertTrue(uppercased, "male first name should start from an uppercased character")
        XCTAssertTrue(isFromSource(maleFirstName: maleFirstName), "male first name should be taken from source")
    }

    func testMaleLastName() {
        let maleLastName = SwiftFake.maleLastName()

        XCTAssertTrue(maleLastName.characters.count > 0, "male last name should not be of null length")
        let nameComponents = maleLastName.components(separatedBy: " ")
        XCTAssertTrue(nameComponents.count == 1, "male last name should consist from one word")
        let uppercased = isUppercased(character: maleLastName.characters.first!)
        XCTAssertTrue(uppercased, "male last name should start from an uppercased character")
        XCTAssertTrue(isFromSource(maleLastName: maleLastName), "male last name should be taken from source")
    }

    func testMaleFullName() {
        let maleFullName = SwiftFake.maleFullName()

        XCTAssertTrue(maleFullName.characters.count > 0, "male full name should not be of null length")
        let nameComponents = maleFullName.components(separatedBy: " ")
        XCTAssertTrue(nameComponents.count == 2, "male full name should consist from two words")
        let uppercasedFirstName = isUppercased(character: maleFullName.characters.first!)
        XCTAssertTrue(uppercasedFirstName, "male first name should start from an uppercased character")
        let uppercasedLastName = isUppercased(character: maleFullName.characters.first!)
        XCTAssertTrue(uppercasedLastName, "male last name should start from an uppercased character")
        XCTAssertTrue(isFromSource(maleFirstName: nameComponents.first!), "male first name should be taken from source")
        XCTAssertTrue(isFromSource(maleLastName: nameComponents.last!), "male last name should be taken from source")
    }

    func testFemaleFirstName() {
        let femaleFirstName = SwiftFake.femaleFirstName()

        XCTAssertTrue(femaleFirstName.characters.count > 0, "female first name should not be of null length")
        let nameComponents = femaleFirstName.components(separatedBy: " ")
        XCTAssertTrue(nameComponents.count == 1, "female first name should consist from one word")
        let uppercased = isUppercased(character: femaleFirstName.characters.first!)
        XCTAssertTrue(uppercased, "female first name should start from an uppercased character")
        XCTAssertTrue(isFromSource(femaleFirstName: femaleFirstName), "female first name should be taken from source")
    }

    func testFemaleLastName() {
        let femaleLastName = SwiftFake.femaleLastName()

        XCTAssertTrue(femaleLastName.characters.count > 0, "female last name should not be of null length")
        let nameComponents = femaleLastName.components(separatedBy: " ")
        XCTAssertTrue(nameComponents.count == 1, "female last name should consist from one word")
        let uppercased = isUppercased(character: femaleLastName.characters.first!)
        XCTAssertTrue(uppercased, "female last name should start from an uppercased character")
        XCTAssertTrue(isFromSource(femaleLastName: femaleLastName), "female last name should be taken from source")
    }

    func testFemaleFullName() {
        let femaleFullName = SwiftFake.femaleFullName()

        XCTAssertTrue(femaleFullName.characters.count > 0, "female full name should not be of null length")
        let nameComponents = femaleFullName.components(separatedBy: " ")
        XCTAssertTrue(nameComponents.count == 2, "female full name should consist from two words")
        let uppercasedFirstName = isUppercased(character: femaleFullName.characters.first!)
        XCTAssertTrue(uppercasedFirstName, "female first name should start from an uppercased character")
        let uppercasedLastName = isUppercased(character: femaleFullName.characters.first!)
        XCTAssertTrue(uppercasedLastName, "female last name should start from an uppercased character")
        XCTAssertTrue(isFromSource(femaleFirstName: nameComponents.first!), "female first name should be taken from source")
        XCTAssertTrue(isFromSource(femaleLastName: nameComponents.last!), "female last name should be taken from source")
    }

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

    // MARK: Data

    func testCity() {
        let city = SwiftFake.city()

        XCTAssertNotNil(city, "city name should not be nil")
        XCTAssertTrue(city.characters.count > 1, "city name should be of normal length")
        XCTAssertTrue(isUppercased(character: city.characters.first!), "city name should start from uppercase letter")

        let cityNameComponents = city.components(separatedBy: " ")
        XCTAssertTrue(cityNameComponents.count == 1, "city name should constisr from one word")
     }

    func testGender() {
        let gender = SwiftFake.gender()
        XCTAssertNotNil(gender, "gender should be not nil")
        XCTAssertTrue(isFromeSource(gender: gender), "gender should be one of two values")
    }

    func testAge() {
        let lower = 10
        let higher = 80
        let age = SwiftFake.ageBetween(lower: lower, higher: higher)
        XCTAssertTrue(age > lower, "age should be more than lower value")
        XCTAssertTrue(age < higher, "age should be less than higher value")

        let wrongPassedRangeAge = SwiftFake.ageBetween(lower: higher, higher: lower)
        XCTAssertTrue(wrongPassedRangeAge > lower, "age with wrong passed value should be more than lower value")
        XCTAssertTrue(wrongPassedRangeAge < higher, "age with wrong passed value should be less than higher value")
    }

    // MARK: Date

    func testBirthDateForAge() {
        let age = 35
        let birthDateForAge = SwiftFake.birthDateFor(age: age)
        XCTAssertNotNil(birthDateForAge, "birth date should not be nil")

        let calendar = NSCalendar.current
        let date = Date()
        let dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date as Date)
        let receivedDateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: birthDateForAge as Date)
        XCTAssertTrue(dateComponents.year! - age == receivedDateComponents.year, "birth year should be right")
        XCTAssertTrue(dateComponents.hour! == receivedDateComponents.hour, "birth hour should be the same as current hour")
        XCTAssertTrue(dateComponents.minute! == receivedDateComponents.minute, "birth minute should be the same as current minute")
    }

    // MARK: ID

    func testUUID() {
        let uuid = SwiftFake.uuidID()
        XCTAssertNotNil(NSUUID(uuidString: uuid), "id should be in correct UUID format")
    }

    // MARK: Password

    func testPassword() {
        let length = 20
        let password = SwiftFake.password(length: length)

        XCTAssertNotNil(password, "password should be not nil")
        XCTAssertTrue(password.characters.count == length, "password should be of set length")
    }

    // MARK: Image

    func testImage() {
        let color = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        let image = SwiftFake.image(color: color)
        let imageColor = getPixelColor(image: image, pos: CGPoint(x: 50, y: 50))

        XCTAssertNotNil(image, "image should be not nil")
        XCTAssertEqual(color, imageColor, "color should be set to image")
    }

    func testImageWithColors() {
        let image = SwiftFake.imageWithColors()
        XCTAssertNotNil(image, "image should be not nil")

        let topLeftImageColor = getPixelColor(image: image, pos: CGPoint(x: 25, y: 25))
        let topRightImageColor = getPixelColor(image: image, pos: CGPoint(x: 75, y: 25))
        let bottomLeftImageColor = getPixelColor(image: image, pos: CGPoint(x: 25, y: 75))
        let bottomRightImageColor = getPixelColor(image: image, pos: CGPoint(x: 75, y: 75))
        XCTAssertNotNil(topLeftImageColor, "top left color should not be nil")
        XCTAssertNotNil(topRightImageColor, "top right color should not be nil")
        XCTAssertNotNil(bottomLeftImageColor, "bottom left color should not be nil")
        XCTAssertNotNil(bottomRightImageColor, "bottom right color should not be nil")

        XCTAssertTrue(topLeftImageColor != topRightImageColor ||
            topLeftImageColor != bottomLeftImageColor ||
            topLeftImageColor != bottomRightImageColor, "top left color should not be equal to another colors")
        XCTAssertTrue(topRightImageColor != topLeftImageColor ||
            topRightImageColor != bottomLeftImageColor ||
            topRightImageColor != bottomRightImageColor, "top right color should not be equal to another colors")
        XCTAssertTrue(bottomLeftImageColor != topLeftImageColor ||
            bottomLeftImageColor != topRightImageColor ||
            bottomLeftImageColor != bottomRightImageColor, "bottom left color should not be equal to another colors")
        XCTAssertTrue(bottomRightImageColor != topLeftImageColor ||
            bottomRightImageColor != topRightImageColor ||
            bottomRightImageColor != bottomLeftImageColor, "bottom right color should not be equal to another colors")
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

    func isUppercased(character: Character) -> Bool {
        let string = String(character)
        return (string == string.uppercased())
    }

    func isFromSource(maleFirstName: String) -> Bool {
        let maleFirstNames = ["Victor", "Brian", "Steve", "Marcus", "Stanley", "Jaco", "John", "Avishai", "Richard", "Alex"]
        return maleFirstNames.contains(maleFirstName)
    }

    func isFromSource(maleLastName: String) -> Bool {
        let maleLastNames = ["Wooten", "Bromberg", "Bailey", "Miller", "Clarke", "Pastorius", "Patitucci", "Cohen", "Bona", "Webster"]
        return maleLastNames.contains(maleLastName)
    }

    func isFromSource(femaleFirstName: String) -> Bool {
        let femaleFirstNames = ["Esperanza", "Suzi", "Carol", "Kim", "Antonella", "Tal", "Divinity", "Manou", "Mohini", "Rhonda"]
        return femaleFirstNames.contains(femaleFirstName)
    }

    func isFromSource(femaleLastName: String) -> Bool {
        let femaleLastNames = ["Spalding", "Quatro", "Kaye", "Gordon", "Mazza", "Wilkenfeld", "Roxx", "Gallo", "Dey", "Smith"]
        return femaleLastNames.contains(femaleLastName)
    }

    func isFromeSource(gender: String) -> Bool {
        return ["Male", "Female"].contains(gender)
    }

    func getPixelColor(image: UIImage, pos: CGPoint) -> UIColor {
        let pixelData = image.cgImage!.dataProvider!.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)

        let pixelInfo: Int = ((Int(image.size.width) * Int(pos.y)) + Int(pos.x)) * 4

        let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
        let g = CGFloat(data[pixelInfo + 1]) / CGFloat(255.0)
        let b = CGFloat(data[pixelInfo + 2]) / CGFloat(255.0)
        let a = CGFloat(data[pixelInfo + 3]) / CGFloat(255.0)

        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}
