//
//  User.swift
//  1Million
//
//  Created by Ahmed on 12/27/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import Foundation

class User1 {
    var id: Int
    var name: String
    var mobile: String
    var national_id : String
    var email : String
    var city : String
    var token: String
    var image: String
    
    
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
    
    init(id: Int, name: String, mobile: String, token: String, national_id: String, email: String, city: String, image: String) {
        self.id = id
        self.name = name
        self.mobile = mobile
        self.national_id = national_id
        self.email = email
        self.token = token
        self.city = city
        self.image = image
    }
} 
