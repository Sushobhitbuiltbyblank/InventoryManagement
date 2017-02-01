//
//  StringExtension.swift
//  Taxi2Share
//
//  Created by MAC Mini 3 on 4/13/16.
//  Copyright © 2016 MAC Mini 3. All rights reserved.
//

import Foundation
import UIKit
extension String {
    
    var localized: String {
        return  NSLocalizedString(self, comment: "")
    }
    
    func localizedWithComment(comment:String) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: comment)
    }
    
    func contains(find: String) -> Bool{
        return self.range(of: find) != nil
    }
    
    func checkStringForNil(str : String?) -> String {
        
        guard let str = str else {
            return String() // return default string
        }
        return str
    }
    
    func numericNilCheck(str : String?) -> String {
        
        guard let str = str else {
            return "0" // return default string
        }
        return str
    }

    
    var trim : String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }

    func replace(target: String, with newString: String) -> String {
        return self.replacingOccurrences(of: target, with: newString, options: CompareOptions.literal, range: nil)
    }
    
    var parseJSONString : AnyObject? {
        
        let data = self.data(using: String.Encoding.utf8, allowLossyConversion: false)
        if let jsonData = data {
            // Will return an object or nil if JSON decoding fails
            do {
                let message = try JSONSerialization.jsonObject(with: jsonData, options:.mutableContainers)
                return message as AnyObject? //Will return the json array output
                }
            catch let error as NSError {
                print("An error occurred: \(error)")
                return nil
            }
        }
        else {
            // Lossless conversion of the string was not possible
            return nil
        }
    }
    
    var commaSeperatedArray : [String] {
        let arr = self.components(separatedBy: ",")
        return arr
    }
}

extension Int {
    
    func toBool () ->Bool? {
        
        switch self {
        case 0:
            return false
        case 1:
            return true
        default:
            return nil
        }
    }
}
