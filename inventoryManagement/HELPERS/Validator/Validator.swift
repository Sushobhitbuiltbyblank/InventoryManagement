
//
//  Validator.swift
//  ExtraExtra
//
//  Created by Shivang Mishra on 23/11/2015.
//  Copyright © 2015 Shivang Mishra. All rights reserved.
//

import Foundation

class Validator {
    
    static let sharedInstance : Validator = {
        let instance = Validator()
        return instance
    }()


    func isStringEmpty(testStr : String) -> Bool {
        
        let status = testStr.isEmpty
        return status
    }

    func isValidEmail(testStr:String) -> Bool {
        
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func isValidAlphaNumericField(testStr: String) -> Bool {
        
        let pattern = "^[a-zA-Z0-9]*$"

        return checkRegexPattern(pattern: pattern, field: testStr) || testStr == ""
    }
    
    func checkRegexPattern(pattern: String, field: String) -> Bool {
        
        let regex = try! NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        return regex.firstMatch(in: field, options: [], range: NSMakeRange(0, field.characters.count)) != nil
        
    }
    
    func areStringsEqual(str1 : String, str2 : String) -> Bool {
        return str1 == str2
    }
    
    func isStringOfLength(str : String, len : Int) -> Bool {
        return str.characters.count == len
    }
    
    func isStringlessthanLength(str : String, len : Int) -> Bool {
        return str.characters.count < len
    }
    
    func isBirthdayValid(DOB : String) -> Bool {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        let birthday: Date = formatter.date(from: DOB)!
        let nowString = DateAndTime.sharedInstance.convertCurrentDateToStringUsingFormat(format: "MM/dd/yyyy")
        let now = formatter.date(from: nowString)
        let ageComponents : DateComponents = Calendar.current.dateComponents([.year], from: birthday, to: now!)
        let age: Int = ageComponents.year!
        if age > 0 {
            return true
        }
        return false
    }
    
    func checkTextSufficientComplexity(text : String) -> Bool {
        
        let capitalLetterRegEx  = ".*[A-Z]+.*"
        let texttest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        let capitalresult = texttest.evaluate(with: text)
        
        let numberRegEx  = ".*[0-9]+.*"
        let texttest1 = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let numberresult = texttest1.evaluate(with: text)
        
        let specialCharacterRegEx  = ".*[!&^%$#@()/]+.*"
        let texttest2 = NSPredicate(format:"SELF MATCHES %@", specialCharacterRegEx)
        let specialresult = texttest2.evaluate(with: text)
        
        return capitalresult && numberresult && specialresult
    }
}
