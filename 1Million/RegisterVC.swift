//
//  RegisterVC.swift
//  1Million
//
//  Created by Ahmed on 12/27/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Photos
class RegisterVC: UIViewController ,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var txtIdNumber: UITextField!
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var btnImageView: UIView!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var btnCityView: UIView!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtPasswordView: UIView!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnRegisterOutlet: UIButton!
    
    let signupurl = "https://1millioneg.com/api/auth/register"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if #available(iOS 13.0, *) {
//            overrideUserInterfaceStyle = .dark
//            
//        }
        
        img.layer.cornerRadius = 10
        img.layer.masksToBounds = true
        //
        txtIdNumber.layer.cornerRadius = 25.0
        txtIdNumber.layer.masksToBounds = true
        txtIdNumber.setLeftPaddingPoints(8)
        txtIdNumber.setRightPaddingPoints(8)
        
        txtFullName.layer.cornerRadius = 25.0
        txtFullName.layer.masksToBounds = true
        txtFullName.setLeftPaddingPoints(8)
        txtFullName.setRightPaddingPoints(8)
        
        btnImageView.layer.cornerRadius = 25.0
        btnImageView.layer.masksToBounds = true
        
        txtPhone.layer.cornerRadius = 25.0
        txtPhone.layer.masksToBounds = true
        txtPhone.setLeftPaddingPoints(8)
        txtPhone.setRightPaddingPoints(8)
        
        txtEmail.layer.cornerRadius = 25.0
        txtEmail.layer.masksToBounds = true
        txtEmail.setLeftPaddingPoints(8)
        txtEmail.setRightPaddingPoints(8)
        
        btnCityView.layer.cornerRadius = 25.0
        btnCityView.layer.masksToBounds = true
        
        txtPasswordView.layer.cornerRadius = 25.0
        txtPasswordView.layer.masksToBounds = true
        
        btnRegisterOutlet.layer.cornerRadius = 25.0
        btnRegisterOutlet.layer.masksToBounds = true
    }
    
    @IBOutlet weak var img: UIImageView!
    @IBAction func btnCamera(_ sender: Any) {
        
        let actionSheet = UIAlertController(title : nil, message : nil, preferredStyle : .actionSheet)
               actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (alert : UIAlertAction!) in
                   self.camera()
               }))
               
               
               actionSheet.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { (alert : UIAlertAction!) in
                   self.photoLibrary()
               }))
               
               actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
               
               self.present(actionSheet, animated: true, completion: nil)
           
    }
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnHidePassword(_ sender: Any) {
        if (txtPassword.isSecureTextEntry == false) {
            txtPassword.isSecureTextEntry = true
        } else {
            txtPassword.isSecureTextEntry = false
        }
    }
    
//    let IdNumber = self.txtIdNumber.text!
//    let Name = self.txtFullName.text!
//    let NationalImage = self.img.image!
//    let PhoneNumer = self.txtPhone.text!
//    let Email = self.txtEmail.text!
//    let Password = self.txtPassword.text!
//    let City = self.txtCity.text!
    
    @IBAction func btnRegister(_ sender: Any) {
        //uplaodImages(image: UIImage(named: "\(self.img!.image as! UIImage?)"))
        
        getSignUpData()
        
        //uploadImage3()
        
//        guard let IdNumber = txtIdNumber.text, !IdNumber.isEmpty else { return}
//        guard let Name = txtFullName.text, !Name.isEmpty else { return}
//        guard let NationalImage = img.image /*!NationalImage.isEmpty*/ else { return}
//        guard let PhoneNumer = txtPhone.text, !PhoneNumer.isEmpty else { return}
//        guard let Email = txtEmail.text, !Email.isEmpty else { return}
//        guard let Password = txtIdNumber.text, !Password.isEmpty else { return}
//        guard let City = txtPassword.text, !City.isEmpty else { return}
//
//        register(/*IdNumber: "\(IdNumber)" , Name: Name, NationalImage: NationalImage, PhoneNumer: PhoneNumer, Email: Email, Password: Password, City: City*/) { (error: Error? , success: Bool) in
//
//            if success {
//                // say welcome
//                print("say welcome")
//
//            }else{
//                //say sorry try again
//                print("say sorry try again")
//            }
//        }
        
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    func camera()
       {
           if UIImagePickerController.isSourceTypeAvailable(.camera)
           {
               let myPickerController = UIImagePickerController()
               myPickerController.delegate = self;
               myPickerController.sourceType = .camera
               self.present(myPickerController, animated : true, completion : nil)
               
           }
           else
           {
               let alert = UIAlertController(title: "Error", message: "camera not available", preferredStyle: .alert)
               let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
               alert.addAction(okAction)
               self.present(alert, animated: true, completion: nil)
               
               print("camera not available")
           }
       }
       func photoLibrary()
       {
           if UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
           {
               let myPickerController = UIImagePickerController()
               myPickerController.delegate = self;
               myPickerController.sourceType = .photoLibrary
               self.present(myPickerController, animated : true, completion : nil)
               
           }
       }
     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }

        // Set photoImageView to display the selected image.
        img.image = selectedImage

        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    ////////
    
    func aaaaaaaa() {
        
        
        
    }
    
    ///////
    
    
    func getSignUpData() {
        
        let IdNumber = txtIdNumber.text!
        let Name = txtFullName.text!
        let NationalImage = img.image!
        let PhoneNumer = txtPhone.text!
        let Email = txtEmail.text!
        let Password = txtPassword.text!
        let City = txtCity.text!
        
        let signupurl = "https://1millioneg.com/api/auth/register"
        let parameters = [
            "national_id" : IdNumber,
            "name" : Name,
            "national_id_image" : NationalImage,
            "mobile" : PhoneNumer,
            "email" : Email,
            "password" :Password,
            "city_id" : City,
            
           
            ] as [String : Any]
        
        //
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 10800
        manager.session.configuration.timeoutIntervalForResource = 10800
        var headers = Alamofire.SessionManager.defaultHTTPHeaders
        // add your custom header
        headers["Accept"] = "application/json"
        headers["Content-Type"] = "application/x-www-form-urlencoded"
//        if(AppDelegate.global_user.token != "") {
//            headers["Authorization"] = "Bearer \(AppDelegate.global_user.token)"
//        }
        
        
        
        Alamofire.request(signupurl, method: .post, parameters: parameters, headers: headers)
            .responseJSON { response in
                let result = response.result
                print(parameters)
                print(signupurl)
                print("the response is 1 : \(result)")
                if let arrayOfDic = result.value as? Dictionary<String, AnyObject> {
                    let userdata = arrayOfDic["meta"] as? Dictionary<String, AnyObject>
                    let token = userdata?["token"] as! String
                    let userdat = arrayOfDic["data"]
                    let id = userdat?["id"] as! Int
                    let mobile = userdat?["mobile"] as! String
                    let name = userdat?["name"] as! String
                    let national_id = userdat?["national_id"] as! String
                    let email = userdat?["email"] as! String
                    let city = userdat?["city_id"] as! String
                    
                    UserDefaults.standard.set(token, forKey: "token")
                    UserDefaults.standard.synchronize()

                    UserDefaults.standard.set(name, forKey: "name")
                    UserDefaults.standard.synchronize()

                    UserDefaults.standard.set(mobile, forKey: "mobile")
                    UserDefaults.standard.synchronize()
                    
                    print(token)
                    AppDelegate.global_user = User1(id: id, name: name, mobile: mobile, token: token, national_id: national_id, email: email, city: city, image: "image")
                    AppDelegate.login = true
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC
                    self.present(nextViewController, animated:true, completion:nil)
            }
        }
    }
    
    
    
//    func updateProfile() {
//
//
//
//        let IdNumber = txtIdNumber.text!
//        let Name = txtFullName.text!
//        let NationalImage = img.image!
//        let PhoneNumer = txtPhone.text!
//        let Email = txtEmail.text!
//        let Password = txtPassword.text!
//        let City = txtCity.text!
//
//            let parameters : [String:Any] =
//         [
//            "national_id" : IdNumber,
//            "name" : Name,
//            "national_id_image" : NationalImage,
//            "mobile" : PhoneNumer,
//            "email" : Email,
//            "password" :Password,
//            "city_id" : City
//        ]
//
//
//            let url = ""
//            print(url)
//            Alamofire.upload(multipartFormData: { (multipartFormData) in
//                for (key, value) in parameters {
//                    multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
//                }
//
//                 if let data =
//                    multipartFormData.append(data, withName: "image", fileName: "image.png", mimeType: "image/png")
//
//
//            }, usingThreshold: UInt64.init(), to: url, method: .post) { (result) in
//                switch result{
//                case .success(let upload, _, _):
//                    upload.responseJSON { response in
//                        print("Succesfully uploaded  = \(response)")
//                        if let err = response.error{
//
//                            print(err)
//                            return
//                        }
//
//                    }
//                case .failure(let error):
//                    print("Error in upload: \(error.localizedDescription)")
//
//                }
//            }
//
//
//    }
    
    //imgData = defectImage.jpeg(.medium)
    //UIImageJPEGRepresentation((self.userImage!.image as! UIImage?)!, 0.5)!
    
    
    func uplaodImages(image:UIImage?){
        Alamofire.upload(multipartFormData: { multipartFormData in
            
            let IdNumber = self.txtIdNumber.text!
            let Name = self.txtFullName.text!
            let NationalImage = self.img.image!
            let PhoneNumer = self.txtPhone.text!
            let Email = self.txtEmail.text!
            let Password = self.txtPassword.text!
            let City = self.txtCity.text!
            
            
            let params : [String : Any] = [
                "national_id" : IdNumber,
                "name" : Name,
                "national_id_image" : NationalImage,
                "mobile" : PhoneNumer,
                "email" : Email,
                "password" :Password,
                "city_id" : City,
                "image" : "image"
                
                
                
               ]
            for (key, value) in params {
                if let data = "\(value)".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue)) {
                    multipartFormData.append(data, withName: key)
                }
            }
            let imageData:Data = image?.jpegData(compressionQuality: 0.75)! as! Data!
            //let imageData1 = UIImageJPEGRepresentation((self.img!.image as! UIImage?)!, 0.5)!
            //multipartFormData.append(imageData, withName: "image", fileName: "image.jpeg", mimeType: "image/jpeg")
//            print("success");
        },
                         to: self.signupurl,method:HTTPMethod.post,
                         headers:nil, encodingCompletion: { encodingResult in
                            switch encodingResult {
                            case .success(let upload, _, _):
                                upload
                                    .validate()
                                    .responseJSON { response in
                                        switch response.result {
                                        case .success(let value):
                                            print("responseObject: \(value)")
                                            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                                            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
                                            self.present(nextViewController, animated:true, completion:nil)
                                            return
                                        case .failure(let responseError):
                                            print("responseError: \(responseError)")
                                            let alert = UIAlertController(title: "Error", message: "error", preferredStyle: .alert)
                                            let okAction = UIAlertAction(title: "ok", style: .default) { (action: UIAlertAction!) in

                                                //                                                let storyBoard : UIStoryboard = UIStoryboard (name : "Main",bundle : nil)
                                                //                                                let nextvc = storyBoard.instantiateViewController(withIdentifier: "location") as! location
                                                //                                                self.present(nextvc,animated: true,completion: nil)
                                                return
                                            }
                                            alert.addAction(okAction)
                                            self.present(alert, animated: true, completion: nil)
                                            return
                                        }
                                }
                            case .failure(let encodingError):
                                print("encodingError: \(encodingError)")
                            }
        })
    }
    
    
    func signUp() {
        
        // User "authentication":
        let IdNumber = txtIdNumber.text!
        let Name = txtFullName.text!
        let NationalImage = img.image!
        let PhoneNumer = txtPhone.text!
        let Email = txtEmail.text!
        let Password = txtPassword.text!
        let City = txtCity.text!
        
        let parameters : [String:Any] =
            [
                "national_id" : self.txtIdNumber.text!,
                "name" : self.txtFullName.text!,
                "national_id_image" : self.img.image!,
                "mobile" : self.txtPhone.text!,
                "email" : self.txtEmail.text!,
                "password" :self.txtPassword.text!,
                "city_id" : self.txtCity.text!,
                "image" : "image"
                
        //let IdNumber = self.txtIdNumber.text!
        //    let Name = self.txtFullName.text!
        //    let NationalImage = self.img.image!
        //    let PhoneNumer = self.txtPhone.text!
        //    let Email = self.txtEmail.text!
        //    let Password = self.txtPassword.text!
        //    let City = self.txtCity.text!
        ]
        
             // Image to upload:
        let imageToUploadURL = Bundle.main.url(forResource: "image", withExtension: "jpeg")!
        
             // Server address (replace this with the address of your own server):
             let url = "https://1millioneg.com/api/auth/register"
        
             // Use Alamofire to upload the image
             Alamofire.upload(
                     multipartFormData: { multipartFormData in
                             // On the PHP side you can retrive the image using $_FILES["image"]["tmp_name"]
                             multipartFormData.append(imageToUploadURL, withName: "image")
                             for (key, val) in parameters {
                                     multipartFormData.append("\(val)".data(using: String.Encoding.utf8)!, withName: key)
                                 }
                     },
                     to: url,
                     encodingCompletion: { encodingResult in
                         switch encodingResult {
                         case .success(let upload, _, _):
                             upload.responseJSON { response in
                                 if let jsonResponse = response.result.value as? [String: Any] {
                                     print(jsonResponse)
                                 }
                             }
                         case .failure(let encodingError):
                             print(encodingError)
                         }
                 }
                 )
         }
    
    
    //    "id": 103139,
    //    "name": "Kareem Elsharkawy",
    //    "mobile": "01097609401",
    //    "email": "kareimovi93ch@gmail.com",
    //    "national_id": "74934567844443",
    //    "image": "https://1millioneg.com/storage/users/default.png",
    //    "national_id_image": "https://1millioneg.com/storage",
    //    "city": "القاهرة",
    //    "fawry_code": null,
    //    "payment_status": true,
    //    "credit_amount": 99,
    //    "created_at": "2020-02-17T15:48:30.000000Z",
    //    "updated_at": "2020-02-17T15:48:30.000000Z"
    
    func register(/*IdNumber: Int, Name: String, NationalImage: String,PhoneNumer: String,Email: String,Password: String,City: String,*/ completion: @escaping (_ error: Error? , _ success: Bool)->Void) {
        
        let url = signupurl
        let parametars:[String : Any] = [
            "national_id" : self.txtIdNumber.text!,
            "name" : self.txtFullName.text!,
            "national_id_image" : self.img.image!,
            "mobile" : self.txtPhone.text!,
            "email" : self.txtEmail.text!,
            "password" :self.txtPassword.text!,
            "city_id" : self.txtCity.text!,
            "image" : "image"
            ]
        Alamofire.request(url, method: .post, parameters: parametars, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                switch response.result
                {
                case .failure(let error):
                    completion(error,false)
                    print(error)
                case .success(let value):
                    
                    print(value)
                    // work with swifty json
                    let json = JSON(value)
                    if let token = json["meta"]["token"].string{
                        print("token = \(token)")
                        
                        //save token to user default
                        //helper.saveApiToken(token: token)
                        
                        completion(nil,true)
                    }
                }
        }
        
    }
    
    func uploadImageAndData(){
        
//        let periode = periodeField.text
//        let kode_wilayah = kodeWilayahField.text
//        let nama_petugas = namaPetugasField.text
//        let upload_file = myImageView.image
        
            let IdNumber = self.txtIdNumber.text
            let Name = self.txtFullName.text
            let NationalImage = self.img.image
            let PhoneNumer = self.txtPhone.text
            let Email = self.txtEmail.text
            let Password = self.txtPassword.text
            let City = self.txtCity.text
        
        //var parameters = [String:AnyObject]()
//        parameters = ["periode":periode,
//                      "kode_wilayah":kode_wilayah,
//                      "nama_petugas":nama_petugas,
//                      "uploaded_file": upload_file] as [String : AnyObject]
        
        var parameters = [String:Any]()
        //var parameters: [String:Any] =
            parameters =
        [
            "national_id" : self.txtIdNumber.text!,
            "name" : self.txtFullName.text!,
            "national_id_image" : self.img.image!,
            "mobile" : self.txtPhone.text!,
            "email" : self.txtEmail.text!,
            "password" :self.txtPassword.text!,
            "city_id" : self.txtCity.text!,
            "image" : "image"
                ]
        
        let URL = "https://1millioneg.com/api/auth/register"
        
        Alamofire.upload(
            multipartFormData: { (multipartFormData) in
//                if let imageData = NationalImage?.jpegData(compressionQuality: 0.3){
//                    multipartFormData.append(imageData, withName: "image")
//                }
                let imageData = NationalImage?.jpegData(compressionQuality: 0.3)
                if let data = imageData{
                    multipartFormData.append(data, withName: "image", fileName: "image.png", mimeType: "image/png")
                }
                

                for (key, val) in parameters {
                    multipartFormData.append(("\(val)" as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key as String)
                }
        },/*usingThreshold:UInt64.init(),*/
            to:URL)
        { (result) in
            switch result {
            case .success(let upload, _ , _):
                upload.uploadProgress(closure: { (progress) in
                    //print("uploding")
                    print("Upload Progress: \(progress.fractionCompleted)")
                })
                upload.responseJSON { response in
                    debugPrint(response)
                    print("done")
                    print(response.result.value)
                }
            case .failure(let encodingError):
                print("failed")
                print(encodingError)
            }
        }
    }
    
    func uplaodImages2(){
        
        var imageToUpload:UIImage = UIImage()
        //let picture = showPicture.image
        //Prescription
        imageToUpload = img.image!
        
        let IdNumber = self.txtIdNumber.text
        let Name = self.txtFullName.text
        let NationalImage = self.img.image
        let PhoneNumer = self.txtPhone.text
        let Email = self.txtEmail.text
        let Password = self.txtPassword.text
        let City = self.txtCity.text
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            var parameters = [String:Any]()
            //var parameters: [String:Any] =
            parameters =
                [
                    "national_id" : self.txtIdNumber.text!,
                    "name" : self.txtFullName.text!,
                    "national_id_image" : self.img.image!,
                    "mobile" : self.txtPhone.text!,
                    "email" : self.txtEmail.text!,
                    "password" :self.txtPassword.text!,
                    "city_id" : self.txtCity.text!,
                    "image" : "image"
            ]
            for (key, val) in parameters {
                multipartFormData.append(("\(val)" as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key as String)
            }
            //UIImageJPEGRepresentation((self.userImage!.image as! UIImage?)!, 0.5)!
            let imageData1 = NationalImage?.jpegData(compressionQuality: 0.5)
            multipartFormData.append(imageData1!, withName: "image", fileName: "image.jpeg", mimeType: "image/jpeg")
            print("success");
        },
            to: self.signupurl,method:HTTPMethod.post,
                         headers:nil, encodingCompletion: { encodingResult in
                            switch encodingResult {
                            case .success(let upload, _, _):
                                upload
                                    .validate()
                                    .responseJSON { response in
                                        switch response.result {
                                        case .success(let value):
                                            print("responseObject: \(value)")
                                            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                                            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
                                            self.present(nextViewController, animated:true, completion:nil)
                                            return
                                        case .failure(let responseError):
                                            print("responseError: \(responseError)")
                                            let alert = UIAlertController(title: "Error", message: "Enter all data", preferredStyle: .alert)
                                            let okAction = UIAlertAction(title: "ok", style: .default) { (action: UIAlertAction!) in
                                                
                                                //                                                let storyBoard : UIStoryboard = UIStoryboard (name : "Main",bundle : nil)
                                                //                                                let nextvc = storyBoard.instantiateViewController(withIdentifier: "location") as! location
                                                //                                                self.present(nextvc,animated: true,completion: nil)
                                                return
                                            }
                                            alert.addAction(okAction)
                                            self.present(alert, animated: true, completion: nil)
                                            return
                                        }
                                }
                            case .failure(let encodingError):
                                print("encodingError: \(encodingError)")
                            }
        })
    }
    
    
    func uploadImage3(){
        
        var imageToUpload:UIImage = UIImage()
        //let picture = showPicture.image
        //Prescription
        //Profile_Image
        imageToUpload = img.image!
        
        var parameters = [String:Any]()
        //var parameters: [String:Any] =
        parameters =
            [
                "national_id" : self.txtIdNumber.text!,
                "name" : self.txtFullName.text!,
                "national_id_image" : self.img.image!,
                "mobile" : self.txtPhone.text!,
                "email" : self.txtEmail.text!,
                "password" :self.txtPassword.text!,
                "city_id" : self.txtCity.text!,
                "id": 103141,
                
                "image": "https://1millioneg.com/storage/users/default.png",
                
                "city": "القاهرة",
                //"fawry_code": null,
                "payment_status": true,
                "credit_amount": 99,
                "created_at": "2020-02-17T21:27:58.000000Z",
                "updated_at": "2020-02-17T21:27:58.000000Z"
        ]
        
//        Alamofire.request(signupurl, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
//            .validate(statusCode: 200..<300)
//            .responseJSON { response in
//                switch response.result{
//                case .failure(let error):
//                    //completion(error,false)
//                    print(error)
//                    
//                case .success(let value):
//                    var json = try? JSON(value)
//                    print(value)
//        
//                }
//                
//        }
                    
                    
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for (key, val) in parameters {
                multipartFormData.append(("\(val)" as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key as String)
            }
            multipartFormData.append(imageToUpload.jpegData(compressionQuality: 0.5)!, withName: "image", fileName: "image.jpeg", mimeType: "image/jpeg")
        }, to:self.signupurl)
        { (result) in
            switch result {
            case .success(let upload, _, _):
                print(result)
                
                upload.uploadProgress(closure: { (progress) in
                    print(progress)
                })
                
                upload.responseString { response in
                    //print response.result
                    print(response);
                }
                
                
                
            case .failure(let encodingError):
                print(encodingError);
            }
        }
    }
    
    }
    

