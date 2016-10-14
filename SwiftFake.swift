//
//  SwiftFake.swift
//
//  Created by Alex Golub on 10/11/16.
//  Copyright (c) 2016 Alex Golub. All rights reserved.
//

import Foundation

public struct SwiftFake {
    fileprivate let maleFirstNames = ["Victor", "Brian", "Steve", "Marcus", "Stanley", "Jaco", "John", "Avishai", "Richard", "Alex"]
    fileprivate let maleLastNames = ["Wooten", "Bromberg", "Bailey", "Miller", "Clarke", "Pastorius", "Patitucci", "Cohen", "Bona", "Webster"]
    fileprivate let femaleFirstNames = ["Esperanza", "Suzi", "Carol", "Kim", "Antonella", "Tal", "Divinity", "Manou", "Mohini", "Rhonda"]
    fileprivate let femaleLastNames = ["Spalding", "Quatro", "Kaye", "Gordon", "Mazza", "Wilkenfeld", "Roxx", "Gallo", "Dey", "Smith"]

    // MARK: Name

    public static func maleFirstName() -> String {
        return SwiftFake().maleFirstNames.randomElement()
    }

    public static func maleLastName() -> String {
        return SwiftFake().maleLastNames.randomElement()
    }

    public static func maleFullName() -> String {
        return maleFirstName() + " " + maleLastName()
    }

    public static func femaleFirstName() -> String {
        return SwiftFake().femaleFirstNames.randomElement()
    }

    public static func femaleLastName() -> String {
        return SwiftFake().femaleLastNames.randomElement()
    }

    public static func femaleFullName() -> String {
        return femaleFirstName() + " " + femaleLastName()
    }

    public static func fullName() -> String {
        if Bool.randomBool() == true {
            return SwiftFake.maleFullName()
        } else {
            return SwiftFake.femaleFullName()
        }
    }

    // MARK: Contact

    public static func email() -> String {
        let namesList = ["example", "user", "dearuser", "yourfriend", "homer.simpson", "dart.vader", "jack.jones", "batman"]
        let domainsList = ["aaa", "bbb", "uuu", "abc", "ccc", "ddd", "eee", "fff", "ggg"]
        let topDomainsList = ["edu", "co", "com", "br", "io", "net", "org", "ua"]
        return namesList.randomElement() + "@" + domainsList.randomElement() + "." + topDomainsList.randomElement()
    }

    public static func phoneNumber() -> String {
        let countriesList = ["27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38"]
        let regionsList = ["000", "111", "222", "333", "444", "555", "666", "777", "888", "999"]
        let phonesList = ["0000000", "1111111", "2222222", "3333333", "4444444", "5555555", "6666666", "7777777", "8888888", "9999999"]
        return "+" + countriesList.randomElement() + regionsList.randomElement() + phonesList.randomElement()
    }

    // MARK: Data

    public static func gender() -> String {
        return Bool.randomBool() ? "Male" : "Female"
    }

    // MARK: Date
}

// Basic types extensions
public extension Bool {
    public static func randomBool() -> Bool {
        return arc4random_uniform(2) == 0
    }
}

public extension String {
    public func fakePrefix() -> String {
        return "fake" + self
    }
}

public extension Array {
    public func randomElement() -> Element {
        let arrayCount = UInt32(self.count)
        let index = Int(arc4random_uniform(arrayCount))
        return self[index]
    }
}
