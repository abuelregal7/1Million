//
//  EditProfileVC.swift
//  1Million
//
//  Created by Ahmed on 12/27/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import UIKit
import Alamofire

class EditProfileVC: UIViewController {

    @IBOutlet weak var btnChangePasswordOtlet: UIButton!
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var btnEditOutlet: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if #available(iOS 13.0, *) {
//            overrideUserInterfaceStyle = .dark
//        }

        btnChangePasswordOtlet.layer.cornerRadius = 17.0
        btnChangePasswordOtlet.layer.masksToBounds = true
        
        txtFullName.text = AppDelegate.global_user.name
        txtPhone.text = AppDelegate.global_user.mobile
        txtEmail.text = AppDelegate.global_user.email
        txtAddress.text = AppDelegate.global_user.city

        txtFullName.layer.cornerRadius = 25.0
        txtFullName.layer.masksToBounds = true
        txtFullName.setLeftPaddingPoints(8)
        txtFullName.setRightPaddingPoints(8)

        txtPhone.layer.cornerRadius = 25.0
        txtPhone.layer.masksToBounds = true
        txtPhone.setLeftPaddingPoints(8)
        txtPhone.setRightPaddingPoints(8)

        txtEmail.layer.cornerRadius = 25.0
        txtEmail.layer.masksToBounds = true
        txtEmail.setLeftPaddingPoints(8)
        txtEmail.setRightPaddingPoints(8)

        txtAddress.layer.cornerRadius = 25.0
        txtAddress.layer.masksToBounds = true
        txtAddress.setLeftPaddingPoints(8)
        txtAddress.setRightPaddingPoints(8)

        btnEditOutlet.layer.cornerRadius = 25.0
        btnEditOutlet.layer.masksToBounds = true
    }
    
    @IBAction func btnChangePassword(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ChangePasswordVC") as? ChangePasswordVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func btnUpdate(_ sender: Any) {
        if ((txtFullName.text?.isEmpty)! || (txtPhone.text?.isEmpty)! || (txtEmail.text?.isEmpty)! || (txtAddress.text?.isEmpty)!) {
                  let alert = UIAlertController(title: "Error", message: "please enter all of your information", preferredStyle: .alert)
                  let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                  alert.addAction(okAction)
                  self.present(alert, animated: false, completion: nil)
           
              } else {
                  updateuserdata()
              }
    }
    @IBAction func btnBack(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as? ProfileVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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
        let txtFullNameID = txtFullName.text!
        let txtPhoneID = txtPhone.text!
        let txtEmailID = txtEmail.text!
        let txtAddressID = txtAddress.text!
        let updateuserurl = "https://1millioneg.com/api/user/update/info"
        let parameters = [
            "name" : txtFullNameID,
            "mobile" : txtPhoneID,
            "city_id" : txtAddressID,
            "email" : txtEmailID
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
                    AppDelegate.global_user = User1(id: AppDelegate.global_user.id, name: txtFullNameID, mobile: txtPhoneID, token: AppDelegate.global_user.token, national_id: AppDelegate.global_user.national_id, email: txtEmailID, city: txtAddressID, image: "image")

                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC
                    self.present(nextViewController, animated:true, completion:nil)
            }
        }
    }
}
