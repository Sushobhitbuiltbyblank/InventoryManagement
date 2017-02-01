//
//  Enums.swift
//  Capital Governorate
//
//  Created by Shivang Mishra on 21/11/16.
//  Copyright © 2016 Macrew. All rights reserved.
//

import Foundation
import UIKit

////MARK: - API List
//public enum ResourcePath : CustomStringConvertible {
//    case Feedback
//    case Contact
//    
//    public var description : String {
//        
//        switch self {
//        case .Feedback : return "feedback.php"
//        case .Contact : return "contact-us.php"
//        }
//    }
//}
//
///**
//    * Handles server response code
//    * Performs success and failure block according to response
// */
//public enum HttpResponseHandler {
//    
//    case FAILURE
//    case SUCCESS
//    case INTERNET_DOWN
//    
//    func responseMessage(theVC : UIViewController, theTitle : String = GlobalConstants.appDetails.appName, theMessages : MessageToShow, responseObject : Any?, failureBlock : @escaping ()->(), successBlock : @escaping ()->(), noInternetBlock : @escaping ()->()) {
//        DispatchQueue.main.async {
//            switch self {
//                
//            case .FAILURE:
//                if let response = responseObject as? BasicResponse {
//                    SwiftAlert().show(title: theTitle, message: response.msg, viewController: theVC, okAction: {
//                        failureBlock()
//                    })
//                }
//                else if let msg = theMessages.errorMessage {
//                    SwiftAlert().show(title: theTitle, message: msg, viewController: theVC, okAction: {
//                        failureBlock()
//                    })
//                }
//                else { return }
//                break
//            case .SUCCESS:
//                if let _ = responseObject {
//                    if let msg = theMessages.successMessage {
//                        SwiftAlert().show(title: theTitle, message: msg, viewController: theVC, okAction: {
//                            successBlock()
//                        })
//                    }
//                    else {
//                       successBlock()
//                    }
//                }
//                else {
//                    successBlock()
//                }
//                break
//            case .INTERNET_DOWN:
//                if let msg = theMessages.noInternetMessage {
//                    if msg == GlobalConstants.ErrorMessage.No_internet {
//                        
//                    }
//                    else {
//                        SwiftAlert().show(title: theTitle, message: msg, viewController: theVC, okAction: {
//                            noInternetBlock()
//                        })
//                    }
//                }
//                else { return }
//                
//                break
//            }
//        }
//    }
//    
//}
//
///**
//    * SOAP keywords used as constants
//*/
//
//public enum SOAPKeywords : String {
//   
//    case is_Post = "POST"
//    case is_Host = "Host"
//    case is_ContentType = "Content-Type"
//    case is_ContentLength = "Content-Length"
//    case is_SOAPAction = "SOAPAction"
//
//}
//
//public struct MessageToShow {
//    
//    var errorMessage : String?
//    var successMessage : String?
//    var noInternetMessage  : String?
//    
//    init(by errorMsg : String?, successMsg : String?, noInternet : String? = GlobalConstants.ErrorMessage.No_internet) {
//        errorMessage = errorMsg
//        successMessage = successMsg
//        noInternetMessage = noInternet
//    }
//}







