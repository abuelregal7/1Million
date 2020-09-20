//
//  ChangePasswordVC.swift
//  1Million
//
//  Created by Ahmed on 2/5/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import UIKit
import Alamofire

class ChangePasswordVC: UIViewController {

    @IBOutlet weak var txtCurrentPassword: UITextField!
    @IBOutlet weak var txtNewPassword: UITextField!
    @IBOutlet weak var txtConfirmNewPassword: UITextField!
    @IBOutlet weak var btnSaveOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if #available(iOS 13.0, *) {
//            overrideUserInterfaceStyle = .dark
//        }
        
        txtCurrentPassword.layer.cornerRadius = 25.0
        txtCurrentPassword.layer.masksToBounds = true
        txtCurrentPassword.setLeftPaddingPoints(8)
        txtCurrentPassword.setRightPaddingPoints(8)
        
        txtNewPassword.layer.cornerRadius = 25.0
        txtNewPassword.layer.masksToBounds = true
        txtNewPassword.setLeftPaddingPoints(8)
        txtNewPassword.setRightPaddingPoints(8)
        
        txtConfirmNewPassword.layer.cornerRadius = 25.0
        txtConfirmNewPassword.layer.masksToBounds = true
        txtConfirmNewPassword.setLeftPaddingPoints(8)
        txtConfirmNewPassword.setRightPaddingPoints(8)
        
        btnSaveOutlet.layer.cornerRadius = 25.0
        btnSaveOutlet.layer.masksToBounds = true
    }
    
    @IBAction func btnBack(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as? ProfileVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func btnSave(_ sender: Any) {
        
        updateuserdata()
        
    }
    
    
    func updateuserdata(){
        
        guard let token = UserDefaults.standard.object(forKey: "token") as? String else {
            let alert = UIAlertController(title: "Error", message: "Please enter all of your correct information", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            return
        }
        //let headers = ["Authorization": "Bearer \(AppDelegate.global_user.token)"]
        let currentpass = txtCurrentPassword.text!
        let newPass = txtNewPassword.text!
        let confirmNewPass = txtConfirmNewPassword.text!
        
        let updateuserurl = "https://1millioneg.com/api/user/update/password"
        let parameters = [
            
            "old_password" : currentpass,
            "password" : newPass,
            "password_confirmation" : confirmNewPass
            
        ]
        
        
        //
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 10800
        manager.session.configuration.timeoutIntervalForResource = 10800
        var headers = Alamofire.SessionManager.defaultHTTPHeaders
        // add your custom header
        headers["Accept"] = "application/json"
        headers["Content-Type"] = "application/json"
        if(AppDelegate.global_user.token != nil) {
            headers["Authorization"] = "Bearer \(AppDelegate.global_user.token)"
        }
        
        //
        
        
        
        Alamofire.request(updateuserurl, method: .post, parameters: parameters,headers: headers)
            .responseJSON { response in
                let result = response.result
                print("the response is 1 : \(result)")
                if let arrayOfDic = result.value as? Dictionary<String, AnyObject> {
                    print(arrayOfDic)
                    //AppDelegate.global_user = User1(id: AppDelegate.global_user.id, name: AppDelegate.global_user.name, mobile: AppDelegate.global_user.mobile, token: AppDelegate.global_user.token, national_id: AppDelegate.global_user.national_id, email: AppDelegate.global_user.email, city: AppDelegate.global_user.city, image: "image")
                    
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC
                    self.present(nextViewController, animated:true, completion:nil)
                }
        }
    }
    

}
