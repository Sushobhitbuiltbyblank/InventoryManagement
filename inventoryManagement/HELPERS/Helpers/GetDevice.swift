//
//  GetDevice.swift
//  Night Way
//
//  Created by Ustad on 04/08/15.
//  Copyright (c) 2015 Kennedia. All rights reserved.
//

import Foundation
import UIKit

class GetDevice {

    static let sharedInstance : GetDevice = {
        let instance = GetDevice()
        return instance
    }()
    
    func getDeviceHeight () -> CGFloat {
        
        let height = UIScreen.main.bounds.size.height
        return height
        
    }
    
    func getDeviceWidth () -> CGFloat {
        
        let height = UIScreen.main.bounds.size.width
        return height
        
    }
    var systemVersion : String {
        
        return UIDevice.current.systemVersion
    }
    var deviceName : String {
        
        return UIDevice.current.name
    }
    var deviceModel : String {
        
        return UIDevice.current.model
    }
    var systemName : String {
        
        return UIDevice.current.systemName
    }
    var deviceieOrientation : UIDeviceOrientation {
        
        return UIDevice.current.orientation
    }
    var localizedModel : String {
        
        return UIDevice.current.localizedModel
    }
    var appVersion : String {
        
         return NilCheck.sharedInstance.checkStringForNil(str: Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String)
    }
    var appBuild : String {
        
        return NilCheck.sharedInstance.checkStringForNil(str: Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String)
    }
    var appVersionBuild : String {
        
        let version = appVersion, build = appBuild
        return version == build ? "v\(version)" : "v\(version)(\(build))"
    }
    var completeDeviceInfo : String {
        
        let info = "iOS Device Info : versionBuild : \(appVersionBuild) , OSType : \(systemName) , iOS Version : \(systemVersion) , model : \(localizedModel)"
        return info
    }
}
struct ScreenSize
{
    static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS =  UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPHONE =  UIDevice.current.userInterfaceIdiom == .phone
    static let IS_IPAD =  UIDevice.current.userInterfaceIdiom == .pad
}
