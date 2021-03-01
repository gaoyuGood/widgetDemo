//
//  urwork.swift
//  urwork
//
//  Created by zhangjingfei on 17/11/2020.
//

import WidgetKit
import SwiftUI
import Intents

struct OneClickWidgetProvider: IntentTimelineProvider {
    
    //提供一个默认的视图，当网络数据请求失败或者其他一些异常的时候，用于展示
    func placeholder(in context: Context) -> OneClickWidgetSimpleEntry {
        OneClickWidgetSimpleEntry(date: Date(), contact: SceneData(name: "", sceneId: ""),contact2: SceneData(name: "", sceneId: ""),contact3: SceneData(name: "", sceneId: ""),contact4: SceneData(name: "", sceneId: ""),contact5: SceneData(name: "", sceneId: ""),contact6: SceneData(name: "", sceneId: ""),contact7: SceneData(name: "", sceneId: ""),contact8: SceneData(name: "", sceneId: ""))
    }

    //为了在小部件库中显示小部件，WidgetKit要求提供者提供预览快照，在组件的添加页面可以看到效果
    func getSnapshot(for configuration: RunIntent, in context: Context, completion: @escaping (OneClickWidgetSimpleEntry) -> ()) {
        getISceneListLoader.fetch{ result in
            let arr: NSArray
            if case .success(let data) = result {
                arr = data
                let count = arr.count
                
                var sceneData = SceneData.init(name: "", sceneId: "")
                var sceneData2 = SceneData.init(name: "", sceneId: "")
                var sceneData3 = SceneData.init(name: "", sceneId: "")
                var sceneData4 = SceneData.init(name: "", sceneId: "")
                var sceneData5 = SceneData.init(name: "", sceneId: "")
                var sceneData6 = SceneData.init(name: "", sceneId: "")
                var sceneData7 = SceneData.init(name: "", sceneId: "")
                var sceneData8 = SceneData.init(name: "", sceneId: "")
                
                if count > 0 {
                    if let dic = arr[0] as? Dictionary<NSString, Any> {
                        let sceneId = dic["sceneId"]! as! NSNumber
                        sceneData = SceneData(name: dic["name"] as! String, sceneId: "\(sceneId)")
                    }
                }
                if count > 1 {
                    if let dic2 = arr[1] as? Dictionary<NSString, Any> {
                        let sceneId = dic2["sceneId"]! as! NSNumber
                        sceneData2 = SceneData(name: dic2["name"] as! String, sceneId: "\(sceneId)")
                    }
                }
                if count > 2 {
                    if let dic3 = arr[2] as? Dictionary<NSString, Any> {
                        let sceneId = dic3["sceneId"]! as! NSNumber
                        sceneData3 = SceneData(name: dic3["name"] as! String, sceneId: "\(sceneId)")
                    }
                }
                if count > 3 {
                    if let dic4 = arr[3] as? Dictionary<NSString, Any> {
                        let sceneId = dic4["sceneId"]! as! NSNumber
                        sceneData4 = SceneData(name: dic4["name"] as! String, sceneId: "\(sceneId)")
                    }
                }
                if count > 4 {
                    if let dic5 = arr[4] as? Dictionary<NSString, Any> {
                        let sceneId = dic5["sceneId"]! as! NSNumber
                        sceneData5 = SceneData(name: dic5["name"] as! String, sceneId: "\(sceneId)")
                    }
                }
                if count > 5 {
                    if let dic6 = arr[5] as? Dictionary<NSString, Any> {
                        let sceneId = dic6["sceneId"]! as! NSNumber
                        sceneData6 = SceneData(name: dic6["name"] as! String, sceneId: "\(sceneId)")
                    }
                }
                if count > 6 {
                    if let dic7 = arr[6] as? Dictionary<NSString, Any> {
                        let sceneId = dic7["sceneId"]! as! NSNumber
                        sceneData7 = SceneData(name: dic7["name"] as! String, sceneId: "\(sceneId)")
                    }
                }
                if count > 7 {
                    if let dic8 = arr[7] as? Dictionary<NSString, Any> {
                        let sceneId = dic8["sceneId"]! as! NSNumber
                        sceneData8 = SceneData(name: dic8["name"] as! String, sceneId: "\(sceneId)")
                    }
                }
                
                let entry = OneClickWidgetSimpleEntry(date: Date(), contact: sceneData, contact2: sceneData2, contact3: sceneData3, contact4: sceneData4, contact5: sceneData5, contact6: sceneData6, contact7: sceneData7, contact8: sceneData8)
                completion(entry)
            }
        }
    }
    
    //在这个方法内可以进行网络请求，拿到的数据保存在对应的entry中，调用completion之后会到刷新小组件
    func getTimeline(for configuration: RunIntent, in context: Context, completion: @escaping (Timeline<OneClickWidgetSimpleEntry>) -> ()) {
        var sceneId = String()
        var sceneId2 = String()
        var sceneId3 = String()
        var sceneId4 = String()
        var sceneId5 = String()
        var sceneId6 = String()
        var sceneId7 = String()
        var sceneId8 = String()
        
        if (configuration.parameter != nil) {
            let parameterCount:Int = configuration.parameter?.count ?? 0
            if parameterCount>0 {
                let type:Click = configuration.parameter?[0] ?? Click(identifier: "", display: "")
                sceneId = type.identifier ?? String()
            }
            if parameterCount>1 {
                let type:Click = configuration.parameter?[1] ?? Click(identifier: "", display: "")
                sceneId2 = type.identifier ?? String()
            }
            if parameterCount>2 {
                let type:Click = configuration.parameter?[2] ?? Click(identifier: "", display: "")
                sceneId3 = type.identifier ?? String()
            }
            if parameterCount>3 {
                let type:Click = configuration.parameter?[3] ?? Click(identifier: "", display: "")
                sceneId4 = type.identifier ?? String()
            }
            if parameterCount>4 {
                let type:Click = configuration.parameter?[4] ?? Click(identifier: "", display: "")
                sceneId5 = type.identifier ?? String()
            }
            if parameterCount>5 {
                let type:Click = configuration.parameter?[5] ?? Click(identifier: "", display: "")
                sceneId6 = type.identifier ?? String()
            }
            if parameterCount>6 {
                let type:Click = configuration.parameter?[6] ?? Click(identifier: "", display: "")
                sceneId7 = type.identifier ?? String()
            }
            if parameterCount>7 {
                let type:Click = configuration.parameter?[7] ?? Click(identifier: "", display: "")
                sceneId8 = type.identifier ?? String()
            }
        }
        
        getISceneListLoader.fetch{ result in
            let arr: NSArray
            if case .success(let data) = result {
                arr = data
                let count = arr.count
                
                var sceneData = SceneData.init(name: "", sceneId: "")
                var sceneData2 = SceneData.init(name: "", sceneId: "")
                var sceneData3 = SceneData.init(name: "", sceneId: "")
                var sceneData4 = SceneData.init(name: "", sceneId: "")
                var sceneData5 = SceneData.init(name: "", sceneId: "")
                var sceneData6 = SceneData.init(name: "", sceneId: "")
                var sceneData7 = SceneData.init(name: "", sceneId: "")
                var sceneData8 = SceneData.init(name: "", sceneId: "")
                
                if count > 0 && !sceneId.isEmpty {
                    for tempDict in arr {
                        let dic = tempDict as? Dictionary<NSString, Any>
                        let sceneIdStr = dic?["sceneId"]! as! NSNumber
                        if "\(sceneIdStr)" == sceneId {
                            sceneData = SceneData(name: dic?["name"] as! String, sceneId: "\(sceneIdStr)")
                        }
                        if "\(sceneIdStr)" == sceneId2 {
                            sceneData2 = SceneData(name: dic?["name"] as! String, sceneId: "\(sceneIdStr)")
                        }
                        if "\(sceneIdStr)" == sceneId3 {
                            sceneData3 = SceneData(name: dic?["name"] as! String, sceneId: "\(sceneIdStr)")
                        }
                        if "\(sceneIdStr)" == sceneId4 {
                            sceneData4 = SceneData(name: dic?["name"] as! String, sceneId: "\(sceneIdStr)")
                        }
                        if "\(sceneIdStr)" == sceneId5 {
                            sceneData5 = SceneData(name: dic?["name"] as! String, sceneId: "\(sceneIdStr)")
                        }
                        if "\(sceneIdStr)" == sceneId6 {
                            sceneData6 = SceneData(name: dic?["name"] as! String, sceneId: "\(sceneIdStr)")
                        }
                        if "\(sceneIdStr)" == sceneId7 {
                            sceneData7 = SceneData(name: dic?["name"] as! String, sceneId: "\(sceneIdStr)")
                        }
                        if "\(sceneIdStr)" == sceneId8 {
                            sceneData8 = SceneData(name: dic?["name"] as! String, sceneId: "\(sceneIdStr)")
                        }
                        
                    }
                }
                
                if count > 0 && sceneData.sceneId.count == 0 {
                    if let dic = arr[0] as? Dictionary<NSString, Any> {
                        let sceneId = dic["sceneId"]! as! NSNumber
                        sceneData = SceneData(name: dic["name"] as! String, sceneId: "\(sceneId)")
                    }
                }
                if count > 1 && sceneData2.sceneId.count == 0 {
                    if let dic2 = arr[1] as? Dictionary<NSString, Any> {
                        let sceneId = dic2["sceneId"]! as! NSNumber
                        sceneData2 = SceneData(name: dic2["name"] as! String, sceneId: "\(sceneId)")
                    }
                }
                if count > 2 && sceneData3.sceneId.count == 0 {
                    if let dic3 = arr[2] as? Dictionary<NSString, Any> {
                        let sceneId = dic3["sceneId"]! as! NSNumber
                        sceneData3 = SceneData(name: dic3["name"] as! String, sceneId: "\(sceneId)")
                    }
                }
                if count > 3 && sceneData4.sceneId.count == 0 {
                    if let dic4 = arr[3] as? Dictionary<NSString, Any> {
                        let sceneId = dic4["sceneId"]! as! NSNumber
                        sceneData4 = SceneData(name: dic4["name"] as! String, sceneId: "\(sceneId)")
                    }
                }
                if count > 4 && sceneData5.sceneId.count == 0 {
                    if let dic5 = arr[4] as? Dictionary<NSString, Any> {
                        let sceneId = dic5["sceneId"]! as! NSNumber
                        sceneData5 = SceneData(name: dic5["name"] as! String, sceneId: "\(sceneId)")
                    }
                }
                if count > 5 && sceneData6.sceneId.count == 0 {
                    if let dic6 = arr[5] as? Dictionary<NSString, Any> {
                        let sceneId = dic6["sceneId"]! as! NSNumber
                        sceneData6 = SceneData(name: dic6["name"] as! String, sceneId: "\(sceneId)")
                    }
                }
                if count > 6 && sceneData7.sceneId.count == 0 {
                    if let dic7 = arr[6] as? Dictionary<NSString, Any> {
                        let sceneId = dic7["sceneId"]! as! NSNumber
                        sceneData7 = SceneData(name: dic7["name"] as! String, sceneId: "\(sceneId)")
                    }
                }
                if count > 7 && sceneData8.sceneId.count == 0 {
                    if let dic8 = arr[7] as? Dictionary<NSString, Any> {
                        let sceneId = dic8["sceneId"]! as! NSNumber
                        sceneData8 = SceneData(name: dic8["name"] as! String, sceneId: "\(sceneId)")
                    }
                }
                
                
                var entries: [OneClickWidgetSimpleEntry] = []
                // Generate a timeline consisting of five entries an hour apart, starting from the current date.
                let currentDate = Date()
                for hourOffset in 0 ..< 5 {
                    let entryDate = Calendar.current.date(byAdding: .minute, value: hourOffset, to: currentDate)!
                    let entry = OneClickWidgetSimpleEntry(date: entryDate, contact: sceneData, contact2: sceneData2, contact3: sceneData3, contact4: sceneData4, contact5: sceneData5, contact6: sceneData6, contact7: sceneData7, contact8: sceneData8)
                    entries.append(entry)
                }

                let timeline = Timeline(entries: entries, policy: .atEnd)
                completion(timeline)
            }
        }
    }
}


struct OneClickWidgetSimpleEntry: TimelineEntry {
    public let date: Date
    public let contact: SceneData
    public let contact2: SceneData
    public let contact3: SceneData
    public let contact4: SceneData
    public let contact5: SceneData
    public let contact6: SceneData
    public let contact7: SceneData
    public let contact8: SceneData
}

struct SceneData {
    var name: String
    var sceneId: String
}

struct OneClickWidgetEntryView : View {
    //这里是Widget的类型判断
    @Environment(\.widgetFamily) var family: WidgetFamily
    var entry: OneClickWidgetProvider.Entry
    
    @ViewBuilder
    var body: some View {
        //加载四个快捷方式
        switch family
        {
            case .systemSmall:
                OneClickSmallView(entry: entry)
            case .systemMedium:
                OneClickMediumView(entry: entry)
            case .systemLarge:
                OneClickLargeView(entry: entry)
            default:
                Text("")
        }
    }
}

struct OneClickRunWidget: Widget {
    let kind: String = "OneClickRunWidget"
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: RunIntent.self, provider: OneClickWidgetProvider()) { entry in
            OneClickWidgetEntryView(entry: entry)
        }
        .configurationDisplayName(NSLocalizedString("木乃伊的微笑", comment: "Tap-to-Run"))
        .description(NSLocalizedString("德玛西亚", comment: "Run your Tap-to-Run quickly."))
        .supportedFamilies([.systemSmall,.systemMedium,.systemLarge])
    }
}
