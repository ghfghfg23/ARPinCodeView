//
//  SPPinCodeView.h
//  PinCode
//
//  Created by Andrey Ryabov on 31.01.14.
//  Copyright (c) 2014 Andrey Ryabov. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ARPinCodeView;
//@protocol SPPinCodeViewDelegate <NSObject>
//- (void)enteredPinCode:(NSString *)pinCode;
//@end
typedef void(^CompletionBlock)(NSString *);
@interface ARPinCodeView : UIView <UIKeyInput> {
    NSMutableArray *_symbolViews;
    NSMutableString *_pinCode;
    CGFloat _contentWidth;
    CompletionBlock _completionBlock;
}
@property (nonatomic) NSUInteger lenght;
@property (nonatomic, strong) NSString *emptyImageName;
@property (nonatomic, strong) NSString *symbolImageName;
@property (nonatomic) CGSize symbolSize;
@property (nonatomic) CGFloat spaceBetweenSymbols;
//@property (nonatomic, copy) CompletionBlock completion;
- (void)beginWithCompletionBlock:(CompletionBlock)completionBlock;
@end
