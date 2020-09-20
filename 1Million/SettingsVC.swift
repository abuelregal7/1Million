//
//  SettingsVC.swift
//  1Million
//
//  Created by Ahmed on 12/27/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    @IBOutlet weak var btnLogOutOutlet: UIButton!
    @IBOutlet weak var lblVersion: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            lblVersion.text = version
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if #available(iOS 13.0, *) {
//            overrideUserInterfaceStyle = .dark
//        }
        
        btnLogOutOutlet.layer.cornerRadius = 25.0
        btnLogOutOutlet.layer.masksToBounds = true
    }
    
    @IBAction func btnBack(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    @IBAction func btnPrivacy(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "PrivacyVC") as? PrivacyVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func btnPolicy(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "PolicyVC") as? PolicyVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func btnAboutUs(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AboutUsVC") as? AboutUsVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func btnContactUs(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ContactUsVC") as? ContactUsVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func btnShareApp(_ sender: Any) {
        let text = "Hey! Lets Download 1Million App \(kAPPURL)"
        let objectsToShare: [Any] = [text]
        let activityViewController = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.setValue("Lets Download 1Million App", forKey: "subject")
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    @IBAction func btnLogOut(_ sender: Any) {
        UserDefaults.standard.setValue(nil, forKey: "token")
               UserDefaults.standard.synchronize()
               let storyBoard : UIStoryboard = UIStoryboard (name : "Main",bundle : nil)
               let nextvc = storyBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
               self.present(nextvc,animated: false,completion: nil)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
