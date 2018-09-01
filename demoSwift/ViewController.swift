//
//  ViewController.swift
//  demoSwift
//
//  Created by 陈涛 on 2018/9/1.
//  Copyright © 2018年 陈涛. All rights reserved.
//https://www.jianshu.com/p/a59d21bc89be
//https://blog.csdn.net/average17/article/details/78236589
//http://www.hangge.com/blog/cache/detail_668.html
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       //方法1  userdefaulte 和 Codable  JSONEncoder
        let user = TestModle.user // 存
        user.age = 28
        user.name = "流火绯瞳"
        user.psw = "123456"
        user.saved()
        let users = TestModle.user//取
        print(users.name)

        
        //方法2 userdefaulte 和 NSKeyedUnarchiver使用 需配合 nscoding协议 否则Codable协议不行
        let model = UserInfoModel.init(newName: "haha", newPhone: "783781111")
        let modelData = NSKeyedArchiver.archivedData(withRootObject: model)
        UserDefaults.standard.set(modelData, forKey: "modelData")
        
        let myModelData = UserDefaults.standard.data(forKey: "modelData")
        let myModel = NSKeyedUnarchiver.unarchiveObject(with: myModelData!) as? UserInfoModel
        print(myModel?.name )
        print(myModel?.phone )
        
        //方法3   writetoflie
        let person = UserInfoModel.init(newName: "tomes", newPhone: "99")
        //拿到一个本地文件的URL
        let manager = FileManager.default
        var url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        url?.appendPathComponent("test.txt")
        
        //将Person实例转换为JSON数据
        let dataWrite = try? JSONEncoder().encode(person)
        do {
            try dataWrite?.write(to: url!)
        } catch {
            print("保存到本地文件失败")
        }
        
        //从本地文件读取数据
        if let dataRead = try? Data(contentsOf: url!) {
            //将数据转换为Person实例
            let person = try? JSONDecoder().decode(UserInfoModel.self, from: dataRead)
            //输出内容
            print("name: \(String(describing: person?.name))")  //输出: name: Tom
            print("age: \(String(describing: person?.phone))")  //输出: age: 18
        } else {
            print("文件不存在，读取本地文件失败")
        }    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

