//
//  SwiftFake.swift
//
//  Created by Alex Golub on 10/11/16.
//  Copyright (c) 2016 Alex Golub. All rights reserved.
//

import UIKit

public struct SwiftFake {
    fileprivate let maleFirstNames = ["Victor", "Brian", "Steve", "Marcus", "Stanley", "Jaco", "John", "Avishai", "Richard", "Alex"]
    fileprivate let maleLastNames = ["Wooten", "Bromberg", "Bailey", "Miller", "Clarke", "Pastorius", "Patitucci", "Cohen", "Bona", "Webster"]
    fileprivate let femaleFirstNames = ["Esperanza", "Suzi", "Carol", "Kim", "Antonella", "Tal", "Divinity", "Manou", "Mohini", "Rhonda"]
    fileprivate let femaleLastNames = ["Spalding", "Quatro", "Kaye", "Gordon", "Mazza", "Wilkenfeld", "Roxx", "Gallo", "Dey", "Smith"]

    // MARK: Name

    public static func fullName() -> String {
        if Bool.randomBool() == true {
            return SwiftFake.maleFullName()
        } else {
            return SwiftFake.femaleFullName()
        }
    }

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

    public static func ageBetween(lower: Int, higher: Int) -> Int {
        return Int.randomInt(from: lower, to: higher)
    }

    // MARK: Date

    public static func birthDateFor(age: Int) -> Date {
        let calendar = NSCalendar.current
        let date = Date()
        let dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date as Date)

        var newDateComponents = DateComponents()
        newDateComponents = dateComponents
        let newDay = Int.randomInt(from: 1, to: 30)
        let newMonth = Int.randomInt(from: 1, to: 12)
        let newYear = dateComponents.year! - age
        newDateComponents.day = newDay
        newDateComponents.month = newMonth
        newDateComponents.year = newYear

        return calendar.date(from: newDateComponents)!
    }

    // MARK: ID

    public static func uuidID() -> String {
        return NSUUID().uuidString
    }

    // MARK: Password

    public static func password(length: Int) -> String {
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString: String = ""

        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.characters.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return randomString
    }

    // MARK: Image

    public static func image(backgroundColor: UIColor) -> UIImage {
        let imageSize = CGSize(width: 100, height: 100)
        UIGraphicsBeginImageContext(imageSize)
        backgroundColor.set()
        UIRectFill(CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }

    public static func imageWithColors() -> UIImage {
        var colorsArray = [UIColor.black, UIColor.darkGray, UIColor.lightGray, UIColor.white, UIColor.gray, UIColor.red, UIColor.green, UIColor.blue, UIColor.cyan, UIColor.yellow, UIColor.magenta, UIColor.orange, UIColor.purple, UIColor.brown]
        var subviewsArray = [UIView]()
        for _ in 0..<4 {
            let view = UIView()
            let colorIndex = Int.randomInt(from: 0, to: colorsArray.count - 1)
            view.backgroundColor = colorsArray[colorIndex]
            colorsArray.remove(at: colorIndex)
            subviewsArray.append(view)
        }
        let finalView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

        let leftTopSubview = subviewsArray[0]
        leftTopSubview.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        finalView.addSubview(leftTopSubview)

        let rightTopSubview = subviewsArray[1]
        rightTopSubview.frame = CGRect(x: 50, y: 0, width: 50, height: 50)
        finalView.addSubview(rightTopSubview)

        let leftBottomSubview = subviewsArray[2]
        leftBottomSubview.frame = CGRect(x: 0, y: 50, width: 50, height: 50)
        finalView.addSubview(leftBottomSubview)

        let rightBottomSubview = subviewsArray[3]
        rightBottomSubview.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
        finalView.addSubview(rightBottomSubview)

        UIGraphicsBeginImageContext(finalView.frame.size)
        finalView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return UIImage(cgImage: image!.cgImage!)
    }
}

// Basic types extensions
public extension Bool {
    public static func randomBool() -> Bool {
        return arc4random_uniform(2) == 0
    }
}

public extension Array {
    public func randomElement() -> Element {
        let arrayCount = UInt32(self.count)
        let index = Int(arc4random_uniform(arrayCount))
        return self[index]
    }
}

public extension Int {
    public static func randomInt(from lower: Int, to higher: Int) -> Int {
        var safeLower = lower
        var safeHigher = higher
        if safeLower > safeHigher {
            swap(&safeLower, &safeHigher)
        }
        return Int(arc4random_uniform(UInt32(safeHigher - safeLower + 1))) + safeLower
    }
}
