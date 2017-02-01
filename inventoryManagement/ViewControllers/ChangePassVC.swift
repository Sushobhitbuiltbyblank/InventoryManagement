//
//  ChangePassVC.swift
//  inventoryManagement
//
//  Created by Sushobhit_BuiltByBlank on 1/31/17.
//  Copyright © 2017 sushobhit. All rights reserved.
//

import UIKit

class ChangePassVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpUI()
    {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "sliderMenu"), style: .plain, target: self, action: #selector(toggleLeft))
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.black
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
