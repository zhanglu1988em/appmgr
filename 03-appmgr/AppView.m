//
//  AppView.m
//  03-appmgr
//
//  Created by zhanglu1988em on 16/1/2.
//  Copyright © 2016年 wbder. All rights reserved.
//

#import "AppView.h"
#import "AppMode.h"

@interface AppView()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@end

@implementation AppView



+(instancetype) appView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"AppView" owner:nil options:nil] lastObject];
}

+(instancetype) appViewWithMode:(AppMode *) app
{
    AppView *view = [self appView];
    [view.icon setImage:[UIImage imageNamed:app.icon]];
    [view.name setText:app.name];
    return view;
}
- (IBAction)download:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(download:)]) {
        sender.enabled = NO;
        [self.delegate download : self.name.text];
    }
    
}

@end
