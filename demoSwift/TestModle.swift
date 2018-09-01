
//
//  TestModle.swift
//  demoSwift
//
//  Created by 陈涛 on 2018/9/1.
//  Copyright © 2018年 陈涛. All rights reserved.
//

import UIKit

class TestModle: NSObject, Codable {
    var name: String = ""
    var age: Int = 0
    var psw = ""
    
    static var user: TestModle {
        let ud = UserDefaults.standard
        guard let data = ud.data(forKey: "lqUser_savedData") else {
            // 如果获取失败则重新创建一个返回
            return TestModle()
        }
        guard let us = try? JSONDecoder().decode(TestModle.self, from: data) else {
            return TestModle()
        }
        return us
    }
    
    private override init() {
        
    }
    
    func saved() {
        if let data = try? JSONEncoder().encode(self) {
            let us = UserDefaults.standard
            us.set(data, forKey: "lqUser_savedData")
            us.synchronize()
        }
    }

}
