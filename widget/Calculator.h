//
//  Calculator.h
//  widgetDemo
//
//  Created by 高宇 on 2021/1/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Calculator : NSObject

- (void)getDeviceList:(NSArray *)editArr Block:(void(^)(NSArray *_Nullable data))callback;

- (void)getISceneList:(void(^)(NSArray *_Nullable data))callback;

@end

NS_ASSUME_NONNULL_END
