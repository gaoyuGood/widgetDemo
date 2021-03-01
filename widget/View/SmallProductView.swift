//
//  SmallProductView.swift
//  WidgetTest
//
//  Created by zhangjingfei on 20/11/2020.
//

import SwiftUI

struct SmallProductView : View {
    var entry: FourToolWidgetProvider.Entry   //这里就获取到了传递过来的数据
    var body: some View {
        VStack
        {
            //图片
            ProductView(imageUrl: entry.contact.imageUrl)
                .padding(EdgeInsets(top:10, leading: 10, bottom: -8, trailing:10))
//                .cornerRadius(14)
                
            GeometryReader { geo in
                if !entry.contact.deviceUUID.isEmpty {
                    GeometryReader { geo in
                        Text(loadStatusText(status: entry.contact.status) ?? String())
                            .font(.system(size: 16))
                            .foregroundColor(Color("testColor"))
                            .bold()
                    }
                    .frame(height: 18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 22, trailing: 15))
                    
                    GeometryReader { geo in
                        Text(entry.contact.name)
                            .font(.system(size: 12))
                            .foregroundColor(Color("testColor2"))
                    }
                    .frame(height: 12, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(EdgeInsets(top: 25, leading: 15, bottom: 8, trailing: 15))
                }
            }
            .frame(minWidth: 100, idealWidth: 100, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 18, maxHeight: 45, alignment: .center)
        }
        .widgetURL(URL(string: "widget_deviceUUID:" + entry.contact.deviceUUID + ":Device:" + entry.contact.status))
    }
}

//缩略图
struct ProductView : View {
    let imageUrl : Data
    
    var body: some View {
        //判断是否有图片url
        if !imageUrl.isEmpty && imageUrl.count>0 {
            Image(uiImage: loadLocalImage(iamgeData:imageUrl)!)
                .resizable()   //自适应大小 * 图片没有完全显示全,我们可以用Image的resizable()来让图片自动适应
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
                .clipped()
            
            if loadLocalImage(iamgeData:imageUrl) == UIImage() {
                MoRenView()
            }
        } else {
            MoRenView()
        }
    }
}

//加载网络图片(目前不使用)
func loadNetworkImage(imgUrlString:String) ->UIImage? {
    var image: UIImage? = nil
    if !imgUrlString.isEmpty && imgUrlString.count>0 {
        if let iamgeData = try? Data(contentsOf: URL(string: imgUrlString)!) {
            image = UIImage(data: iamgeData)
        }
    }else{
        image = UIImage()
    }
    
    if image == nil {
        image = UIImage()
    }
    return image;
}

//加载本地缓存图片
func loadLocalImage(iamgeData:Data) ->UIImage? {
    var image: UIImage? = nil
    image = UIImage(data: iamgeData)
    
    if image == nil {
        image = UIImage()
    }
    return image;
}


//加载状态文案
func loadStatusText(status:String) ->String? {
    var str: String? = nil
    str = status
//    if !status.isEmpty && status.count>0 {
//        if status != "On" {
//            str = NSLocalizedString("change_wifi_status", comment: "Status") + "：" + NSLocalizedString("setting_off", comment: "Off")
//        }else{
//            str = NSLocalizedString("change_wifi_status", comment: "Status") + "：" + NSLocalizedString("setting_on", comment: "On")
//        }
//    }else{
//
//    }
    return str;
}


//背景
struct MoRenView:View
{
    var body: some View
    {
        Image("")
            .resizable()
            .background(Color("imageColor"))
        
    }
}

// 渐变色 遮罩视图 简单封装 使代码更为直观
func gradientView() -> LinearGradient {
    // 从上到下的渐变颜色
    return LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)), Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))]), startPoint: .top, endPoint: .bottom)
}

