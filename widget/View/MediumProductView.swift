//
//  MediumProductView.swift
//  WidgetTest
//
//  Created by zhangjingfei on 20/11/2020.
//

import SwiftUI
import Foundation
import UIKit

struct MediumProductView: View {
    var entry: FourToolWidgetProvider.Entry
    
    var body: some View
    {
        let contact : Contact = entry.contact
        let contact2 : Contact = entry.contact2
        
        HStack{
            Link(destination: URL(string: "widget_deviceUUID:" + contact.deviceUUID + ":Device:" + contact.status)!, label: {
                VStack
                {
                    ProductView(imageUrl: contact.imageUrl)
//                        .cornerRadius(14)
                        .padding(EdgeInsets(top:10, leading: 10, bottom: -8, trailing:0))
                    
                    
                    GeometryReader { geo in
                        if !contact.deviceUUID.isEmpty {
                            GeometryReader { geo in
                                Text(loadStatusText(status: contact.status) ?? String())
                                    .font(.system(size: 16))
                                    .foregroundColor(Color("testColor"))
                            }
                            .frame(height: 18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(EdgeInsets(top: 4, leading: 15, bottom: 28, trailing: 5))
                            
                            GeometryReader { geo in
                                Text(entry.contact.name)
                                    .font(.system(size: 13))
                                    .foregroundColor(Color("testColor2"))
                            }
                            .frame(height: 12, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(EdgeInsets(top: 25, leading: 15, bottom: 13, trailing: 5))
                        }
                    }
                    .frame(minWidth: 100, idealWidth: 100, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 18, maxHeight: 49.5, alignment: .center)
                }
                .padding(EdgeInsets(top:0, leading: 0, bottom: 0, trailing:1))
            })
            
            Link(destination: URL(string: "widget_deviceUUID:" + contact2.deviceUUID + ":Device:" + contact2.status)!, label: {
                VStack
                {
                    Image(uiImage: loadNetworkImage(imgUrlString: "https://wimg.ruan8.com/uploadimg/image/20190502/20190502165644_70280.jpg")!)
                        .resizable()   //自适应大小 * 图片没有完全显示全,我们可以用Image的resizable()来让图片自动适应
                        .scaledToFill()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .clipped()
//                    ProductView(imageUrl: contact2.imageUrl)
//                        .cornerRadius(14)
                        .padding(EdgeInsets(top:10, leading: 0, bottom: -8, trailing:10))
                    
                    GeometryReader { geo in
                        if !contact2.deviceUUID.isEmpty {
                            GeometryReader { geo in
                                Text(loadStatusText(status: contact2.status) ?? String())
                                    .font(.system(size: 16))
                                    .foregroundColor(Color("testColor"))
                            }
                            .frame(height: 18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(EdgeInsets(top: 4, leading: 5, bottom: 28, trailing: 15))
                            
                            GeometryReader { geo in
                                Text(contact2.name)
                                    .font(.system(size: 13))
                                    .foregroundColor(Color("testColor2"))
                            }
                            .frame(height: 12, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(EdgeInsets(top: 25, leading: 5, bottom: 13, trailing: 15))
                        }
                    }
                    .frame(minWidth: 100, idealWidth: 100, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 18, maxHeight: 49.5, alignment: .center)
                }
                .padding(EdgeInsets(top:0, leading: 1, bottom: 0, trailing:0))
            })
        }
    }
}


