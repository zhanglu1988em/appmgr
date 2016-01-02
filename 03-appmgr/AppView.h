//
//  AppView.h
//  03-appmgr
//
//  Created by zhanglu1988em on 16/1/2.
//  Copyright © 2016年 wbder. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AppViewDelegate <NSObject>
-(void) download:(NSString*) tittle;
@end

@class AppMode;
@interface AppView : UIView

@property (nonatomic,weak) id<AppViewDelegate> delegate;
+(instancetype) appView;
+(instancetype) appViewWithMode:(AppMode *) app;



@end
