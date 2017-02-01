//
//  LeftMenuVC.swift
//  inventoryManagement
//
//  Created by Sushobhit_BuiltByBlank on 1/31/17.
//  Copyright © 2017 sushobhit. All rights reserved.
//

import UIKit

enum MenuDetail {
    
    case items(String,Bool)
    
    func getMenuName() -> (name : String, isSelected : Bool) {
        
        switch self {
        case .items(let name, let isSelected):
            return (name,isSelected)
        }
    }
    
    mutating func makeSelected() {
        switch self {
        case .items(let name, _):
            let toggleState = true
            self = .items(name, toggleState)
        }
    }
    
    mutating func makeUnselected() {
        switch self {
        case .items(let name, _):
            let toggleState = false
            self = .items(name, toggleState)
        }
    }
}

enum AdminLeftMenuItem : Int {
    case Clients = 0
    case Users
    case FindAProduct
    case ChangePassword
    case Logout
}

protocol LeftMenuProtocol : class {
    
    func changeViewController(menu: AdminLeftMenuItem)
}

class LeftMenuVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var menuTitleLable: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var menuDetailList = [MenuDetail]()
    var menuVCList = [UIViewController]()
    let cellIdentifier = "leftMenuCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuTitleLable.text = "WELCOME ADMIN"
        setUPTV()
        setUpAdminMenuDetailList()
        setUpAdminmenuVCList()
    }
    
    override func viewWillAppear(_ animated: Bool) {

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - BUTTON ACTIONS
    // MARK: - TABLEVIEW DATASOURCE METHOD
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuVCList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! LeftMenuCell
        let menuDetail = menuDetailList[indexPath.row]
        let detail = menuDetail.getMenuName()
        if detail.isSelected {
            cell.contentView.backgroundColor = Constant.Colors.leftCellSelectedBgColor
        }
        else {
            cell.contentView.backgroundColor = UIColor.clear
        }
        cell.titleLabel.text = detail.name
        cell.backgroundView = nil
        cell.selectedBackgroundView = nil;
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    
    // MARK: - TABLEVIEW DELEGATE METHOD
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.makeRowSelected(at: indexPath.row)
        tableView.reloadData()
        if let menu = AdminLeftMenuItem(rawValue: indexPath.row) {
            self.changeViewController(menu : menu)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setUPTV(){
        self.tableView.register(UINib(nibName: "LeftMenuCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.showsHorizontalScrollIndicator = false
    }
    
    func setUpAdminMenuDetailList() {
        
        let dashboardDetail = MenuDetail.items("ClIENTS",true)
        let myProfileDetail = MenuDetail.items("USERS", false)
        let aboutDetail = MenuDetail.items("FIND A PRODUCT", false)
        let policyDetail = MenuDetail.items("CHANGE PASSWORD", false)
        let logoutDetail = MenuDetail.items("LOGOUT", false)
        
        menuDetailList.append(dashboardDetail)
        menuDetailList.append(myProfileDetail)
        menuDetailList.append(aboutDetail)
        menuDetailList.append(policyDetail)
        menuDetailList.append(logoutDetail)
        
    }
    
    func setUpAdminmenuVCList() {
        
        let ClientsVCInstance =  ClientsVC(nibName: "ClientsVC", bundle: nil)
        let clientsVC = UINavigationController(rootViewController: ClientsVCInstance)
        
        let UsersVCInstance =  UsersVC(nibName: "UsersVC", bundle: nil)
        let usersVC = UINavigationController(rootViewController: UsersVCInstance)
        
        let FIndAProductVCInstance =  FIndAProductVC(nibName: "FIndAProductVC", bundle: nil)
        let findAProductVC = UINavigationController(rootViewController: FIndAProductVCInstance)
        
        let ChangePassVCInstance =  ChangePassVC(nibName: "ChangePassVC", bundle: nil)
        let changePassVC = UINavigationController(rootViewController: ChangePassVCInstance)
        
        let LogoutVCInstance =  LogoutVC(nibName: "LogoutVC", bundle: nil)
        let logoutVC = UINavigationController(rootViewController: LogoutVCInstance)
        
        menuVCList.append(clientsVC)
        menuVCList.append(usersVC)
        menuVCList.append(findAProductVC)
        menuVCList.append(changePassVC)
        menuVCList.append(logoutVC)
    }

}

extension LeftMenuVC : LeftMenuProtocol {
    
    func makeRowSelected(at index : Int) {
        
        for i in 0 ..< menuDetailList.count {
            var menu = menuDetailList[i]
            if i == index {
                menu.makeSelected()
            }
            else {
                menu.makeUnselected()
            }
            menuDetailList[i] = menu
        }
    }
    
    func changeViewController(menu: AdminLeftMenuItem) {
        
        switch menu {
//        case .Logout:
//            
//            let logoutDetail = menuDetailList.last
//            if logoutDetail?.getMenuName().name == "Logout" {
//                SwiftAlert().showWithCancelAndOk(title: "Logout", okTitle: "Logout", cancelTitle: "Cancel", message: "Are you sure you want to logout ?", viewController: self, okAction: {
//                    
////                    LocalStore.logout()
//                    self.makeRowSelected(at: 0)
//                    self.tableView.reloadData()
//                    self.slideMenuController()?.changeMainViewController(mainViewController: self.menuVCList[AdminLeftMenuItem.Clients.rawValue], close: true)
//                }, cancelAction: {
//                })
//            }
//            else {
//                let loginvc =  LoginVC(nibName: "LoginVC", bundle: nil)
////                loginvc.isCameFromLeftMenu = true
//                let loginNav = UINavigationController(rootViewController: loginvc)
//                self.slideMenuController()?.changeMainViewController(mainViewController: loginNav, close: true)
//            }
//            break
////        case .Profile :
////            checkMyProfileForLogin()
////            break
        default:
            self.slideMenuController()?.changeMainViewController(mainViewController: menuVCList[menu.rawValue], close: true)
        }
    }
    
//    func checkMyProfileForLogin() {
//        
//        if isUserLogged_in {
//            self.slideMenuController()?.changeMainViewController(mainViewController: menuVCList[LeftMenuItem.Profile.rawValue], close: true)
//        }
//        else {
//            self.askForLogin()
//        }
//    }
    
//    func askForLogin() {
//        
//        SwiftAlert().showWithCancelAndOk(title: "Login", okTitle: "Login", cancelTitle: "Cancel", message: "Please login to continue", viewController: self, okAction: {
//            let loginvc =  LoginVC(nibName: "LoginVC", bundle: nil)
//            loginvc.isCameFromLeftMenu = true
//            let loginNav = UINavigationController(rootViewController: loginvc)
//            self.slideMenuController()?.changeMainViewController(mainViewController: loginNav, close: true)
//        }, cancelAction: { })
//    }
}

