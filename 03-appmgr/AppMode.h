//
//  AppMode.h
//  03-appmgr
//
//  Created by zhanglu1988em on 16/1/2.
//  Copyright © 2016年 wbder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppMode : NSObject
@property (nonatomic,copy) NSString* name;
@property (nonatomic,copy) NSString* icon;


-(instancetype) initWithDict: (NSDictionary*) dict;
+(instancetype) AppWithDict:(NSDictionary*) dict;
+(NSArray*) Apps;

@end
