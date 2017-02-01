//
//  Arithmatic.swift
//  Taxi2Share
//
//  Created by MAC Mini 3 on 3/15/16.
//  Copyright © 2016 MAC Mini 3. All rights reserved.
//

import Foundation
import UIKit

class Arithmatic {
    
    static let sharedInstance : Arithmatic = {
        let instance = Arithmatic()
        return instance
    }()
    
    func convertStringToRoundDouble(str : String,numberOfPlaces : Int) -> Double {
        
        let strDbl = (str as NSString).doubleValue
        let numberOfPlaces = Double(numberOfPlaces)
        let multiplier = pow(10.0, numberOfPlaces)
        let rounded = round(strDbl * multiplier) / multiplier
        return rounded
        
    }
    
    func roundDouble(value : Double,numberOfPlaces : Int) -> Double {
        
        let numberOfPlaces = Double(numberOfPlaces)
        let multiplier = pow(10.0, numberOfPlaces)
        let rounded = round(value * multiplier) / multiplier
        return rounded
        
    }
    
    func showPrice(price : Double) -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        return formatter.string(from: NSNumber(value : price))!
    }
}
