//
//  SPPinCodeView.h
//  PinCode
//
//  Created by Andrey Ryabov on 31.01.14.
//  Copyright (c) 2014 Andrey Ryabov. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ARPinCodeView;
typedef void(^ARPinCodeCompletionBlock)(NSString *);
@interface ARPinCodeView : UIView <UIKeyInput> {
    NSMutableArray *_symbolViews;
    NSMutableString *_pinCode;
    CGFloat _contentWidth;
    ARPinCodeCompletionBlock _completionBlock;
}
@property (nonatomic) NSUInteger lenght;
@property (nonatomic, strong) NSString *emptyImageName;
@property (nonatomic, strong) NSString *symbolImageName;
@property (nonatomic) CGSize symbolSize;
@property (nonatomic) CGFloat spaceBetweenSymbols;
- (void)beginWithCompletionBlock:(ARPinCodeCompletionBlock)completionBlock;
@end
