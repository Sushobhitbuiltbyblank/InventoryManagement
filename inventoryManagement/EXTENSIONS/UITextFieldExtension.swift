//
//  UITextFieldExtension.swift
//  Taxi2Share
//
//  Created by MAC Mini 3 on 2/16/16.
//  Copyright © 2016 MAC Mini 3. All rights reserved.
//

import UIKit


extension UITextField
{
    func customizeTextField(cornerRadius : CGFloat = 5.0,maskToBound : Bool = true,borderWidth : CGFloat = 0.5,borderColor : UIColor = UIColor.black) {
        
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = maskToBound
        self.layer.borderWidth = borderWidth;
        self.layer.borderColor =  borderColor.cgColor
    }
    
    func changePlaceholderColor(color : UIColor,with placeholderText : String) {
        
        let range = (placeholderText as NSString).range(of: placeholderText)
        let attribute = NSMutableAttributedString.init(string: placeholderText)
        attribute.addAttribute(NSForegroundColorAttributeName, value: color , range: range)
        self.attributedPlaceholder = attribute
        
    }
    
    func changePlaceholderColor(color : UIColor) {
        
        let range = (self.placeholder! as NSString).range(of: self.placeholder!)
        let attribute = NSMutableAttributedString.init(string: self.placeholder!)
        attribute.addAttribute(NSForegroundColorAttributeName, value: color , range: range)
        self.attributedPlaceholder = attribute
        
    }
    
    func changePlaceholderText(placeholderText : String) {
        self.attributedPlaceholder = NSAttributedString(string: placeholderText)
    }
}


extension UITextView {
    
    func adjustTextViewHeight() {
        
        let fixedWidth = self.frame.size.width
        self.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        let newSize = self.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        var newFrame = self.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        self.frame = newFrame
    }
}
