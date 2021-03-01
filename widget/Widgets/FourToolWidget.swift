//
//  urwork.swift
//  urwork
//
//  Created by zhangjingfei on 17/11/2020.
//

import WidgetKit
import SwiftUI
import Intents

struct FourToolWidgetProvider: IntentTimelineProvider {
    typealias Entry = FourToolWidgetSimpleEntry
    
    typealias Intent = ConfigurationIntent
    

    //提供一个默认的视图，当网络数据请求失败或者其他一些异常的时候，用于展示
    func placeholder(in context: Context) -> FourToolWidgetSimpleEntry {
        FourToolWidgetSimpleEntry(date: Date(), contact: Contact(deviceUUID: String(), imageUrl: Data(), status: "On", name: "Live room"),contact2: Contact(deviceUUID: String(), imageUrl: Data(), status: "On", name: "Live room"),contact3: Contact(deviceUUID: String(), imageUrl: Data(), status: "On", name: "Live room"),contact4: Contact(deviceUUID: String(), imageUrl: Data(), status: "On", name: "Live room"))
    }

    //为了在小部件库中显示小部件，WidgetKit要求提供者提供预览快照，在组件的添加页面可以看到效果
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (FourToolWidgetSimpleEntry) -> ()) {
        mediumProdLoader.fetch(editArr: NSArray()){ result in
            let arr: NSArray
            if case .success(let data) = result {
                arr = data
                let count = arr.count

                var contact = Contact.init(deviceUUID: String(), imageUrl: Data(), status: "", name: "")
                var contact2 = Contact.init(deviceUUID: String(), imageUrl: Data(), status: "", name: "")
                var contact3 = Contact.init(deviceUUID: String(), imageUrl: Data(), status: "", name: "")
                var contact4 = Contact.init(deviceUUID: String(), imageUrl: Data(), status: "", name: "")

                if count > 0 {
                    if let dic = arr[0] as? Dictionary<NSString, Any> {
                        contact = Contact(deviceUUID: dic["deviceUUID"] as! String, imageUrl: dic["thumbnailUrl"] as! Data , status: dic["deviceStatus"] as! String, name: dic["name"] as! String)
                    }
                }

                if count > 1 {
                    if let dic2 = arr[1] as? Dictionary<NSString, Any> {
                        contact2 = Contact(deviceUUID: dic2["deviceUUID"] as! String, imageUrl: dic2["thumbnailUrl"] as! Data , status: dic2["deviceStatus"] as! String, name: dic2["name"] as! String)
                    }
                }

                if count > 2 {
                    if let dic3 = arr[2] as? Dictionary<NSString, Any> {
                        contact3 = Contact(deviceUUID: dic3["deviceUUID"] as! String, imageUrl: dic3["thumbnailUrl"] as! Data , status: dic3["deviceStatus"] as! String, name: dic3["name"] as! String)
                    }
                }

                if count > 3 {
                    if let dic4 = arr[3] as? Dictionary<NSString, Any> {
                        contact4 = Contact(deviceUUID: dic4["deviceUUID"] as! String, imageUrl: dic4["thumbnailUrl"] as! Data , status: dic4["deviceStatus"] as! String, name: dic4["name"] as! String)
                    }
                }

                let entry = FourToolWidgetSimpleEntry(date: Date(), contact: contact, contact2: contact2, contact3: contact3, contact4: contact4)
                completion(entry)
            }
        }
    }
    
    //在这个方法内可以进行网络请求，拿到的数据保存在对应的entry中，调用completion之后会到刷新小组件
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<FourToolWidgetSimpleEntry>) -> ()) {
        
        let arr = NSMutableArray()

        var deviceUUID = NSString()
        var deviceUUID2 = NSString()
        var deviceUUID3 = NSString()
        var deviceUUID4 = NSString()

        if (configuration.parameter != nil) {
            let parameterCount:Int = configuration.parameter?.count ?? 0
            if parameterCount>0 {
                let type:Type = configuration.parameter?[0] ?? Type(identifier: "", display: "")
                deviceUUID = type.identifier! as NSString
                arr.add(deviceUUID)
            }
            if parameterCount>1 {
                let type:Type = configuration.parameter?[1] ?? Type(identifier: "", display: "")
                deviceUUID2 = type.identifier! as NSString
                arr.add(deviceUUID2)
            }
            if parameterCount>2 {
                let type:Type = configuration.parameter?[2] ?? Type(identifier: "", display: "")
                deviceUUID3 = type.identifier! as NSString
                arr.add(deviceUUID3)
            }
            if parameterCount>3 {
                let type:Type = configuration.parameter?[3] ?? Type(identifier: "", display: "")
                deviceUUID4 = type.identifier! as NSString
                arr.add(deviceUUID4)
            }
        }

        let editArr = arr.copy()

        mediumProdLoader.fetch(editArr: editArr as! NSArray){ result in
            let arr: NSArray
            if case .success(let data) = result {
                arr = data
                let count = arr.count

                var contact = Contact.init(deviceUUID: String(), imageUrl: Data(), status: "", name: "")
                var contact2 = Contact.init(deviceUUID: String(), imageUrl: Data(), status: "", name: "")
                var contact3 = Contact.init(deviceUUID: String(), imageUrl: Data(), status: "", name: "")
                var contact4 = Contact.init(deviceUUID: String(), imageUrl: Data(), status: "", name: "")

                //数据赋值
                if count > 0 {
                    if let dic = arr[0] as? Dictionary<NSString, Any> {
                        contact = Contact(deviceUUID: dic["deviceUUID"] as! String, imageUrl: dic["thumbnailUrl"] as! Data , status: dic["deviceStatus"] as! String, name: dic["name"] as! String)
                    }
                }

                if count > 1 {
                    if let dic2 = arr[1] as? Dictionary<NSString, Any> {
                        contact2 = Contact(deviceUUID: dic2["deviceUUID"] as! String, imageUrl: dic2["thumbnailUrl"] as! Data , status: dic2["deviceStatus"] as! String, name: dic2["name"] as! String)
                    }
                }
                if count > 2 {
                    if let dic3 = arr[2] as? Dictionary<NSString, Any> {
                        contact3 = Contact(deviceUUID: dic3["deviceUUID"] as! String, imageUrl: dic3["thumbnailUrl"] as! Data , status: dic3["deviceStatus"] as! String, name: dic3["name"] as! String)
                    }
                }
                if count > 3 {
                    if let dic4 = arr[3] as? Dictionary<NSString, Any> {
                        contact4 = Contact(deviceUUID: dic4["deviceUUID"] as! String, imageUrl: dic4["thumbnailUrl"] as! Data , status: dic4["deviceStatus"] as! String, name: dic4["name"] as! String)
                    }
                }

                var entries: [FourToolWidgetSimpleEntry] = []
                // Generate a timeline consisting of five entries an hour apart, starting from the current date.
                // 从当前日期开始，每小时产生一个包含十二个条目的时间轴。
                let currentDate = Date()
                // 设置5分钟刷新一次(实际要看苹果的算法,可能有偏差)
                for hourOffset in 0 ..< 12 {
                    let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
                    let entry = FourToolWidgetSimpleEntry(date: entryDate, contact: contact, contact2: contact2, contact3: contact3, contact4: contact4)
                    entries.append(entry)
                }

                let timeline = Timeline(entries: entries, policy: .atEnd)
                completion(timeline)
            }
        }
    }
}

struct FourToolWidgetSimpleEntry: TimelineEntry {
    public let date: Date
    public let contact: Contact
    public let contact2: Contact
    public let contact3: Contact
    public let contact4: Contact
}

struct FourToolWidgetEntryView : View {
    //这里是Widget的类型判断
    @Environment(\.widgetFamily) var family: WidgetFamily
    var entry: FourToolWidgetProvider.Entry
    
    @ViewBuilder
    var body: some View {
        //加载四个快捷方式
        switch family
        {
            case .systemSmall:
                SmallProductView(entry: entry)
            case .systemMedium:
                MediumProductView(entry: entry)
            case .systemLarge:
                FourToolView(entry: entry)  
            default:
                Text("")
        }
    }
}

struct FourToolWidget: Widget {
    let kind: String = "DeviceWidget"
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: FourToolWidgetProvider()) { entry in
            FourToolWidgetEntryView(entry: entry)
        }
        .configurationDisplayName(NSLocalizedString("木乃伊的微笑", comment: "Device on/off"))
        .description(NSLocalizedString("德玛西亚", comment: "Turn a device on or off quickly."))
        .supportedFamilies([.systemSmall,.systemMedium,.systemLarge])
    }
}

struct FourToolWidget_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
    }
}

