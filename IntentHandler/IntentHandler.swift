//
//  IntentHandler.swift
//  IntentHandler
//
//  Created by 高宇 on 2021/1/28.
//

import Intents

//这里的代理名称是你设置的intent的命名后面加上IntentHandling
class IntentHandler: INExtension, ConfigurationIntentHandling , RunIntentHandling  {
    func provideParameterOptionsCollection(for intent: ConfigurationIntent, with completion: @escaping (INObjectCollection<Type>?, Error?) -> Void) {
        mediumProdLoader.fetch(editArr: NSArray()){ result in
            let arr: NSArray
            if case .success(let data) = result {
                arr = data
                
                //判空处理
                if arr.count == 0 {
                    completion(nil, nil)
                }
                
                let animals: [Type] = arr.map { dict in
                    let dic = dict as? Dictionary<NSString, Any>
                    return Type(identifier: dic?["deviceUUID"] as? String, display: dic?["name"] as! String)
                }
                //最后通过回调返回编辑列表
                completion(INObjectCollection(items: animals), nil)
            }
        }
    }
    
    func provideParameterOptionsCollection(for intent: RunIntent, with completion: @escaping (INObjectCollection<Click>?, Error?) -> Void) {
        getISceneListLoader.fetch{ result in
            let arr: NSArray
            if case .success(let data) = result {
                arr = data
                
                //判空处理
                if arr.count == 0 {
                    completion(nil, nil)
                }
                
                let animals: [Click] = arr.map { dict in
                    let dic = dict as? Dictionary<NSString, Any>
                    let sceneIdStr = dic?["sceneId"]! as! NSNumber
                    return Click(identifier: "\(sceneIdStr)", display: dic?["name"] as! String)
                }
                
                completion(INObjectCollection(items: animals), nil)
            }
        }
    }
    
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
    
}
