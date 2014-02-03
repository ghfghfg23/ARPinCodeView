//
//  SPPinCodeView.m
//  PinCode
//
//  Created by Andrey Ryabov on 31.01.14.
//  Copyright (c) 2014 Andrey Ryabov. All rights reserved.
//

#import "ARPinCodeView.h"

@implementation ARPinCodeView
@synthesize emptyImageName, symbolImageName;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        [self initialization];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
//        [self initialization];
    }
    return self;
}

- (void)initialization {
    _symbolViews = NSMutableArray.new;
    _pinCode = NSMutableString.new;
    for (UIView *v in self.subviews) {
        [v removeFromSuperview];
    }
    for (int i = 0; i < self.lenght; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.symbolSize.width, self.symbolSize.height)];
        imageView.contentMode = UIViewContentModeCenter;
        [_symbolViews addObject:imageView];
        [self addSubview:imageView];
    }
    [self layoutSubviews];
}

- (void)layoutSubviews {

    CGFloat contentWidth = self.lenght * self.symbolSize.width + (self.lenght - 1) * self.spaceBetweenSymbols;
    CGFloat centerY = self.frame.size.height / 2;
    CGFloat deltaX = self.symbolSize.width + self.spaceBetweenSymbols;
    CGFloat centerX = (self.frame.size.width - contentWidth + self.symbolSize.width) / 2;
    for (UIImageView *iv in _symbolViews) {
        iv.center = CGPointMake(centerX, centerY);
        centerX += deltaX;
//        NSLog(@"%@", iv);
    }
    for (int i = 0; i < self.lenght; i++) {
        if (i >= _pinCode.length)
            [_symbolViews[i] setImage:[UIImage imageNamed:self.emptyImageName]];
        else
            [_symbolViews[i] setImage:[UIImage imageNamed:self.symbolImageName]];
    }
}

- (void)setLenght:(NSUInteger)lenght {
    _lenght = lenght;
    [self setNeedsLayout];
}

- (void)beginWithCompletionBlock:(CompletionBlock)completionBlock {
    [self initialization];
    _completionBlock = [completionBlock copy];
    [self becomeFirstResponder];
}

- (void)end {
    _completionBlock(_pinCode);
//    [self resignFirstResponder];
}


- (BOOL)canBecomeFirstResponder {
    return YES;
}

#pragma mark UIKeyInput Protocol Methods

- (BOOL)hasText {
	if (_pinCode > 0) {
		return YES;
	}
	return NO;
}

- (void)insertText:(NSString *)theText {
	[_pinCode appendString:theText];
    if (_pinCode.length >= self.lenght)
        [self end];
	[self setNeedsLayout];
}

- (void)deleteBackward {
    if (_pinCode.length < 1)
        return;
	NSRange theRange = NSMakeRange(_pinCode.length-1, 1);
	[_pinCode deleteCharactersInRange:theRange];
	[self setNeedsLayout];
}

- (UIKeyboardType)keyboardType {
    return UIKeyboardTypeNumberPad;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
