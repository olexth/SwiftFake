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

    /**
        Call it when you just want full name, without setting gender
        @return full name
    */
    public static func fullName() -> String {
        if Bool.randomBool() == true {
            return SwiftFake.maleFullName()
        } else {
            return SwiftFake.femaleFullName()
        }
    }

    /**
        Male first name
        @return male first name
    */
    public static func maleFirstName() -> String {
        return SwiftFake().maleFirstNames.randomElement()
    }

    /**
        Male last name
        @return male last name
     */
    public static func maleLastName() -> String {
        return SwiftFake().maleLastNames.randomElement()
    }

    /**
        Male full name
        @return male full name
     */
    public static func maleFullName() -> String {
        return maleFirstName() + " " + maleLastName()
    }

    /**
        Female first name
        @return female first name
     */
    public static func femaleFirstName() -> String {
        return SwiftFake().femaleFirstNames.randomElement()
    }

    /**
        Female last name
        @return female last name
     */
    public static func femaleLastName() -> String {
        return SwiftFake().femaleLastNames.randomElement()
    }

    /**
        Female full name
        @return female full name
     */
    public static func femaleFullName() -> String {
        return femaleFirstName() + " " + femaleLastName()
    }

    // MARK: Contact

    /**
        Email
        @return email
     */
    public static func email() -> String {
        let namesArray = ["example", "user", "dearuser", "yourfriend", "homer.simpson", "dart.vader", "jack.jones", "batman"]
        let domainsArray = ["aaa", "bbb", "uuu", "abc", "ccc", "ddd", "eee", "fff", "ggg"]
        let topDomainsArray = ["edu", "co", "com", "br", "io", "net", "org", "ua"]
        return namesArray.randomElement() + "@" + domainsArray.randomElement() + "." + topDomainsArray.randomElement()
    }

    /**
        Phone number
        @return phone number
     */
    public static func phoneNumber() -> String {
        let countriesArray = ["27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38"]
        let regionsArray = ["000", "111", "222", "333", "444", "555", "666", "777", "888", "999"]
        let phonesArray = ["0000000", "1111111", "2222222", "3333333", "4444444", "5555555", "6666666", "7777777", "8888888", "9999999"]
        return "+" + countriesArray.randomElement() + regionsArray.randomElement() + phonesArray.randomElement()
    }

    // MARK: Data

    /**
        City name.
        @return city name
     */
    public static func city() -> String {
        let prefixes = ["Det", "Ives", "Checo", "Lay", "Rock", "Dale", "Morri", "Park", "Dixie", "Frier", "Bras", "Crow", "Wolf", "Grid", "Rums"]
        let postfixes = ["mold", "dale", "tah", "ville", "hill", "york", "son", "way", "land", "ona", "well", "der", "boro", "ley", "town"]
        return prefixes.randomElement() + postfixes.randomElement()
    }

    /**
        One of two genders.
        @return gender
     */
    public static func gender() -> String {
        return Bool.randomBool() ? "Male" : "Female"
    }

    /**
        Age in range
        @param lower lower bound of generated age
        @param higher higher bound of generated age
        @return age
     */
    public static func ageBetween(lower: Int, higher: Int) -> Int {
        return Int.randomInt(from: lower, to: higher)
    }

    /**
     Title
     @return title
     */
    public static func title() -> String {
        let title = ["CEO", "COO", "CTO", "Director", "Head", "President", "Vice President", "Coordinator", "Assistant", "Worker"]
        return title.randomElement()
    }

    // MARK: Date

    /**
        Birth date for age.
        @discussion Month and day will be randomly set, but year will be a current minus age. Time (hours and minutes)
                    will also be the same as current when called.
        @param age for which birth date will be generated
        @return birth date
     */
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

    /**
        ID in format of uuid : https://en.wikipedia.org/wiki/Universally_unique_identifier
        @discussion String description of the UUID, such as "E621E1F8-C36C-495A-93FC-0C247A3E6E5F"
        @return uuidID
     */
    public static func uuidID() -> String {
        return NSUUID().uuidString
    }

    // MARK: Password

    /**
        Password.
        @discussion Only digits and english alphabet symbols are included
        @param length Length for generated password
        @return pasword
     */
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

    /**
        Image filled with color.
        @discussion Generated image which can be filled with color
        @param color for filling image
        @return image
     */
    public static func image(color: UIColor) -> UIImage {
        let imageSize = CGSize(width: 100, height: 100)
        UIGraphicsBeginImageContext(imageSize)
        color.set()
        UIRectFill(CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }

    /**
        Image from for colored squares.
        @discussion Generated image which will be filled with for squares of different color
        @return image
     */
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
