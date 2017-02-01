//
//  UITableViewCellExtension.swift
//  Applicaa
//
//  Created by Shivang Mishra on 26/09/16.
//  Copyright © 2016 MAC Mini 3. All rights reserved.
//

import UIKit
extension UITableViewCell {
    
    func initialSetUp() {
        
        self.setNeedsUpdateConstraints()
        self.updateConstraintsIfNeeded()
        self.contentView.backgroundColor = UIColor.white
        self.backgroundView = nil
        self.selectedBackgroundView = nil;
        self.selectionStyle = UITableViewCellSelectionStyle.none
    }
}
