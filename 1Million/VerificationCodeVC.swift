//
//  VerificationCodeVC.swift
//  1Million
//
//  Created by Ahmed on 12/27/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import UIKit

class VerificationCodeVC: UIViewController {
    
    @IBOutlet weak var txtCode: UITextField!
    @IBOutlet weak var btnVerifyCodeOutlet: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if #available(iOS 13.0, *) {
//            overrideUserInterfaceStyle = .dark
//        }
        
        txtCode.layer.cornerRadius = 25.0
        txtCode.layer.masksToBounds = true
        txtCode.setLeftPaddingPoints(8)
        txtCode.setRightPaddingPoints(8)
        
        btnVerifyCodeOutlet.layer.cornerRadius = 25.0
        btnVerifyCodeOutlet.layer.masksToBounds = true
    }
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnVerifyCode(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
