//
//  swift_code.swift
//  wwwww
//
//  Created by gaoyu on 2020/12/14.
//

import SwiftUI

class viewc: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        var _:Int = 0;
        self.view.backgroundColor = .blue
    }
}

struct Contact {
    var deviceUUID: String
    var imageUrl: Data
    var status: String
    var name: String
}

// 获取所有设备数据
struct mediumProdLoader {
    /// 获取设备列表数据
    static func fetch(editArr: NSArray,completion: @escaping (Result<NSArray,Error>) -> Void) {
        
        let vc = Calculator()
        let Arr = editArr
        
        //传参
        vc.getDeviceList(Arr as! [NSString?]) { (data) -> Void in
            let arr = data ?? NSArray() as! [Any]
            if arr.count > 0 {
                completion(.success(arr as NSArray))
            }else{
                completion(.success(NSArray()))
            }
        }
    }
}

// 获取自动化一键执行列表数据
struct getISceneListLoader {
    static func fetch(completion: @escaping (Result<NSArray,Error>) -> Void) {
        
        let vc = Calculator()
        vc.getISceneList({ (data) -> Void in
            let arr = data ?? NSArray() as! [Any]
            if arr.count > 0 {
                completion(.success(arr as NSArray))
            }else{
                completion(.success(NSArray()))
            }
        })
    }
}
