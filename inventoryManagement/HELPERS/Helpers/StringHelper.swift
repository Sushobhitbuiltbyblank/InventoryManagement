    //
//  StringHelper.swift
//  Taxi2Share
//
//  Created by MAC Mini 3 on 5/5/16.
//  Copyright © 2016 MAC Mini 3. All rights reserved.
//

import Foundation

class StringHelper {
    
    static let sharedInstance : StringHelper = {
        let instance = StringHelper()
        return instance
    }()
    
    func convertToJsonString(dictionaryOrArray : AnyObject) -> String? {
        
        var jsonString = String()
        do {
            let arrJson = try JSONSerialization.data(withJSONObject: dictionaryOrArray, options: JSONSerialization.WritingOptions.prettyPrinted)
            jsonString = String(data: arrJson, encoding: String.Encoding.utf8)!
        }catch let error as NSError{
            print(error.description)
        }
        return jsonString
    }
    
    func decodeStringFromUTF8Encoding(str : String?) -> String? {
        
        var properString = String()
        if let encodedStr = str {
            properString = encodedStr.removingPercentEncoding!
        }
        return properString
    }
    
    func constructFullName(FN : String, LN : String) -> String {
        
        let fullName = "\(FN) \(LN)"
        return fullName.trim
        
    }
}
