//
//  RXQRCode.m
//  RXQRCodeExample
//
//  Created by Rush.D.Xzj on 16/3/1.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RXQRCode.h"
#import "qrencode.h"

enum {
    qr_margin = 3
};
@implementation RXQRCode


+ (void)drawQRCode:(QRcode *)code context:(CGContextRef)ctx size:(CGFloat)size
{
    unsigned char *data = 0;
    int width;
    data = code->data;
    width = code->width;
    float zoom = (double)size / (code->width + 2.0 * qr_margin);
    CGRect rectDraw = CGRectMake(0, 0, zoom, zoom);
    // draw
    CGContextSetFillColor(ctx, CGColorGetComponents([UIColor blackColor].CGColor));
    for (NSInteger i = 0; i < width; ++i) {
        for (NSInteger j = 0; j < width; ++j) {
            if(*data & 1) {
                rectDraw.origin = CGPointMake((j + qr_margin) * zoom,(i + qr_margin) * zoom);
                CGContextAddRect(ctx, rectDraw);
            }
            ++data;
        }
    }
    CGContextFillPath(ctx);
}

+ (UIImage *)qrImageForString:(NSString *)string imageWidth:(CGFloat)width
{
    if (![string length]) {
        return nil;
    }
    
    QRcode *code = QRcode_encodeString([string UTF8String], 0, QR_ECLEVEL_L, QR_MODE_8, 1);
    if (!code) {
        return nil;
    }
    
    // create context
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(0, width, width, 8, width * 4, colorSpace, kCGImageAlphaPremultipliedLast);
    CGAffineTransform translateTransform = CGAffineTransformMakeTranslation(0, -width);
    CGAffineTransform scaleTransform = CGAffineTransformMakeScale(1, -1);
    CGContextConcatCTM(ctx, CGAffineTransformConcat(translateTransform, scaleTransform));
    // draw QR on this context
    [self drawQRCode:code context:ctx size:width];
    // get image
    CGImageRef qrCGImage = CGBitmapContextCreateImage(ctx);
    UIImage * qrImage = [UIImage imageWithCGImage:qrCGImage];
    // some releases
    CGContextRelease(ctx);
    CGImageRelease(qrCGImage);
    CGColorSpaceRelease(colorSpace);
    QRcode_free(code);
    return qrImage;
}
@end
