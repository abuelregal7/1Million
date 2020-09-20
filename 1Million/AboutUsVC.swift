//
//  AboutUsVC.swift
//  1Million
//
//  Created by Ahmed on 12/27/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import UIKit
import Alamofire

class AboutUsVC: UIViewController {

    @IBOutlet weak var txtAbout: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if #available(iOS 13.0, *) {
//            overrideUserInterfaceStyle = .dark
//        }
        
         getAbout()
    }
    
    @IBAction func btnBack(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SettingsVC") as? SettingsVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func getAbout() {
        txtAbout.text = ""
        let getabouturl = "https://1millioneg.com/api/about-app"
        
        Alamofire.request(getabouturl).responseJSON { response in
                let result = response.result
                print("the response is 1 : \(result)")
                if let arrayOfDic = result.value as? Dictionary<String, AnyObject> {
                     let aboutdata = arrayOfDic["data"] as! String
                    print("\(arrayOfDic)")
                    self.txtAbout.text = "\(aboutdata)"
                    self.txtAbout.isEditable = false
            }
        }
    }
}
