//
//  HomeVC.swift
//  1Million
//
//  Created by Ahmed on 12/27/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class HomeVC: UIViewController {
    
    var item = [Data]()
    
    @IBOutlet weak var lblDay: UILabel!
    @IBOutlet weak var lblhour: UILabel!
    @IBOutlet weak var lblminute: UILabel!
    @IBOutlet weak var lblMony: UILabel!
    @IBOutlet weak var lblmutual: UILabel!
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
    var imgArr = [  UIImage(named:"Home1"),
                    UIImage(named:"Home1"),
                    UIImage(named:"Home1")
                 ]
    
    var timer = Timer()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let url = "http://1millioneg.com/api/lottery"
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default)
            .responseJSON { response in
                let result = response.result
                print(response)
                //to get status code
                if let status = response.response?.statusCode {
                    switch(status){
                    case 201:
                        print("example success")
                    default:
                        print("error with response status: \(status)")
                    }
                }
                //to get JSON return value
                if let arrayOfDic = result.value as? Dictionary<String, AnyObject> {
                    print(arrayOfDic)
                    let userdata = arrayOfDic["data"] as? Dictionary<String, AnyObject>
                    let start_time = userdata?["start_time"] as! [String : Any]
                    print("the start_time is :\(start_time)")
                    let day = start_time["day"] as! Int
                    print(" the day is : \(day)")
                    self.lblDay.text = "\(day)"
                    let hour = start_time["hour"] as! Int
                    print(" the hour is : \(hour)")
                    self.lblhour.text = "\(hour)"
                    let minute = start_time["minute"] as! Int
                    print(" the minute is : \(minute)")
                    self.lblminute.text = "\(minute)"
                    
                }
        
        }
    
//        if #available(iOS 13.0, *) {
//            overrideUserInterfaceStyle = .dark
//        }
        
        

        lblDay.layer.cornerRadius = lblDay.frame.size.width / 2
        lblDay.clipsToBounds  = true
        lblhour.layer.cornerRadius = lblhour.frame.size.width / 2
        lblhour.clipsToBounds  = true
        lblminute.layer.cornerRadius = lblminute.frame.size.width / 2
        lblminute.clipsToBounds  = true
        lblMony.layer.cornerRadius = 25.0
        lblMony.layer.masksToBounds = true
        lblmutual.layer.cornerRadius = 25.0
        lblmutual.layer.masksToBounds = true
        
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
        
        
    }
    
    
    @objc func changeImage() {
        if counter < imgArr.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            counter = 1
        }
    }
    
    
    
    
    
}
        
    

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if let vc = cell.viewWithTag(111) as? UIImageView {
            vc.image = imgArr[indexPath.row]
        }
        return cell
    }
    
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = sliderCollectionView.frame.size
        return CGSize(width: size.width, height: size.height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}


