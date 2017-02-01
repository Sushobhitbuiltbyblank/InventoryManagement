//
//  UIViewExtension.swift
//  Taxi2Share
//
//  Created by MAC Mini 3 on 3/9/16.
//  Copyright © 2016 MAC Mini 3. All rights reserved.
//

import UIKit


extension UIView
{
    func roundCornerWithBorder(cornerRadius : CGFloat = 5.0,maskToBound : Bool = true,borderWidth : CGFloat = 0.5,borderColor : UIColor = UIColor.black) {
        
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = maskToBound
        self.layer.borderWidth = borderWidth
        self.layer.borderColor =  borderColor.cgColor
    }
    func roundCornerWithoutBorder(cornerRadius : CGFloat = 5.0,maskToBound : Bool = true,borderColor : UIColor = UIColor.black) {
        
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = maskToBound
        self.layer.borderColor =  borderColor.cgColor
    }
    
    func viewWithSmallCorner() {
        
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = false

    }
    
    func toCircle() {
        
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
    }
    
    func customizeView(cornerRadius : CGFloat = 5.0,maskToBound : Bool = true,borderWidth : CGFloat = 0.0) {
        
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = maskToBound
        self.layer.borderWidth = borderWidth;
    }
    
    func borderColor(color : UIColor) {
        
        self.layer.borderColor = color.cgColor
    }
    
    func cornerRadius(cornerRadius : CGFloat) {
        
        self.layer.cornerRadius = cornerRadius
    }
    
    func masksToBounds(maskToBound : Bool) {
        
        self.layer.masksToBounds = maskToBound
    }
    
    func borderWidth(borderWidth : CGFloat) {
        
        self.layer.borderWidth = borderWidth
    }

    func removeBorder() {
        
        self.layer.borderWidth = 0.0
    }
    
    func shadowEffet() {
        
        self.layer.shadowRadius = 5.0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize.zero;
        self.layer.shadowOpacity = 0.5
    }
    
    func backgroundFade(alpha : CGFloat = 0.6) {
        self.backgroundColor = UIColor.black.withAlphaComponent(alpha)
    }
    
    func shadowNavBar() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 10
    //    self.layer.shadowPath = UIBezierPath(rect: self.frame).cgPath
        self.layer.shouldRasterize = true
    }
}
