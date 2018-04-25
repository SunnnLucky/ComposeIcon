//
//  UIImage+ComposeImage.h
//  IconListView
//
//  Created by 孙磊 on 2018/4/24.
//  Copyright © 2018年 Sun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^succeedBlock)(UIImage *image);

@interface UIImage (ComposeImage)

/**
 *  根据所传图片数组返回合成图
 *
 *  @param imageArray   图片数组
 *  @param contextSize  需要展示的大小
 */
+ (UIImage*)ComposeImageWithImageArray:(NSArray<UIImage *>*)imageArray ContextSize:(CGSize)contextSize;

/**
 *  根据所传URL数组返回合成图
 *
 *  @param URLArray     URL数组
 *  @param contextSize  需要展示的大小
 */
+ (void)ComposeImageWithURLArray:(NSArray<NSURL *>*)URLArray ContextSize:(CGSize)contextSize Succeed:(succeedBlock)succees;


/**
 *  根据颜色创建Image
 *
 *  @param color        所需颜色
 */
+ (UIImage *)createImageWithColor: (UIColor *)color;

@end
