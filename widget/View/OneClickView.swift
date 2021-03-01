//
//  OneClickView.swift
//  WidgetExtension
//
//  Created by gaoyu on 2020/12/28.
//

import Foundation
import SwiftUI

struct OneClickSmallView: View
{
    var entry: OneClickWidgetProvider.Entry
    var body: some View {
        ZStack
        {
            if entry.contact.sceneId.isEmpty == false {

                GeometryReader{ geo in
                    ZStack{
                        BackgroundView()
                            .background(Color(#colorLiteral(red: 0.8823529412, green: 0.5529411765, blue: 0.3411764706, alpha: 1)))

                        Image("tap_to_run")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 23.6, height: 27.84)
                            .position(x: 12.0+(23.6/2), y: 12.0+(27.84/2))
                            .ignoresSafeArea(.all)

                        Text(entry.contact.name)
                            .font(.system(size: 16))
                            .foregroundColor(Color(#colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)))
                            .frame(width: geo.size.width-24, height: 44, alignment: .topLeading)
                            .position(x: 12.0+((geo.size.width-24)/2), y: geo.size.height-12.0-(44/2))
                    }
                }
            }
            if entry.contact.sceneId.isEmpty {
                ZhanWeiView()
            }
        }
        .widgetURL(URL(string: "widget_deviceUUID:" + entry.contact.sceneId + ":IScene")) //自动化一键执行url
    }
}


struct OneClickMediumView: View
{
    var entry: OneClickWidgetProvider.Entry
    var body: some View {
        let sceneData : SceneData = entry.contact
        let sceneData2 : SceneData = entry.contact2
        let sceneData3 : SceneData = entry.contact3
        let sceneData4 : SceneData = entry.contact4
        
        HStack
        {
            GeometryReader{ geo in
                ZStack{
                    if sceneData.sceneId.isEmpty == false {
                        Link(destination: URL(string: "widget_deviceUUID:" + sceneData.sceneId + ":IScene")!) {
                            BackgroundView()
                                .background(Color(#colorLiteral(red: 0.8823529412, green: 0.5529411765, blue: 0.3411764706, alpha: 1)))
//                                .cornerRadius(14.0)
                        }

                        Image("tap_to_run")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 23.6, height: 27.84)
                            .position(x: 6.0+(23.6/2), y: 6.0+(27.84/2))
                            .ignoresSafeArea(.all)

                        Text(sceneData.name)
                            .font(.system(size: 13))
                            .foregroundColor(Color(#colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)))
                            .frame(width: geo.size.width-15, height: 22, alignment: .bottomLeading)
                            .position(x: 6.0+((geo.size.width-15)/2), y: geo.size.height-6.0-(22/2))
                    }
                    if sceneData.sceneId.isEmpty {
                        ZhanWeiView()
                    }
                }
            }
            .padding(EdgeInsets(top:8, leading: 10, bottom: 0.5, trailing:-1.5))
            
            
            GeometryReader{ geo in
                if sceneData2.sceneId.isEmpty == false {
                    GeometryReader{ geo in
                        ZStack{
                            Link(destination: URL(string: "widget_deviceUUID:" + sceneData2.sceneId + ":IScene")!) {
                                BackgroundView()
                                    .background(Color(#colorLiteral(red: 0.3921568627, green: 0.537254902, blue: 0.7411764706, alpha: 1)))
//                                    .cornerRadius(14)
                            }

                            Image("tap_to_run")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 23.6, height: 27.84)
                                .position(x: 6.0+(23.6/2), y: 6.0+(27.84/2))
                                .ignoresSafeArea(.all)

                            Text(sceneData2.name)
                                .font(.system(size: 13))
                                .foregroundColor(Color(#colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)))
                                .frame(width: geo.size.width-15, height: 22, alignment: .bottomLeading)
                                .position(x: 6.0+((geo.size.width-15)/2), y: geo.size.height-6.0-(22/2))
                        }
                    }
                }
                if sceneData2.sceneId.isEmpty {
                    ZhanWeiView()
                }
            }
            .padding(EdgeInsets(top:8, leading: -1.5, bottom: 0.5, trailing:10))
        }
        
        
        HStack
        {
            GeometryReader{ geo in
                if sceneData3.sceneId.isEmpty == false {
                    ZStack{
                        Link(destination: URL(string: "widget_deviceUUID:" + sceneData3.sceneId + ":IScene")!) {
                            BackgroundView()
                                .background(Color(#colorLiteral(red: 0.3137254902, green: 0.6117647059, blue: 0.5176470588, alpha: 1)))
//                                .cornerRadius(14)
                        }


                        Image("tap_to_run")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 23.6, height: 27.84)
                            .position(x: 6.0+(23.6/2), y: 6.0+(27.84/2))
                            .ignoresSafeArea(.all)

                        Text(sceneData3.name)
                            .font(.system(size: 13))
                            .foregroundColor(Color(#colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)))
                            .frame(width: geo.size.width-15, height: 22, alignment: .bottomLeading)
                            .position(x: 6.0+((geo.size.width-15)/2), y: geo.size.height-6.0-(22/2))
                    }
                }
                if sceneData3.sceneId.isEmpty {
                    ZhanWeiView()
                }
            }
            .padding(EdgeInsets(top:0.5, leading: 10, bottom: 10, trailing:-1.5))
            

            GeometryReader{ geo in
                if sceneData4.sceneId.isEmpty == false {
                    ZStack{
                        Link(destination: URL(string: "widget_deviceUUID:" + sceneData4.sceneId + ":IScene")!) {
                            BackgroundView()
                                .background(Color(#colorLiteral(red: 0.8901960784, green: 0.3803921569, blue: 0.3960784314, alpha: 1)))
//                                .cornerRadius(14)
                        }

                        Image("tap_to_run")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 23.6, height: 27.84)
                            .position(x: 6.0+(23.6/2), y: 6.0+(27.84/2))
                            .ignoresSafeArea(.all)

                        Text(sceneData4.name)
                            .font(.system(size: 13))
                            .foregroundColor(Color(#colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)))
                            .frame(width: geo.size.width-15, height: 22, alignment: .bottomLeading)
                            .position(x: 6.0+((geo.size.width-15)/2), y: geo.size.height-6.0-(22/2))
                    }
                }
                if sceneData4.sceneId.isEmpty {
                    ZhanWeiView()
                }
            }
            .padding(EdgeInsets(top:0.5, leading: -1.5, bottom: 10, trailing:10))
        }
    }
}


struct OneClickLargeView: View
{
    var entry: OneClickWidgetProvider.Entry
    var body: some View {
        let sceneData : SceneData = entry.contact
        let sceneData2 : SceneData = entry.contact2
        let sceneData3 : SceneData = entry.contact3
        let sceneData4 : SceneData = entry.contact4
        let sceneData5 : SceneData = entry.contact5
        let sceneData6 : SceneData = entry.contact6
        let sceneData7 : SceneData = entry.contact7
        let sceneData8 : SceneData = entry.contact8
        
        VStack{
            HStack
            {
                GeometryReader{ geo in
                    if sceneData.sceneId.isEmpty == false {
                        Link(destination: URL(string: "widget_deviceUUID:" + sceneData.sceneId + ":IScene")!) {
                            BackgroundView()
                                .background(Color(#colorLiteral(red: 0.8823529412, green: 0.5529411765, blue: 0.3411764706, alpha: 1)))
//                                .cornerRadius(14)
                        }
                        
                        Image("tap_to_run")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 23.6, height: 27.84)
                            .position(x: 6.0+(23.6/2), y: 6.0+(27.84/2))
                            .ignoresSafeArea(.all)
                        
                        Text(sceneData.name)
                            .font(.system(size: 13))
                            .foregroundColor(Color(#colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)))
                            .frame(width: geo.size.width-15, height: 22, alignment: .bottomLeading)
                            .position(x: 6.0+((geo.size.width-15)/2), y: geo.size.height-6.0-(22/2))
                    }
                    if sceneData.sceneId.isEmpty{
                        ZhanWeiView()
                    }
                }
                .padding(EdgeInsets(top:0, leading: 10, bottom: 0, trailing:-1.5))
                
                
                GeometryReader{ geo in
                    if sceneData2.sceneId.isEmpty == false {
                        Link(destination: URL(string: "widget_deviceUUID:" + sceneData2.sceneId + ":IScene")!) {
                            BackgroundView()
                                .background(Color(#colorLiteral(red: 0.3921568627, green: 0.537254902, blue: 0.7411764706, alpha: 1)))
//                                .cornerRadius(14)
                        }
                        
                        Image("tap_to_run")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 23.6, height: 27.84)
                            .position(x: 6.0+(23.6/2), y: 6.0+(27.84/2))
                            .ignoresSafeArea(.all)
                        
                        Text(sceneData2.name)
                            .font(.system(size: 13))
                            .foregroundColor(Color(#colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)))
                            .frame(width: geo.size.width-15, height: 22, alignment: .bottomLeading)
                            .position(x: 6.0+((geo.size.width-15)/2), y: geo.size.height-6.0-(22/2))
                    }
                    if sceneData2.sceneId.isEmpty{
                        ZhanWeiView()
                    }
                }
                .padding(EdgeInsets(top:0, leading: -1.5, bottom: 0, trailing:10))
            }
            
            HStack
            {
                
                GeometryReader{ geo in
                    if sceneData3.sceneId.isEmpty == false {
                        Link(destination: URL(string: "widget_deviceUUID:" + sceneData3.sceneId + ":IScene")!) {
                            BackgroundView()
                                .background(Color(#colorLiteral(red: 0.3137254902, green: 0.6117647059, blue: 0.5176470588, alpha: 1)))
//                                .cornerRadius(14)
                        }
                        
                        Image("tap_to_run")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 23.6, height: 27.84)
                            .position(x: 6.0+(23.6/2), y: 6.0+(27.84/2))
                            .ignoresSafeArea(.all)
                        
                        Text(sceneData3.name)
                            .font(.system(size: 13))
                            .foregroundColor(Color(#colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)))
                            .frame(width: geo.size.width-15, height: 22, alignment: .bottomLeading)
                            .position(x: 6.0+((geo.size.width-15)/2), y: geo.size.height-6.0-(22/2))
                    }
                    if sceneData3.sceneId.isEmpty{
                        ZhanWeiView()
                    }
                }
                .padding(EdgeInsets(top:0, leading: 10, bottom: 0, trailing:-1.5))
                
                
                GeometryReader{ geo in
                    if sceneData4.sceneId.isEmpty == false {
                        Link(destination: URL(string: "widget_deviceUUID:" + sceneData4.sceneId + ":IScene")!) {
                            BackgroundView()
                                .background(Color(#colorLiteral(red: 0.8901960784, green: 0.3803921569, blue: 0.3960784314, alpha: 1)))
//                                .cornerRadius(14)
                        }
                        
                        Image("tap_to_run")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 23.6, height: 27.84)
                            .position(x: 6.0+(23.6/2), y: 6.0+(27.84/2))
                            .ignoresSafeArea(.all)
                        
                        Text(sceneData4.name)
                            .font(.system(size: 13))
                            .foregroundColor(Color(#colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)))
                            .frame(width: geo.size.width-15, height: 22, alignment: .bottomLeading)
                            .position(x: 6.0+((geo.size.width-15)/2), y: geo.size.height-6.0-(22/2))
                    }
                    if sceneData4.sceneId.isEmpty{
                        ZhanWeiView()
                    }
                }
                .padding(EdgeInsets(top:0, leading: -1.5, bottom: 0, trailing:10))
            }
            
            HStack
            {
                
                GeometryReader{ geo in
                    if sceneData5.sceneId.isEmpty == false {
                        Link(destination: URL(string: "widget_deviceUUID:" + sceneData5.sceneId + ":IScene")!) {
                            BackgroundView()
                                .background(Color(#colorLiteral(red: 0.4156862745, green: 0.4588235294, blue: 0.7411764706, alpha: 1)))
//                                .cornerRadius(14)
                        }
                        
                        
                        Image("tap_to_run")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 23.6, height: 27.84)
                            .position(x: 6.0+(23.6/2), y: 6.0+(27.84/2))
                            .ignoresSafeArea(.all)
                        
                        Text(sceneData5.name)
                            .font(.system(size: 13))
                            .foregroundColor(Color(#colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)))
                            .frame(width: geo.size.width-15, height: 22, alignment: .bottomLeading)
                            .position(x: 6.0+((geo.size.width-15)/2), y: geo.size.height-6.0-(22/2))
                    }
                    if sceneData5.sceneId.isEmpty{
                        ZhanWeiView()
                    }
                }
                .padding(EdgeInsets(top:0, leading: 10, bottom: 0, trailing:-1.5))
                
                
                GeometryReader{ geo in
                    if sceneData6.sceneId.isEmpty == false {
                        Link(destination: URL(string: "widget_deviceUUID:" + sceneData6.sceneId + ":IScene")!) {
                            BackgroundView()
                                .background(Color(#colorLiteral(red: 0.5294117647, green: 0.5529411765, blue: 0.5254901961, alpha: 1)))
//                                .cornerRadius(14)
                        }
                        
                        Image("tap_to_run")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 23.6, height: 27.84)
                            .position(x: 6.0+(23.6/2), y: 6.0+(27.84/2))
                            .ignoresSafeArea(.all)
                        
                        Text(sceneData6.name)
                            .font(.system(size: 13))
                            .foregroundColor(Color(#colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)))
                            .frame(width: geo.size.width-15, height: 22, alignment: .bottomLeading)
                            .position(x: 6.0+((geo.size.width-15)/2), y: geo.size.height-6.0-(22/2))
                    }
                    if sceneData6.sceneId.isEmpty{
                        ZhanWeiView()
                    }
                }
                .padding(EdgeInsets(top:0, leading: -1.5, bottom: 0, trailing:10))
            }
            
            HStack
            {
                GeometryReader{ geo in
                    if sceneData7.sceneId.isEmpty == false {
                        Link(destination: URL(string: "widget_deviceUUID:" + sceneData7.sceneId + ":IScene")!) {
                            BackgroundView()
                                .background(Color(#colorLiteral(red: 0.3921568627, green: 0.6196078431, blue: 0.2823529412, alpha: 1)))
//                                .cornerRadius(14)
                        }
                        
                        Image("tap_to_run")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 23.6, height: 27.84)
                            .position(x: 6.0+(23.6/2), y: 6.0+(27.84/2))
                            .ignoresSafeArea(.all)
                        
                        Text(sceneData7.name)
                            .font(.system(size: 13))
                            .foregroundColor(Color(#colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)))
                            .frame(width: geo.size.width-15, height: 22, alignment: .bottomLeading)
                            .position(x: 6.0+((geo.size.width-15)/2), y: geo.size.height-6.0-(22/2))
                    }
                    if sceneData7.sceneId.isEmpty{
                        ZhanWeiView()
                    }
                }
                .padding(EdgeInsets(top:0, leading: 10, bottom: 0, trailing:-1.5))
                
                
                GeometryReader{ geo in
                    if sceneData8.sceneId.isEmpty == false {
                        Link(destination: URL(string: "widget_deviceUUID:" + sceneData8.sceneId + ":IScene")!) {
                            BackgroundView()
                                .background(Color(#colorLiteral(red: 0.7137254902, green: 0.4352941176, blue: 0.7254901961, alpha: 1)))
//                                .cornerRadius(14)
                        }
                        
                        Image("tap_to_run")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 23.6, height: 27.84)
                            .position(x: 6.0+(23.6/2), y: 6.0+(27.84/2))
                            .ignoresSafeArea(.all)
                        
                        Text(sceneData8.name)
                            .font(.system(size: 13))
                            .foregroundColor(Color(#colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)))
                            .frame(width: geo.size.width-15, height: 22, alignment: .bottomLeading)
                            .position(x: 6.0+((geo.size.width-15)/2), y: geo.size.height-6.0-(22/2))
                        
                    }
                    if sceneData8.sceneId.isEmpty {
                        ZhanWeiView()
                    }
                }
                .padding(EdgeInsets(top:0, leading: -1.5, bottom: 0, trailing:10))
            }
        }
        .padding(EdgeInsets(top:8, leading: 0, bottom: 8, trailing:0))
    }
}


//背景
struct BackgroundView:View
{
    var body: some View
    {
        Image("")
            .resizable()
    }
}

//背景
struct ZhanWeiView:View
{
    var body: some View
    {
        Image("")
            .resizable()
            .background(Color("beijing"))
//            .cornerRadius(10)
    }
}
