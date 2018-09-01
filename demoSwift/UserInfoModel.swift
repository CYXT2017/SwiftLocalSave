//
//  UserInfoModel.swift
//  demoSwift
//
//  Created by 陈涛 on 2018/9/1.
//  Copyright © 2018年 陈涛. All rights reserved.
//

import UIKit

class UserInfoModel: NSObject,Codable,NSCoding {
    // swift 4.0  直接遵循 codable 协议即可
    var name: String
    var phone: String
    convenience init(newName: String, newPhone: String) {
        self.init()
        self.name = newName
        self.phone = newPhone
    }
    
    override init() {
        self.name = ""
        self.phone = ""
        super.init()
    }
    
    

    //swift 3.0 遵循的nscoding协议
    //从object解析回来
    required init(coder decoder: NSCoder) {
        self.name = decoder.decodeObject(forKey: "Name") as? String ?? ""
        self.phone = decoder.decodeObject(forKey: "Phone") as? String ?? ""
    }

    //编码成object
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey:"Name")
        coder.encode(phone, forKey:"Phone")
    }
}
