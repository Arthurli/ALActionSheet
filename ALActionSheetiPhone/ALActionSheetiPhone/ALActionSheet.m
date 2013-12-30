//
//  ALActionSheet.m
//  ALActionSheetiPhone
//
//  Created by Arthur on 13-12-30.
//  Copyright (c) 2013年 Arthur. All rights reserved.
//

#import "ALActionSheet.h"

@implementation ALActionSheet

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+ (ALActionSheet *)createActionSheetView
{
    return Nil;
}

+ (ALActionSheet *)createPopView
{
    return Nil;

}

+ (ALActionSheet *)createAlertView
{
    return Nil;

}

- (void)addButtonWithTitle:(NSString *)title andType:(ALActionSheetButtonStyle)buttonStyle andCallbackBlock:(CallbackBlock)callback
{
    
}

- (void)addButtonWithImage:(UIImage *)image andType:(ALActionSheetButtonStyle)buttonStyle andCallbackBlock:(CallbackBlock)callback
{
    
}

- (void)addButtonWithTitle:(NSString *)title andImage:(UIImage *)image andType:(ALActionSheetButtonStyle)buttonStyle andCallbackBlock:(CallbackBlock)callback
{
    
}

- (void)insertInterval
{
    
}


- (void)showInView:(UIView *)view
{
    
}


- (void)dismiss
{
    
}

- (void)setTitle:(NSString *)title
{
    
}

- (void)setMessage:(NSString *)message
{
    
}

- (void)setActionSheetBackgroundView:(UIView *)backgroundView
{
    
}

- (void)setMaskButtonSwitch:(BOOL)isOpen
{
    
}

- (void)setDismissBlock:(CallbackBlock)block
{
    
}

- (void)setShowBlock:(CallbackBlock)block
{
    
}


- (void)setShowAnimationStyle:(ALActionSheetAnimationStyle)animationStyle
{
    
}

- (void)setDissmissAnimationStyle:(ALActionSheetAnimationStyle)animationStyle
{
    
}


@end
