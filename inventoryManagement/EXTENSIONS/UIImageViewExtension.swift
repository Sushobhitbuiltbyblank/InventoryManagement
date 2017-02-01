//
//  UIImageViewExtension.swift
//  Taxi2Share
//
//  Created by MAC Mini 3 on 4/3/16.
//  Copyright © 2016 MAC Mini 3. All rights reserved.
//

import UIKit


extension UIImageView
    
{
    func ToCircle(maskToBounds : Bool = false, clipToBounds : Bool = true) {
        
        self.layer.masksToBounds = maskToBounds
        self.frame.size.width = self.frame.height
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = clipToBounds
    }
    
    func customizeImageView(cornerRadius : CGFloat = 5.0,maskToBound : Bool = true,borderWidth : CGFloat = 0.0) {
        
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = maskToBound
        self.layer.borderWidth = borderWidth;
    }
    
    func convertToData() -> Data? {
        
        if let image = self.image {
            let data = UIImagePNGRepresentation(image)
            return data
        }
        return Data()
    }
    
}
