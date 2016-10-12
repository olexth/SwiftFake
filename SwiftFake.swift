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

    public static func fullName() -> String {
        if randomBool() == true {
            return maleFullName
        } else {
            return femaleFullName
        }
    }

    public static func maleFirstName() -> String {
        return maleFirstNames.randomElement()
    }

    public static func maleLastName() -> String {
        return maleLastNames.randomElement()
    }

    public static func maleFullName() -> String {
        return maleFirstNames.randomElement() + " " + maleLastNames.randomElement()
    }

    public static func femaleFirstName() -> String {
        return femaleFirstNames.randomElement()
    }

    public static func femaleLastName() -> String {
        return femaleLastNames.randomElement()
    }

    public static func femaleFullName() -> String {
        return femaleFirstNames.randomElement() + " " + femaleLastNames.randomElement()
    }

    // MARK: Contact

    public static func email() -> String {
        let namesList = ["example", "user", "dearuser", "yourfriend", "homer.simpson", "dart.vader", "jack.jones", "batman"]
        let domainsList = ["aaa", "bbb", "uuu", "abc", "ccc", "ddd", "eee", "fff", "ggg"]
        let topDomainsList = ["edu", "co", "com", "br", "io", "net", "org", "ua"]
        return nameList.randomItem() + "@" + domainsList.randomItem() + "." + topDomainsList.randomItem()
    }

    public static func phoneNumber() -> String {
        let countriesList = ["27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38"]
        let regionsList = ["000", "111", "222", "333", "444", "555", "666", "777", "888", "999"]
        let phonesList = ["0000000", "1111111", "2222222", "3333333", "4444444", "5555555", "6666666", "7777777", "8888888", "9999999"]
        return "+" + countriesList.randomItem() + regionList.randomItem() + phoneList.randomItem()
    }

    // MARK: Data

    public static func gender() -> String {
        return randomBool() ? "Male" : "Female"
    }
}

public extension Bool {
    public static func randomBool() -> Bool {
        return arc4random_uniform(2)
    }
}

public extension String {
    public static func fakePrefix() -> String {
        return "fake" + self
    }
}

public extension Array {
    public static func randomElement() -> Element {
        return self[Int(arc4random_uniform(UInt32(self.count)))]
    }
}