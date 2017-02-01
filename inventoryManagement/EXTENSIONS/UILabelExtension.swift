//
//  UILabelExtension.swift
//  Taxi2Share
//
//  Created by MAC Mini 3 on 2/23/16.
//  Copyright © 2016 MAC Mini 3. All rights reserved.
//

import UIKit

extension UILabel
{
    func customizeLabel(cornerRadius : CGFloat = 5.0,maskToBound : Bool = true,borderWidth : CGFloat = 0.5,borderColor : UIColor = UIColor.black) {
        
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = maskToBound
        self.layer.borderWidth = borderWidth;
        self.layer.borderColor =  borderColor.cgColor
    }
    
    override func toCircle() {
        super.toCircle()
    }
    
    func setHtml(_ html: String) {
        do {
            
            self.attributedText = try NSAttributedString(data: html.data(using: String.Encoding.utf8)!, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)
            self.adjustsFontSizeToFitWidth = true
            self.lineBreakMode = .byTruncatingTail
        }
        catch {
             print("Unable to parse label text: \(error)")
        }
    }
}
