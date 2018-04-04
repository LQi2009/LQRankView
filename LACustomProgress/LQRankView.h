//
//  LQRankView.h
//  LACustomProgress
//
//  Created by LiuQiqiang on 2018/3/30.
//  Copyright © 2018年 LiuQiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LQRankViewStyle) {
    
    LQRankViewStyleCircle,
    LQRankViewStyleRing,
};

@interface LQRankView : UIView

/**
 颜色
 */
@property (nonatomic, strong) UIColor *color;

/**
 分段显示的文字数组
 */
@property (nonatomic, strong) NSArray<NSString *> *ranks;

/**
 分段显示文字字体
 */
@property (nonatomic, strong) UIFont *font;

/**
 最大值
 */
@property (nonatomic, assign) CGFloat maxValue;

/**
 最小值
 */
@property (nonatomic, assign) CGFloat minValue;

/**
 当前值
 */
@property (nonatomic, assign) CGFloat currentValue;

/**
 样式，目前有两种：节点为圆环和圆弧
 */
@property (nonatomic, assign) LQRankViewStyle style;

/**
 便利初始化方法

 @param frame frame
 @param ranks 分段显示的文字数组
 @param color 颜色
 @param font 分段显示文字字体
 @return 实例
 */
+ (instancetype)rankViewWithFrame:(CGRect)frame
                            ranks:(NSArray *)ranks
                            color:(UIColor *)color
                             font:(UIFont *)font;
@end
