//
//  OpenMatTextField.swift
//  openmat-ios
//
//  Created by MAC Mini 3 on 7/27/16.
//  Copyright © 2016 Daniel Chui. All rights reserved.
//

import UIKit

class OpenMatTextField : UITextField {
    

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        assignDefaultTextColor()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        assignDefaultTextColor()
    }
    
    func assignDefaultTextColor() {
       
        self.textColor = UIColor(red: 106.0, green: 106.0, blue: 106.0, alpha: 0.65)
    }
}