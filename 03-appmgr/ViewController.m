//
//  ViewController.m
//  03-appmgr
//
//  Created by zhanglu1988em on 16/1/2.
//  Copyright © 2016年 wbder. All rights reserved.
//

#import "ViewController.h"
#import "AppMode.h"
#import "AppView.h"

#define kAppColomns 3
#define kColomnSpacing  20
#define kRowSpacing  10
#define kViewWidth  80
#define kViewHight  90

@interface ViewController ()<AppViewDelegate>
@property (nonatomic,strong) NSArray* arry;
@property (nonatomic,strong) UILabel* promptLbl;
@end

@implementation ViewController


-(NSArray*) arry
{
    if (_arry == nil) {
        _arry = [AppMode Apps];
    }
    return _arry;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self loadApps];
}

-(void) loadApps
{
    CGFloat marginX = (self.view.bounds.size.width - kAppColomns * kViewWidth) / (kAppColomns + 1);
    for (int i = 0;  i < self.arry.count;  ++i) {
        AppView *view = [AppView appViewWithMode: self.arry[i]];
        int xAt = i % kAppColomns;
        int yAt = i / kAppColomns;
        int x = marginX + (kViewWidth + marginX) * xAt;
        int y = 10 + kRowSpacing + (kViewHight + kRowSpacing) * yAt;
        view.frame = CGRectMake(x, y, kViewWidth, kViewHight);
        view.delegate = self;
        [self.view addSubview:view];
    }
}

-(void) download:(NSString*) title;
{
    NSLog(@"%s,%@",__func__,title);
    
    self.promptLbl = [[UILabel alloc] initWithFrame:CGRectMake(80, 400, 160, 40)];
    [self.promptLbl setText:title];
    [self.promptLbl setTextAlignment:NSTextAlignmentCenter];
    [self.promptLbl setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.2]];
    
    [self.view addSubview:self.promptLbl];
    self.promptLbl.alpha = 0.0;
    [UIView animateWithDuration:1.0f animations:^{
        self.promptLbl.alpha = 1.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0f animations:^{
            {
                self.promptLbl.alpha = 0.0;
            }
        } completion:^(BOOL finished) {
            {
                [self.promptLbl removeFromSuperview];
            }
        }];
    }];
    
}

@end
