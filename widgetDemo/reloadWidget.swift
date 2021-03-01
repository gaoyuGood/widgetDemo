//
//  reloadWidget.swift
//  widgetDemo
//
//  Created by 高宇 on 2021/2/23.
//

import Foundation
import WidgetKit

//声明 14以上的系统才可用此 api
@available(iOS 14.0, *)
//定义 oc 方法
@objcMembers final class WidgetKitHelper : NSObject {
    class func reloadAllWidgets() {
       // 刷新所有widget
       // arm64架构真机以及模拟器可以使用
        #if arch(arm64) || arch(i386) || arch(x86_64)
            WidgetCenter.shared.reloadAllTimelines()
        #endif
    }
    
    // 刷新某一个widget.  xxxx 是该widget的 identifier
    class func reloadWidgetForKind(kindStr: NSString) {
        WidgetCenter.shared.reloadTimelines(ofKind: "xxxx")
    }
}
