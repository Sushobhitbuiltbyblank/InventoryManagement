//
//  Constant.swift
//  inventoryManagement
//
//  Created by Sushobhit_BuiltByBlank on 1/30/17.
//  Copyright © 2017 sushobhit. All rights reserved.
//

import UIKit

class Constant: NSObject {

    //MARK: - Images
    struct  Images {
        static let defaultImage = UIImage(named: "defaultImage")
    }
    
    //MARK: - Error Message
    struct ErrorMessage {
        static let somethingWentWrong = "Something was not correct while processing your request, can you please try again !!"
        static let No_internet = "You should have active internet connection to continue with this request !!"
    }
    
    //MARK: - Color
    struct Colors {
        static let black = UIColor.black
        static let leftCellSelectedBgColor = UIColor.lightGray
    }
}
