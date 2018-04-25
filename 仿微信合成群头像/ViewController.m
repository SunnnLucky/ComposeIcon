//
//  ViewController.m
//  仿微信合成群头像
//
//  Created by 孙磊 on 2018/4/25.
//  Copyright © 2018年 Sun. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+ComposeImage.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *image2;
@property (weak, nonatomic) IBOutlet UIImageView *image3;
@property (weak, nonatomic) IBOutlet UIImageView *image4;
@property (weak, nonatomic) IBOutlet UIImageView *image5;
@property (weak, nonatomic) IBOutlet UIImageView *image6;
@property (weak, nonatomic) IBOutlet UIImageView *image7;
@property (weak, nonatomic) IBOutlet UIImageView *image8;
@property (weak, nonatomic) IBOutlet UIImageView *image9;

@property (nonatomic,strong)NSMutableArray * urlArray1;
@property (nonatomic,strong)NSMutableArray * urlArray2;
@property (nonatomic,strong)NSMutableArray * urlArray3;
@property (nonatomic,strong)NSMutableArray * urlArray4;
@property (nonatomic,strong)NSMutableArray * urlArray5;
@property (nonatomic,strong)NSMutableArray * urlArray6;
@property (nonatomic,strong)NSMutableArray * urlArray7;
@property (nonatomic,strong)NSMutableArray * urlArray8;
@property (nonatomic,strong)NSMutableArray * urlArray9;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup{
    
    NSURL * url1 = [NSURL URLWithString:@"https://github.com/sunleiSuper/sunleiSuper.github.io/blob/master/img/icon.png?raw=true"];
    NSURL * url2 = [NSURL URLWithString:@"http://www.qqzhi.com/uploadpic/2014-09-23/000247589.jpg"];
    NSURL * url3 = [NSURL URLWithString:@"http://www.yyweishi.com/uploads/allimg/140323/010H92234-16.jpg"];
    NSURL * url4 = [NSURL URLWithString:@"http://img3.duitang.com/uploads/item/201505/26/20150526002859_c2yKG.thumb.700_0.jpeg"];
    NSURL * url5 = [NSURL URLWithString:@"http://imgsrc.baidu.com/imgad/pic/item/503d269759ee3d6d4eabbdef49166d224f4adea0.jpg"];
    NSURL * url6 = [NSURL URLWithString:@"http://imgsrc.baidu.com/imgad/pic/item/c83d70cf3bc79f3d5f29c12eb0a1cd11738b29e7.jpg"];
    NSURL * url7 = [NSURL URLWithString:@"http://img4.99114.com/group1/M00/57/D9/wKgGMFU-MoiAHAmZAABBumEIGJk220.jpg"];
    NSURL * url8 = [NSURL URLWithString:@"http://img5.duitang.com/uploads/item/201609/26/20160926124027_vxRkt.jpeg"];
    NSURL * url9 = [NSURL URLWithString:@"http://img3.duitang.com/uploads/item/201603/08/20160308130641_kUrWc.jpeg"];
    
    self.urlArray1 = [@[url1] mutableCopy];
    
    self.urlArray2 = [_urlArray1 mutableCopy];
    [self.urlArray2 addObject:url2];
    
    self.urlArray3 = [_urlArray2 mutableCopy];
    [self.urlArray3 addObject:url3];
    
    self.urlArray4 = [_urlArray3 mutableCopy];
    [self.urlArray4 addObject:url4];
    
    self.urlArray5 = [_urlArray4 mutableCopy];
    [self.urlArray5 addObject:url5];
    
    self.urlArray6 = [_urlArray5 mutableCopy];
    [self.urlArray6 addObject:url6];
    
    self.urlArray7 = [_urlArray6 mutableCopy];
    [self.urlArray7 addObject:url7];
    
    self.urlArray8 = [_urlArray7 mutableCopy];
    [self.urlArray8 addObject:url8];
    
    self.urlArray9 = [_urlArray8 mutableCopy];
    [self.urlArray9 addObject:url9];

}

- (IBAction)imageBtnClick:(id)sender {
    NSMutableArray * arrayM = [@[[UIImage imageNamed:@"1"]] mutableCopy];
    _image1.image = [UIImage ComposeImageWithImageArray:arrayM ContextSize:_image1.bounds.size];
    [arrayM addObject:[UIImage imageNamed:@"2"]];
    _image2.image = [UIImage ComposeImageWithImageArray:arrayM ContextSize:_image1.bounds.size];
    [arrayM addObject:[UIImage imageNamed:@"3"]];
    _image3.image = [UIImage ComposeImageWithImageArray:arrayM ContextSize:_image1.bounds.size];
    [arrayM addObject:[UIImage imageNamed:@"4"]];
    _image4.image = [UIImage ComposeImageWithImageArray:arrayM ContextSize:_image1.bounds.size];
    [arrayM addObject:[UIImage imageNamed:@"5"]];
    _image5.image = [UIImage ComposeImageWithImageArray:arrayM ContextSize:_image1.bounds.size];
    [arrayM addObject:[UIImage imageNamed:@"6"]];
    _image6.image = [UIImage ComposeImageWithImageArray:arrayM ContextSize:_image1.bounds.size];
    [arrayM addObject:[UIImage imageNamed:@"7"]];
    _image7.image = [UIImage ComposeImageWithImageArray:arrayM ContextSize:_image1.bounds.size];
    [arrayM addObject:[UIImage imageNamed:@"8"]];
    _image8.image = [UIImage ComposeImageWithImageArray:arrayM ContextSize:_image1.bounds.size];
    [arrayM addObject:[UIImage imageNamed:@"9"]];
    _image9.image = [UIImage ComposeImageWithImageArray:arrayM ContextSize:_image1.bounds.size];
}

- (IBAction)urlBtnClick:(id)sender {
    __weak typeof(self) weakSelf = self;
    
    [UIImage ComposeImageWithURLArray:_urlArray1 ContextSize:_image1.bounds.size Succeed:^(UIImage *image) {
        weakSelf.image1.image = image;
    }];
    
    [UIImage ComposeImageWithURLArray:_urlArray2 ContextSize:_image1.bounds.size Succeed:^(UIImage *image) {
        weakSelf.image2.image = image;
    }];

    [UIImage ComposeImageWithURLArray:_urlArray3 ContextSize:_image1.bounds.size Succeed:^(UIImage *image) {
        weakSelf.image3.image = image;
    }];

    [UIImage ComposeImageWithURLArray:_urlArray4 ContextSize:_image1.bounds.size Succeed:^(UIImage *image) {
        weakSelf.image4.image = image;
    }];

    [UIImage ComposeImageWithURLArray:_urlArray5 ContextSize:_image1.bounds.size Succeed:^(UIImage *image) {
        weakSelf.image5.image = image;
    }];

    [UIImage ComposeImageWithURLArray:_urlArray6 ContextSize:_image1.bounds.size Succeed:^(UIImage *image) {
        weakSelf.image6.image = image;
    }];

    [UIImage ComposeImageWithURLArray:_urlArray7 ContextSize:_image1.bounds.size Succeed:^(UIImage *image) {
        weakSelf.image7.image = image;
    }];

    [UIImage ComposeImageWithURLArray:_urlArray8 ContextSize:_image1.bounds.size Succeed:^(UIImage *image) {
        weakSelf.image8.image = image;
    }];

    [UIImage ComposeImageWithURLArray:_urlArray9 ContextSize:_image1.bounds.size Succeed:^(UIImage *image) {
        weakSelf.image9.image = image;
    }];
}

@end
