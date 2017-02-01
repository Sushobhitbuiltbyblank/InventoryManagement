//
//  ImageCacheController.swift
//  Capital Governorate
//
//  Created by Shivang Mishra on 01/12/16.
//  Copyright © 2016 Macrew. All rights reserved.
//
import Foundation
import UIKit
import Kingfisher

class ImageCacheController {
    
    static let sharedInstance : ImageCacheController = {
        let instance = ImageCacheController()
        return instance
    }()
    
    func downloadImage(imageURL:String , imageView : UIImageView)  {

        let url = URL(string: imageURL)!
        imageView.kf.setImage(with: url,
                              placeholder: Constant.Images.defaultImage,
                              options: [.transition(.fade(1))],
                              progressBlock: nil,
                              completionHandler: nil)
    }
}

