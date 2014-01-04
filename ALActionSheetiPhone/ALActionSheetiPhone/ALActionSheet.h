//
//  ALActionSheet.h
//  ALActionSheetiPhone
//
//  Created by Arthur on 13-12-30.
//  Copyright (c) 2013年 Arthur. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^CallbackBlock)(void);

typedef enum{
    ALActionSheetButtonStyleDefault,
    ALActionSheetButtonStyleBlue,
    ALActionSheetButtonStyleRed,
    ALActionSheetButtonStyleGary,
}ALActionSheetButtonStyle;

typedef enum{
    ALActionSheetAnimationStyleBottom,
    ALActionSheetAnimationStyleTop,
    ALActionSheetAnimationStyleFade
}ALActionSheetAnimationStyle;


@interface ALActionSheet : UIView


+ (ALActionSheet *)createActionSheetView;

+ (ALActionSheet *)createAlertView;

- (void)setTitle:(NSString *)title;

- (void)setMessage:(NSString *)message;

- (void)addButtonWithTitle:(NSString *)title andType:(ALActionSheetButtonStyle)buttonStyle andCallbackBlock:(CallbackBlock)callback;

- (void)insertInterval;

- (void)showInView:(UIView *)view;

- (void)dismiss;



/**
 之后都是一些设置
 */
- (void)setActionSheetTitleColor:(UIColor *)color;

- (void)setActionSheetMessageColor:(UIColor *)color;

- (void)setActionSheetBackgroundColor:(UIColor *)backgroundColor;

- (void)setMaskButtonSwitch:(BOOL)isOpen;

- (void)setDismissBlock:(CallbackBlock)block;

- (void)setShowBlock:(CallbackBlock)block;

- (void)setShowAnimationStyle:(ALActionSheetAnimationStyle)animationStyle;

- (void)setDissmissAnimationStyle:(ALActionSheetAnimationStyle)animationStyle;

- (void)setMaskColor:(UIColor *)maskColor;
@end
