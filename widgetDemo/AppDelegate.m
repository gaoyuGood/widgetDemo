//
//  AppDelegate.m
//  widgetDemo
//
//  Created by 高宇 on 2021/1/27.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //将图片存在AppGroup里
    //获取App Group的共享目录
    NSURL *containerURL = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:@"widgetDemo.AppGroupID"];
    //拼接详细路径
    containerURL = [containerURL URLByAppendingPathComponent:[NSString stringWithFormat:@"%@",@"lol1"]];
    //获取到数据
    NSData *imageData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"lol1" ofType:@"jpg"]];
    //写入文件
    [imageData writeToURL:containerURL atomically:YES];
    
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        NSLog(@"可以");
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
    }else{
        NSLog(@"打不开");
    }
    return NO;
}

@end
