//
//  LoginVC.swift
//  1Million
//
//  Created by Ahmed on 12/27/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import UIKit
import Alamofire

class LoginVC: UIViewController {

    @IBOutlet weak var txtIdNumber: UITextField!
    @IBOutlet weak var txtPasswordView: UIView!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLoginOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if #available(iOS 13.0, *) {
//            overrideUserInterfaceStyle = .dark
//        }
        
        txtIdNumber.layer.cornerRadius = 25.0
        txtIdNumber.layer.masksToBounds = true
        txtIdNumber.setLeftPaddingPoints(8)
        txtIdNumber.setRightPaddingPoints(8)
        
        txtPasswordView.layer.cornerRadius = 25.0
        txtPasswordView.layer.masksToBounds = true
        
        btnLoginOutlet.layer.cornerRadius = 25.0
        btnLoginOutlet.layer.masksToBounds = true
    }
    
    @IBAction func btnBack(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
              let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
              self.present(nextViewController, animated:true, completion:nil)
    }
    
    @IBAction func btnHidePassword(_ sender: Any) {
        if (txtPassword.isSecureTextEntry == false) {
            txtPassword.isSecureTextEntry = true
        } else {
            txtPassword.isSecureTextEntry = false
        }
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        if ((txtIdNumber.text?.isEmpty)! || (txtPassword.text?.isEmpty)!) {
            let alert = UIAlertController(title: "تنبيه !", message: "برجاء ادخال كافة بياناتك", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "موافق", style: .cancel, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: false, completion: nil)
        } else {
            self.getSignInData()
        }
    }
    
    @IBAction func btnForgetPassword(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ForgetPasswordVC") as! ForgetPasswordVC
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    @IBAction func btnRegister(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func getSignInData() {
        let txtIdNumberId = txtIdNumber.text!
        let txtPasswordId = txtPassword.text!
        let loginurl = "https://1millioneg.com/api/auth/login"
        let parameters = [
            "national_id" : txtIdNumberId,
            "password" : txtPasswordId
        ]
            
            Alamofire.request(loginurl, method: .post, parameters: parameters)
                .responseJSON { response in
                    let result = response.result
                    print(parameters)
                    print(loginurl)
                    print("the response is 1 : \(result)")
                    if ("\(result)" != "SUCCESS") {
                        let alert = UIAlertController(title: "تنبيه !", message: "برجاء ادخال بياناتك الصحيحة", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "موافق", style: .cancel, handler: nil)
                        alert.addAction(okAction)
                        self.present(alert, animated: true, completion: nil)
                    } else {
                    if let arrayOfDic = result.value as? Dictionary<String, AnyObject> {
                        let userdata = arrayOfDic["meta"] as? Dictionary<String, AnyObject>
                        let token = userdata?["token"] as! String
                        let userdat = arrayOfDic["data"]
                        let id = userdat?["id"] as! Int
                        let mobile = userdat?["mobile"] as! String
                        let name = userdat?["name"] as! String
                        let email = userdat?["email"] as! String
                        let city = userdat?["city"] as! String
                        let national_id = userdat?["national_id"] as! String
                        print(token)
                        UserDefaults.standard.set(token, forKey: "token")
                        UserDefaults.standard.synchronize()
                                          
                        UserDefaults.standard.set(name, forKey: "name")
                        UserDefaults.standard.synchronize()
                                          
                        UserDefaults.standard.set(mobile, forKey: "mobile")
                        UserDefaults.standard.synchronize()
                        
                        AppDelegate.global_user = User1(id: id, name: name, mobile: mobile, token: token, national_id: national_id, email: email, city: city, image: "image")
                        AppDelegate.login = true
                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC
                        self.present(nextViewController, animated:true, completion:nil)
                }
            }
        }
    }
}
