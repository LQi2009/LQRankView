//
//  LQRankView.m
//  LACustomProgress
//
//  Created by LiuQiqiang on 2018/3/30.
//  Copyright © 2018年 LiuQiqiang. All rights reserved.
//

#import "LQRankView.h"



@interface LQRankView(){
//    CGFloat __space;
}

@property (nonatomic, strong) CAShapeLayer *backgroundLayer;
@property (nonatomic, strong) CAShapeLayer *progressLayer;
@property (nonatomic, strong) CAShapeLayer *nodeLayer;
@property (nonatomic, assign) CGFloat value;

@end
@implementation LQRankView
+ (instancetype)rankViewWithFrame:(CGRect)frame ranks:(NSArray *)ranks color:(UIColor *)color font:(UIFont *)font {
    
    LQRankView *rank = [[LQRankView alloc]initWithFrame:frame];
    rank.ranks = [NSArray arrayWithArray:ranks];
    rank.color = color;
    rank.font = font;
    return rank;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        _color = [UIColor colorWithDisplayP3Red:231/255.0 green:115/255.0 blue:47/255.0 alpha:1.0];
        _maxValue = 1.0;
        _minValue = 0.0;
        _currentValue = 0.5;
        _font = [UIFont systemFontOfSize:12];
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (CAShapeLayer *)backgroundLayer {
    if (_backgroundLayer == nil) {
        _backgroundLayer = [[CAShapeLayer alloc]init];
        
        _backgroundLayer.lineWidth = 1;
        _backgroundLayer.fillColor = [UIColor clearColor].CGColor;
        _backgroundLayer.frame = CGRectMake(0, 0, self.frame.size.width, (self.frame.size.height)/2.0);
        [self.layer addSublayer:_backgroundLayer];
    }
    
    return _backgroundLayer;
}

- (CAShapeLayer *)progressLayer {
    if (_progressLayer == nil) {
        _progressLayer = [[CAShapeLayer alloc]init];
        [self.layer addSublayer:_progressLayer];
    }
    
    return _progressLayer;
}

- (CAShapeLayer *)nodeLayer {
    if (_nodeLayer == nil) {
        
        _nodeLayer = [[CAShapeLayer alloc]init];
        
        _nodeLayer.fillColor = [UIColor clearColor].CGColor;
        
        [self.layer addSublayer:_nodeLayer];
    }
    
    return _nodeLayer;
}

- (CGFloat)value {
    
    return (self.currentValue - self.minValue)/(self.maxValue - self.minValue);
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGRect bframe = self.backgroundLayer.frame;
    
    // 画背景环
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:bframe byRoundingCorners:(UIRectCornerAllCorners) cornerRadii:CGSizeMake(bframe.size.height/2.0, bframe.size.height/2.0)];
    
    self.backgroundLayer.path = path.CGPath;
    self.backgroundLayer.strokeColor = self.color.CGColor;
    
    // 画进度条
    CGRect pframe = CGRectMake(bframe.origin.x, bframe.origin.y, bframe.size.width * self.value, bframe.size.height);
    
    UIBezierPath *progressPath = [UIBezierPath bezierPathWithRoundedRect:pframe byRoundingCorners:(UIRectCornerAllCorners) cornerRadii:CGSizeMake(pframe.size.height/2.0, pframe.size.height/2.0)];
    
//    self.progressLayer.frame = pframe;
    self.progressLayer.path = progressPath.CGPath;
    self.progressLayer.fillColor = self.color.CGColor;
    
    if (self.style == LQRankViewStyleRing) {
        
        pframe.size.width -= pframe.size.height;
        
        UIBezierPath *progressPath1 = [UIBezierPath bezierPathWithRoundedRect:pframe byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerBottomLeft) cornerRadii:CGSizeMake(pframe.size.height/2.0, pframe.size.height/2.0)];
        self.progressLayer.path = progressPath1.CGPath;
        
        // 画进度条结尾的圆环
        self.nodeLayer.lineWidth = pframe.size.height/3.0;
        
        CGRect nodeFrame = CGRectMake(pframe.origin.x + pframe.size.width - self.nodeLayer.lineWidth/2.0 , 0, pframe.size.height, pframe.size.height);
        UIBezierPath *nodePath = [UIBezierPath bezierPathWithOvalInRect:nodeFrame];
        
        self.nodeLayer.path = nodePath.CGPath;
        self.nodeLayer.strokeColor = self.color.CGColor;
    }
    
    // 绘制文字
    CGFloat space = self.bounds.size.width / self.ranks.count;
    [self.ranks enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSString *title = (NSString *)obj;
        NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        style.alignment = NSTextAlignmentCenter;
        CGRect textFrame = CGRectMake(idx * space, self.backgroundLayer.frame.size.height + 2, space, self.backgroundLayer.frame.size.height - 2);
        
        [title drawInRect:textFrame withAttributes:@{NSFontAttributeName : self.font, NSParagraphStyleAttributeName: style,NSForegroundColorAttributeName:self.color}];
        
//        [[UIImage imageNamed:@"test"] drawInRect:textFrame];
    }];
}


@end
