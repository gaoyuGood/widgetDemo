//
//  widget.swift
//  widget
//
//  Created by 高宇 on 2021/1/27.
//

import WidgetKit
import SwiftUI
import Intents

//为小组件展示提供一切必要信息的结构体，遵守TimelineProvider协议，产生一个时间线，告诉 WidgetKit 何时渲染与刷新 Widget，时间线包含一个你定义的自定义TimelineEntry类型。时间线条目标识了你希望WidgetKit更新Widget内容的日期。在自定义类型中包含你的Widget的视图需要渲染的属性。
struct Provider: IntentTimelineProvider {
    // 占位视图，例如网络请求失败、发生未知错误、第一次展示小组件都会展示这个view
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    // 编辑屏幕在左上角选择添加Widget、第一次展示时会调用该方法(并不是每一次调用都会触发该方法，只有第一次展示或者到了固定的时间周期才会刷新，期间系统会缓存你上一次展示的内容展示出来)
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    // 小组件刷新时候走的方法，第一次加载也会触发该方法。
    // 被动刷新触发，由系统（可以设置时间）控制刷新频率，到了设定时间会刷新小组件。也可以使用手动刷新reload触发（需要主app在运行时候调用）
    // 进行数据的预处理，转化成Entry，最后completion返回。
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        // 多长时间后后刷新
        for hourOffset in 0 ..< 5 {
            //.hour 是小时，hourOffset默认是5，结合起来就是5小时刷新一次，这个时间可以修改，目前测试结果最快为5分钟刷新一次，设置更短的时间也是失效的。
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

// 渲染 Widget 所需的数据模型，需要遵守TimelineEntry协议
struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

// 屏幕上 Widget 显示的内容，可以针对不同尺寸的 Widget 设置不同的 View。
struct widgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        Text(entry.date, style: .time)
    }
}

//主入口，运行小组件会首先进入该方法，只会运行一次，初始化完成所有小组件内容
@main
struct UserWidget: WidgetBundle {
    let kind: String = "Widget"

    @WidgetBundleBuilder
    var body: some Widget {
        FourToolWidget()
        OneClickRunWidget()
    }
}

//struct widget: Widget {
//    let kind: String = "widget"
//
//    var body: some WidgetConfiguration {
//        //可编辑内容为IntentConfiguration，不可编辑为StaticConfiguration
//        //注册了Provider的block回调，当数据刷新后block回来带着数据传递给widgetEntryView
//        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
//            widgetEntryView(entry: entry)
//        }
//        .configurationDisplayName("My Widget")   //添加小组件时界面显示的黑色文案（字符串可国际化）
//        .description("This is an example widget.")  //添加小组件时显示的灰色文案
//    }
//}

struct widget_Previews: PreviewProvider {
    static var previews: some View {
        widgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
