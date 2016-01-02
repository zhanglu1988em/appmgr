//
//  AppMode.m
//  03-appmgr
//
//  Created by zhanglu1988em on 16/1/2.
//  Copyright © 2016年 wbder. All rights reserved.
//

#import "AppMode.h"

@implementation AppMode

-(instancetype) initWithDict: (NSDictionary*) dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype) AppWithDict:(NSDictionary*) dict
{
    return [[self alloc] initWithDict:dict];
}

+(NSArray*)Apps
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"app" ofType:@"plist"];
    NSArray *arry = [[NSArray alloc] initWithContentsOfFile:path];
    NSMutableArray *arryM = [NSMutableArray array];
    for (NSDictionary *dict in arry) {
        [arryM addObject:[self AppWithDict:dict]];
    }
    return arryM;
}

@end
