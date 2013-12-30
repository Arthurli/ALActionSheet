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
    ALActionSheetAnimationStyleDefault,
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

- (void)addButtonWithImage:(UIImage *)image andType:(ALActionSheetButtonStyle)buttonStyle andCallbackBlock:(CallbackBlock)callback;

- (void)addButtonWithTitle:(NSString *)title andImage:(UIImage *)image andType:(ALActionSheetButtonStyle)buttonStyle andCallbackBlock:(CallbackBlock)callback;

- (void)insertInterval;

- (void)showInView:(UIView *)view;

- (void)dismiss;

- (void)setActionSheetBackgroundView:(UIView *)backgroundView;

- (void)setMaskButtonSwitch:(BOOL)isOpen;

- (void)setDismissBlock:(CallbackBlock)block;

- (void)setShowBlock:(CallbackBlock)block;

- (void)setShowAnimationStyle:(ALActionSheetAnimationStyle)animationStyle;

- (void)setDissmissAnimationStyle:(ALActionSheetAnimationStyle)animationStyle;


@end
