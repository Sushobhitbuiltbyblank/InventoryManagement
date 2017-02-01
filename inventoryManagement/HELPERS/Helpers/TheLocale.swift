//
//  Locale.swift
//  Taxi2Share
//
//  Created by MAC Mini 3 on 4/19/16.
//  Copyright © 2016 MAC Mini 3. All rights reserved.
//

import Foundation

class TheLocale {
    
    static let sharedInstance : TheLocale = {
        let instance = TheLocale()
        return instance
    }()
    
    private static let locale : Locale = Locale.current
    
    var currencySymbol : String {
        
        return  TheLocale.locale.currencySymbol!
    }
    var currencyCode : String {
        
        return TheLocale.locale.currencyCode!
    }
    
    var countryCode : String {
        
        if let code = (TheLocale.locale as NSLocale).object(forKey: .countryCode) as? String {
            return code
        }
        return String()
    }
}
