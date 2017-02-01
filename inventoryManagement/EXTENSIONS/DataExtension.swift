//
//  NSDataExtension.swift
//  openmat-ios
//
//  Created by MAC Mini 3 on 8/19/16.
//  Copyright © 2016 Daniel Chui. All rights reserved.
//

import Foundation
import UIKit

extension Data {
    
    func convertToImage() -> UIImage? {
        
        let image = UIImage(data: self)
        return image
    }

}
