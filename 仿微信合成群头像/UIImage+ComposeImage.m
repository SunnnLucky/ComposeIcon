//
//  UIImage+ComposeImage.m
//  IconListView
//
//  Created by 孙磊 on 2018/4/24.
//  Copyright © 2018年 Sun. All rights reserved.
//

#import "UIImage+ComposeImage.h"
#import "SDWebImageManager.h"

//items小于4每行数量
static const int kColCountLessFour = 2;
//每行数量
static const int kColCount = 3;
//预留间距 - 根据每行个数
static const int kMargin = 3;

//数组大小
//static int urlArrayCount = 0;

@implementation UIImage (ComposeImage)

+ (UIImage*)ComposeImageWithImageArray:(NSArray<UIImage *>*)imageArray ContextSize:(CGSize)contextSize{
    
    //如果大于9张图
    if(imageArray.count > 9 || imageArray.count == 0) return nil;
    
    if(imageArray.count == 1){
        return [self lessThanFourItemsWithArray:imageArray ContextSize:contextSize CloCount:1];
    }else if(imageArray.count <= 4){
        return [self lessThanFourItemsWithArray:imageArray ContextSize:contextSize CloCount:kColCountLessFour];
    }else{
        return [self lessThanFourItemsWithArray:imageArray ContextSize:contextSize CloCount:kColCount];
    }
}

+ (UIImage *)lessThanFourItemsWithArray:(NSArray<UIImage *>*)imageArray ContextSize:(CGSize)contextSize CloCount:(int)colCount{
    //内部图片宽高
    CGFloat w = contextSize.width / colCount - kMargin;
    CGFloat h = contextSize.height / colCount - kMargin;
    CGFloat margin = (contextSize.width - colCount * w) / (colCount + 1);
    
    UIImage *backImage = [self createImageWithColor:[UIColor lightGrayColor]];
    
    UIGraphicsBeginImageContext(contextSize);
    
    //先绘制背景色
    [backImage drawInRect:CGRectMake(0, 0, contextSize.width, contextSize.height)];
    
    for (int i = 0; i < imageArray.count; i++) {
        CGFloat x = (i % colCount) * (margin + w) + margin;
        CGFloat y = 0.0f;
        if(imageArray.count == 2 || imageArray.count == 5 || imageArray.count == 6){
            //居中
            y = (i / colCount) * h + ((contextSize.height * 0.5) - (h));
        }else{
            y = (i / colCount) * (margin + h) + margin;
        }
        
        [imageArray[i] drawInRect:CGRectMake(x, y, w, h)];
    }
    
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultingImage;
}

//根据颜色创建Image
+ (UIImage *)createImageWithColor: (UIColor *)color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+ (void)ComposeImageWithURLArray:(NSArray<NSURL *>*)URLArray ContextSize:(CGSize)contextSize Succeed:(succeedBlock)succees{
    
    NSMutableArray <UIImage *> * array = [NSMutableArray array];
    
    SDWebImageManager * manager = [SDWebImageManager sharedManager];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        //NSLog(@"并发队列所在线程%@",[NSThread currentThread]);
        
        dispatch_group_t requestGroup = dispatch_group_create();
        
        for (NSURL * url in URLArray) {
            dispatch_group_enter(requestGroup);
            [manager downloadImageWithURL:url options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                //下载进度
            } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                //下载完成
                if (image) {
                    [array addObject:image];
                }else{
                    //图片下载失败
                    [array addObject:[UIImage imageNamed:@"error"]];
                }
                dispatch_group_leave(requestGroup);
            }];
            dispatch_group_wait(requestGroup, DISPATCH_TIME_FOREVER);
        }
        
        //回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            //NSLog(@"设置完成");
            UIImage * image = [self ComposeImageWithImageArray:array ContextSize:contextSize];
            if (succees) {
                succees(image);
            }
        });
    });
}

@end
