//
//  UIButtonExtension.swift
//  Taxi2Share
//
//  Created by MAC Mini 3 on 2/19/16.
//  Copyright © 2016 MAC Mini 3. All rights reserved.
//

import UIKit

extension UIButton
{
    
    func customizeButton(cornerRadius : CGFloat = 5.0,maskToBound : Bool = true,borderWidth : CGFloat = 0.0) {
        
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = maskToBound
        self.layer.borderWidth = borderWidth;
    }
    
    override func borderColor(color : UIColor) {
        
        self.layer.borderColor = color.cgColor
    }
    
    override func cornerRadius(cornerRadius : CGFloat) {
        
       self.layer.cornerRadius = cornerRadius
    }
    
    override func masksToBounds(maskToBound : Bool) {
        
        self.layer.masksToBounds = maskToBound
    }
    
    override func borderWidth(borderWidth : CGFloat) {
        
        self.layer.borderWidth = borderWidth
    }
    
}
