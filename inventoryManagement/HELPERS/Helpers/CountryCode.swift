//
//  CountryCode.swift
//  Taxi2Share
//
//  Created by MAC Mini 3 on 5/11/16.
//  Copyright © 2016 MAC Mini 3. All rights reserved.
//

import Foundation

class CountryCode {
    
    static let sharedInstance : CountryCode = {
        let instance = CountryCode()
        return instance
    }()
    
    var countryCallingCode : String {
        
        let filePath: String = Bundle.main.path(forResource: "Country_Calling_Code", ofType: "json")!
        let jsonData: NSData = NSData(contentsOfFile: filePath)!
        
        do {
         let jsonDict: [String : AnyObject] = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions()) as! [String: AnyObject]
            
            let code = jsonDict[TheLocale.sharedInstance.countryCode] as! String
            return code
        }
        catch {
            print("country code error")
        }
        return ""
    }
}
