//
//  Calculator.m
//  widgetDemo
//
//  Created by 高宇 on 2021/1/28.
//

#import "Calculator.h"

@implementation Calculator

//请求设备列表
- (void)getDeviceList:(NSArray *)editArr Block:(void(^)(NSArray *_Nullable data))callback {
    //编辑内容的数据（可以通过编辑数据处理内容）
    __block NSArray *editCacheArr = nil;
    if (editArr != nil) {
        editCacheArr = editArr;
    }
    
//    // 从获取用户数据NSUserDefaults
//    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"widgetDemo.AppGroupID"];
//    NSString *token = [userDefaults valueForKey:@"shortcutsToken"];
//    NSInteger stageInteger = [userDefaults integerForKey:@"stageVersion"];

    //这里模拟网络请求数据
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSMutableArray *datas = [NSMutableArray array];
        NSMutableArray *deviceUUIDList = [NSMutableArray array];
        
        for (int index = 0; index < 4; index++) {
            //4种数据
            if (index == 0) {
                NSString *deviceUUID = @"ez";
                NSString *deviceStatus = @"ez";
                NSString *name = @"(￣▽￣)~*";
                //图片取本地缓存, data类型
                //从主targets里取
                NSData *imageData = [self getThumbnailFromDicWithDeviceInfo:deviceUUID];
                NSDictionary *dic = @{@"deviceUUID":deviceUUID ,@"name":name,@"deviceStatus":deviceStatus,@"thumbnailUrl":imageData};
                
                [datas addObject:dic];
                [deviceUUIDList addObject:dic[@"deviceUUID"]];
            }
            else if (index == 1) {
                NSString *deviceUUID = @"lakesi";
                NSString *deviceStatus = @"lakesi";
                NSString *name = @"(｀∀´)Ψ";
                //图片取本地缓存, data类型
                //从widget里取
                NSData *imageData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"lakesi" ofType:@"jpg"]];
                
                NSDictionary *dic = @{@"deviceUUID":deviceUUID ,@"name":name,@"deviceStatus":deviceStatus,@"thumbnailUrl":imageData};
                
                [datas addObject:dic];
                [deviceUUIDList addObject:dic[@"deviceUUID"]];
            }
            else if (index == 2) {
                NSString *deviceUUID = @"nanqiang";
                NSString *deviceStatus = @"nanqiang";
                NSString *name = @"(╬￣皿￣)=○";
                //图片取本地缓存, data类型
                //从widget里取
                NSData *imageData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"nanqiang" ofType:@"jpg"]];
                
                NSDictionary *dic = @{@"deviceUUID":deviceUUID ,@"name":name,@"deviceStatus":deviceStatus,@"thumbnailUrl":imageData};
                
                [datas addObject:dic];
                [deviceUUIDList addObject:dic[@"deviceUUID"]];
            }
            else if (index == 3) {
                NSString *deviceUUID = @"kate";
                NSString *deviceStatus = @"kate";
                NSString *name = @"☆´∀｀☆";
                //图片取本地缓存, data类型
                //从widget里取
                NSData *imageData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"kate" ofType:@"jpg"]];
                
                NSDictionary *dic = @{@"deviceUUID":deviceUUID ,@"name":name,@"deviceStatus":deviceStatus,@"thumbnailUrl":imageData};
                
                [datas addObject:dic];
                [deviceUUIDList addObject:dic[@"deviceUUID"]];
            }
        }
        
        //编辑内容和真实数据对比(正则排序)
        //找到在datas在数组editCacheArr中的数据
        NSPredicate * filterPredicate_same = [NSPredicate predicateWithFormat:@"SELF IN %@",deviceUUIDList];
        NSArray * filter_no = [editCacheArr filteredArrayUsingPredicate:filterPredicate_same];

        //找到在datas中不在数组editCacheArr中的数据
        NSPredicate * filterPredicate1 = [NSPredicate predicateWithFormat:@"NOT (SELF IN %@)",editCacheArr];
        NSArray * filter1 = [deviceUUIDList filteredArrayUsingPredicate:filterPredicate1];

        //拼接数组(该数组为顺序和数据都对的deviceUUID数组)
        NSMutableArray *array = [NSMutableArray arrayWithArray:filter_no];
        [array addObjectsFromArray:filter1];

        NSMutableArray *dataArr = [NSMutableArray array];
        for (NSString *deviceUUID in array) {
            [datas enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSDictionary *dic = obj;
                if ([dic[@"deviceUUID"] isEqual:deviceUUID]) {
                    [dataArr addObject:dic];
                    *stop = YES;
                }
            }];
        }
        
        if (callback) {
            callback([dataArr copy]);
        }
    });
}


//请求自动化列表,一键执行
- (void)getISceneList:(void(^)(NSArray *_Nullable data))callback {
    NSMutableArray *datas = [NSMutableArray array];
    for (int index = 0; index < 5; index++) {
        NSDictionary *dic = @{@"sceneId":@123 ,@"name":@"testName"};
        
        [datas addObject:dic];
    }
    
    if (callback) {
        callback([datas copy]);
    }
    
//            arr = [[arr reverseObjectEnumerator] allObjects];  //逆序
}



#pragma mark --------------------------------- 获取内存中的图片模块 -----------------------------------------
- (NSData *) getThumbnailFromDicWithDeviceInfo:(NSString *)deviceUUID{
    NSURL *containerURL = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:@"widgetDemo.AppGroupID"];
    containerURL = [containerURL URLByAppendingPathComponent:[NSString stringWithFormat:@"%@",@"lol1"]];
    
    NSData *resultData = [NSData dataWithContentsOfFile:containerURL.path];
    //如果取不到给空对象，不给nil
    if (!resultData) {
        return [[NSData alloc] init];
    }
    return resultData;
}


@end
