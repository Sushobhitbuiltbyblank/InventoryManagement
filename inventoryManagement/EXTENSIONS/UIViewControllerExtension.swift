//
//  UIViewControllerExtension.swift
//  Night Way
//
//  Created by Ustad on 23/07/15.
//  Copyright (c) 2015 Kennedia. All rights reserved.
//

import UIKit
import MBProgressHUD

enum NavBarTags : Int {
    
    case centerView = 1001
    case centerImage = 1002
}
extension UIViewController {
    
    func showToast(message : String) {
    
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 150, y: self.view.frame.size.height-100, width: 300, height: 35))
        toastLabel.backgroundColor = UIColor.black
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        self.view.addSubview(toastLabel)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            
             toastLabel.alpha = 0.0
            
            }, completion: nil)
    }
    
//    func addCenterTextOnNavigationBar(text : String) {
//        
//        removeSubViews()
//        self.navigationController?.isNavigationBarHidden = false
//        self.navigationItem.hidesBackButton = true
//        let centerView = UIView(frame: CGRect(x: GetDevice.sharedInstance.getDeviceWidth() / 2 - 125, y: 0, width: 200, height: navigationBarHeight()))
//        centerView.tag = NavBarTags.centerView.rawValue
//        let centerImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: navigationBarHeight()))
//        let centerText = UILabel(frame: CGRect(x: 30, y: 0, width: 220, height: navigationBarHeight()))
//        centerText.textColor = UIColor(hex: "#726566")
//        centerText.text = text
//        centerText.font = UIFont(name: GlobalConstants.Font.AlegreyaSans_Bold, size: 18.0)
//        centerText.textAlignment = .left
//        centerImage.image = GlobalConstants.Images.title_logo
//        centerImage.contentMode = .center
//        centerView.addSubview(centerImage)
//        centerView.addSubview(centerText)
//        self.navigationController?.navigationBar.tintColor = GlobalConstants.Color.greyColor
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navBar"), for: UIBarMetrics.default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.addSubview(centerView)
//    }
//    
//    func addCenterImageOnNavigationBar() {
//        
//        removeSubViews()
//        self.navigationController?.isNavigationBarHidden = false
//        self.navigationItem.hidesBackButton = true
//        let centerImage = UIImageView(frame: CGRect(x: GetDevice.sharedInstance.getDeviceWidth() / 2 - 100, y: 0, width: 100, height: navigationBarHeight()))
//        centerImage.tag = NavBarTags.centerImage.rawValue
//        centerImage.image = GlobalConstants.Images.my_capital
//        centerImage.contentMode = .center
//        self.navigationController?.navigationBar.tintColor = GlobalConstants.Color.greyColor
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navBar"), for: UIBarMetrics.default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.addSubview(centerImage)
//    }

    func removeSubViews() {
        
        for view in self.navigationController!.navigationBar.subviews {
            switch view.tag {
            case NavBarTags.centerView.rawValue:
                view.removeFromSuperview()
                break
            case NavBarTags.centerImage.rawValue:
                view.removeFromSuperview()
                break
            default:
                break
            }
        }
    }
    
    func addCustomBackButton() {
        
        self.navigationController?.navigationBar.backItem?.hidesBackButton = false
//        self.navigationController?.navigationBar.backIndicatorImage = GlobalConstants.Images.back
//        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = GlobalConstants.Images.back
        self.navigationController?.navigationBar.backItem?.title = "Back"
    }
    
    func addLeftNavigationBarItemWithImage(image : UIImage, action : Selector) {
        
        let leftBarButton : UIBarButtonItem = UIBarButtonItem(image: image, style: UIBarButtonItemStyle.plain, target: self, action: action)
        navigationItem.leftBarButtonItem = leftBarButton;
    }
    
    func addRightNavigationBarItemWithImage(image : UIImage, action : Selector) {
        
        let rightBarButton : UIBarButtonItem = UIBarButtonItem(image: image, style: UIBarButtonItemStyle.plain, target: self, action: action)
        navigationItem.rightBarButtonItem = rightBarButton;
    }
    
    func addLeftNavigationBarItemWithTitle(title : String, action : Selector) {
        
        let leftBarButton : UIBarButtonItem = UIBarButtonItem(title: title, style: UIBarButtonItemStyle.plain, target: self, action: action)
        navigationItem.leftBarButtonItem = leftBarButton;
    }
    
    func addRightNavigationBarItemWithTitle(title : String, action : Selector) {
        
        let rightBarButton : UIBarButtonItem = UIBarButtonItem(title: title, style: UIBarButtonItemStyle.plain, target: self, action: action)
        navigationItem.rightBarButtonItem = rightBarButton;
    }

    func addLeftNavigationBarItemsWithImage(images : [UIImage], actions : [Selector]) {
        
        var items = [UIBarButtonItem]()
        for (image, action) in zip(images, actions) {
            
            let barButton : UIBarButtonItem = UIBarButtonItem(image: image, style: UIBarButtonItemStyle.plain, target: self, action: action)
            items.append(barButton)
        }
        navigationItem.leftBarButtonItems = items
    }
    
    func addRightNavigationBarItemsWithImage(images : [UIImage], actions : [Selector]) {
        
        var items = [UIBarButtonItem]()
        for (image, action) in zip(images, actions) {
            
            let barButton : UIBarButtonItem = UIBarButtonItem(image: image, style: UIBarButtonItemStyle.plain, target: self, action: action)
            items.append(barButton)
        }
        navigationItem.rightBarButtonItems = items
    }
    
    func addLeftNavigationBarItemsWithTitle(titles : [String], actions : [Selector]) {
        
        var items = [UIBarButtonItem]()
        for (title, action) in zip(titles, actions) {
            
            let barButton : UIBarButtonItem = UIBarButtonItem(title: title, style: UIBarButtonItemStyle.plain, target: self, action: action)
            items.append(barButton)
        }
        navigationItem.leftBarButtonItems = items
    }
    
    func addRightNavigationBarItemsWithTitle(titles : [String], actions : [Selector]) {
        
        var items = [UIBarButtonItem]()
        for (title, action) in zip(titles, actions) {
            
            let barButton : UIBarButtonItem = UIBarButtonItem(title: title, style: UIBarButtonItemStyle.plain, target: self, action: action)
            items.append(barButton)
        }
        navigationItem.rightBarButtonItems = items

    }
    
    func navigationBarHeight() -> CGFloat {
    
        return self.navigationController!.navigationBar.frame.size.height;
    }
    
    func removeNavigationBarItem() {
        
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItem = nil
    }
    
    func hideNavigationBar() {
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func moveBack() {
        
//        self.navigationController?.popViewController(animated: true)
    }
    
    func dismissController() {
        
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func addTapToHideKeyboard() {
       
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardOnViewTap))
        self.view.addGestureRecognizer(tap)
    }

    func dismissKeyboardOnViewTap() {
    
        self.view.endEditing(true)
    }
    
    func addHUD() {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = "Loading.."
    }
    
    func hideHUD() {
        let hud = MBProgressHUD(for: self.view)
        hud?.hide(animated: true)
    }
    
    var appDelegate : AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }

//    var isUserLogged_in : Bool {
//        
//        if let _ = LocalStore.getIsLogin() {
//            if let id = LocalStore.getClientID() {
//                if id > 0 {
//                    print("LocalStore.getClientID  ========  \(id)")
//                    return true
//                }
//                else {
//                    return false
//                }
//            }
//            else {
//                return false
//            }
//        }
//        else {
//            return false
//        }
//    }
    
//    var isPushActive : Bool {
//        
//        if let status = LocalStore.getPushStatus() {
//            if status {
//               return true
//            }
//            else {
//                return false
//            }
//        }
//        else {
//            return false
//        }
//    }

}

extension UIViewController {
    
    @IBAction func handleBack(_ sender: AnyObject) {
        
        self.moveBack()
    }
    @IBAction func handleInfo(_ sender: AnyObject) {
        
    }
    
    @IBAction func handleRightMenu(_ sender: AnyObject) {
        
    }
    
    @IBAction func handleLeftNav(_ sender: AnyObject) {
        
        self.toggleLeft()
    }
    
//    func sendDeviceDetailsToServer() {
//        
//        if isUserLogged_in {
//            if let deviceToken = LocalStore.getDeviceToken() {
//                let insertDeviceRequest = InsertDeviceDetailsRequest(deviceid: deviceToken, devicetype: GlobalConstants.appDetails.deviceType, userid: LocalStore.getClientID()!)
//                SOAPClient.sharedInstance.insertDeviceDetails(insertDetails: insertDeviceRequest) { (insertDeviceResponse, responseHandler) in
//                    
//                    DispatchQueue.main.async {
//                        let successClosure = { () -> () in }
//                        let failClosure = { () -> () in }
//                        let noInternetClosure = { () -> () in }
//                        let msgs = MessageToShow(by: nil, successMsg: nil)
//                        responseHandler.responseMessage(theVC: self, theMessages: msgs, responseObject: nil, failureBlock: failClosure, successBlock: successClosure, noInternetBlock : noInternetClosure)
//                    }
//                }
//            }
//        }
//    }

}
