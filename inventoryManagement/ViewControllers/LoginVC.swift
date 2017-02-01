//
//  LoginVC.swift
//  inventoryManagement
//
//  Created by Sushobhit_BuiltByBlank on 1/30/17.
//  Copyright © 2017 sushobhit. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var userIdTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginBtnAction(_ sender: Any) {
        self.dismissKeyboardOnViewTap()
        self.openRootVC()
    }
    
    func openRootVC() {
        
        let rootVCObj = ClientsVC(nibName: "ClientsVC", bundle: nil)
        let leftVC = LeftMenuVC(nibName: "LeftMenuVC", bundle: nil)
        let navController = UINavigationController(rootViewController: rootVCObj)
        let slideMenuController = SlideMenuController(mainViewController:navController, leftMenuViewController: leftVC)
        let appDelegate  = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = slideMenuController
    }

    func setUpUI(){
        addTapToHideKeyboard()
        self.userIdTF.delegate = self
        self.passwordTF.delegate = self
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension LoginVC: UITextFieldDelegate {
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case userIdTF:
            passwordTF.becomeFirstResponder()
            return false
        case passwordTF:
            passwordTF.resignFirstResponder()
            return true
        default:
            passwordTF.resignFirstResponder()
            return true
        }
    }
}
