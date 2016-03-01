//
//  RXQRCode.h
//  RXQRCodeExample
//
//  Created by Rush.D.Xzj on 16/3/1.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface RXQRCode : NSObject
+ (UIImage *)qrImageForString:(NSString *)string imageWidth:(CGFloat)width;

@end
