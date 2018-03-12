//
//  ViewController.m
//  layerDemo5
//
//  Created by PatrickY on 2018/3/12.
//  Copyright © 2018年 PatrickY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *minHand;
@property (weak, nonatomic) IBOutlet UIImageView *hourHand;
@property (weak, nonatomic) IBOutlet UIImageView *secHand;
@property (weak, nonatomic) NSTimer              *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //调整anchorPoint
    self.hourHand.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    self.minHand.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    self.secHand.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    
    //开启定时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    
    //初始化位置
    [self tick];

}

//钟表
- (void)tick {
    //时间换算
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSUInteger units = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];

    CGFloat hourAngle = (components.hour / 12.0) * M_PI * 2.0;
    CGFloat minuAngle = (components.minute / 60.0) * M_PI * 2.0;
    CGFloat secdAngle = (components.second / 60.0) *M_PI * 2.0;
    
    //旋转指针
    self.hourHand.transform = CGAffineTransformMakeRotation(hourAngle);
    self.minHand.transform = CGAffineTransformMakeRotation(minuAngle);
    self.secHand.transform = CGAffineTransformMakeRotation(secdAngle);
    
    
}


@end
