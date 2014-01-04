//
//  ALActionSheet.m
//  ALActionSheetiPhone
//
//  Created by Arthur on 13-12-30.
//  Copyright (c) 2013年 Arthur. All rights reserved.
//

#import "ALActionSheet.h"

@interface ALActionSheet ()

@property (nonatomic, strong) NSMutableArray *buttonArray;
@property (nonatomic, strong) NSMutableArray *blockArray;
@property (nonatomic, strong) UIView *actionSheet;
@property (nonatomic, strong) UIButton *mask;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIColor *messageColor;
@property (nonatomic, strong) CallbackBlock dissmissBlock;
@property (nonatomic, strong) CallbackBlock showBlock;
@property (nonatomic, strong) UIColor *maskColor;
@property (nonatomic) BOOL maskSwith;
@property (nonatomic) BOOL isShow;
@property (nonatomic) NSInteger style;
@property (nonatomic) ALActionSheetAnimationStyle showAnimation;
@property (nonatomic) ALActionSheetAnimationStyle dismissAnimation;

@end

@implementation ALActionSheet

- (id)init
{
    if ([super init]) {
        _buttonArray = [[NSMutableArray alloc] init];
        _blockArray = [[NSMutableArray alloc] init];
        _maskColor = [UIColor colorWithWhite:0 alpha:0.3];
        _maskSwith = YES;
        _isShow = NO;
        _style = 1;
        
    }
    return self;
}

+ (ALActionSheet *)createActionSheetView{
    ALActionSheet * actionsheet = [[ALActionSheet alloc] init];
    actionsheet.style = 1;
    actionsheet.showAnimation = ALActionSheetAnimationStyleBottom;
    actionsheet.dismissAnimation = ALActionSheetAnimationStyleBottom;
    actionsheet.backgroundColor = [UIColor clearColor];
    actionsheet.titleColor = [UIColor whiteColor];
    actionsheet.messageColor = [UIColor whiteColor];
    return actionsheet;
}

+ (ALActionSheet *)createAlertView
{
    ALActionSheet * actionsheet = [[ALActionSheet alloc] init];
    actionsheet.style = 2;
    actionsheet.showAnimation = ALActionSheetAnimationStyleFade;
    actionsheet.dismissAnimation = ALActionSheetAnimationStyleFade;
    actionsheet.backgroundColor = [UIColor colorWithWhite:1 alpha:0.9];
    actionsheet.titleColor = [UIColor blackColor];
    actionsheet.messageColor = [UIColor blackColor];
    return actionsheet;
}

- (void)addButtonWithTitle:(NSString *)title andType:(ALActionSheetButtonStyle)buttonStyle andCallbackBlock:(CallbackBlock)callback{
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    button.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    switch (buttonStyle) {
        case ALActionSheetButtonStyleDefault:
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            break;
        case ALActionSheetButtonStyleBlue:
            [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            break;
        case ALActionSheetButtonStyleGary:
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            break;
        case ALActionSheetButtonStyleRed:
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            break;
        default:
            break;
    }
    
    [_buttonArray addObject:button];
    [_blockArray addObject:callback];
    
}


- (void)insertInterval{
    [_buttonArray addObject:@"Interval"];
    [_blockArray addObject:@"Interval"];
}

- (void)showInView:(UIView *)view{
    
    [self setFrame:view.bounds];
    [view addSubview:self];
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self setupActionSheet];
    if (_showBlock) {
        _showBlock();
    }
    
    if (_style == 1) {
        
        if (_showAnimation == ALActionSheetAnimationStyleBottom) {
            _actionSheet.center = CGPointMake(self.frame.size.width/2, self.frame.size.height+_actionSheet.frame.size.height/2);
        }else if (_showAnimation == ALActionSheetAnimationStyleTop)
        {
            _actionSheet.center = CGPointMake(self.frame.size.width/2, -_actionSheet.frame.size.height/2);
        }else
        {
            _actionSheet.center = CGPointMake(self.frame.size.width/2, self.frame.size.height -_actionSheet.frame.size.height/2);
            _actionSheet.alpha = 0;
            
        }
        
        
        [UIView animateWithDuration:0.25 animations:^{
            _mask.alpha = 1;
            if (_showAnimation == ALActionSheetAnimationStyleBottom) {
                _actionSheet.center = CGPointMake(self.frame.size.width/2, self.frame.size.height -_actionSheet.frame.size.height/2);
            }else if (_showAnimation == ALActionSheetAnimationStyleTop)
            {
                _actionSheet.center = CGPointMake(self.frame.size.width/2, self.frame.size.height -_actionSheet.frame.size.height/2);
            }else
            {
                _actionSheet.alpha = 1;
                
            }
        } completion:^(BOOL finished) {
            _isShow = YES;
        }];
    }
    else
    {
        if (_showAnimation == ALActionSheetAnimationStyleBottom) {
            _actionSheet.center = CGPointMake(self.frame.size.width/2, self.frame.size.height+_actionSheet.frame.size.height/2);
        }else if (_showAnimation == ALActionSheetAnimationStyleTop)
        {
            _actionSheet.center = CGPointMake(self.frame.size.width/2, -_actionSheet.frame.size.height/2);
        }else
        {
            _actionSheet.alpha = 0;
            _actionSheet.center = CGPointMake(self.frame.size.width/2, self.frame.size.height /2);
            
        }

        
        [UIView animateWithDuration:0.25 animations:^{
            _mask.alpha = 1;
            
            if (_showAnimation == ALActionSheetAnimationStyleBottom) {
                _actionSheet.center = CGPointMake(self.frame.size.width/2, self.frame.size.height /2);
            }else if (_showAnimation == ALActionSheetAnimationStyleTop)
            {
                _actionSheet.center = CGPointMake(self.frame.size.width/2, self.frame.size.height /2);
            }else
            {
                _actionSheet.alpha = 1;
                
            }
            
            
        } completion:^(BOOL finished) {
            _isShow = YES;
        }];
        
    }

    
}

- (void)dismiss{
    
    if (_dissmissBlock) {
        _dissmissBlock();
    }
    _isShow = NO;
    if (_style == 1) {
        [UIView animateWithDuration:0.25 animations:^{
            _mask.alpha = 0;
            _maskSwith = NO;
            if (_dismissAnimation == ALActionSheetAnimationStyleBottom) {
                _actionSheet.center = CGPointMake(self.frame.size.width/2, self.frame.size.height +_actionSheet.frame.size.height/2);
            }else if (_dismissAnimation == ALActionSheetAnimationStyleTop)
            {
                _actionSheet.center = CGPointMake(self.frame.size.width/2, -_actionSheet.frame.size.height/2);
            }else
            {
                _actionSheet.alpha = 0;
        
            }
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }
    else
    {
        [UIView animateWithDuration:0.25 animations:^{
            _mask.alpha = 0;
            _maskSwith = NO;

            if (_dismissAnimation == ALActionSheetAnimationStyleBottom) {
                _actionSheet.center = CGPointMake(self.frame.size.width/2, self.frame.size.height +_actionSheet.frame.size.height/2);
            }else if (_dismissAnimation == ALActionSheetAnimationStyleTop)
            {
                _actionSheet.center = CGPointMake(self.frame.size.width/2, -_actionSheet.frame.size.height/2);
            }else
            {
                _actionSheet.alpha = 0;

            }
            
            
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
 
    }
}

- (void)setupActionSheet
{
    _mask = [[UIButton alloc] initWithFrame:self.bounds];
    [_mask addTarget:self action:@selector(clickMask) forControlEvents:UIControlEventTouchUpInside];
    [_mask setBackgroundColor:_maskColor];
    _mask.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _mask.alpha = 0;
    
    float width = self.frame.size.width;
    if (_style == 2) {
        width = 250;
    }
    
    UIView* actionSheet = [[UIView alloc] initWithFrame:CGRectMake((self.frame.size.width-width)/2, self.frame.size.height, width, 0)];
    if (_style == 1) {
        actionSheet.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    }
    
    
    
    CGFloat offset = 15;
    
    if (self.title) {
        CGSize size = [_title sizeWithFont:[UIFont fontWithName:@"Helvetica-Light" size:18]
                        constrainedToSize:CGSizeMake(actionSheet.frame.size.width-10*2, 1000)
                            lineBreakMode:NSLineBreakByCharWrapping];
        
        UILabel *labelView = [[UILabel alloc] initWithFrame:CGRectMake(10, offset, actionSheet.frame.size.width-10*2, size.height)];
        labelView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        labelView.font = [UIFont fontWithName:@"Helvetica-Light" size:18];
        labelView.numberOfLines = 0;
        labelView.lineBreakMode = NSLineBreakByCharWrapping;
        labelView.textColor = _titleColor;
        labelView.backgroundColor = [UIColor clearColor];
        labelView.textAlignment = NSTextAlignmentCenter;
        labelView.text = _title;
        [actionSheet addSubview:labelView];
        
        offset += size.height + 10;
    }
    
    if (self.message) {
        CGSize size = [_message sizeWithFont:[UIFont fontWithName:@"Helvetica-Light" size:18]
                         constrainedToSize:CGSizeMake(actionSheet.frame.size.width-10*2, 1000)
                             lineBreakMode:NSLineBreakByCharWrapping];
        
        UILabel *labelView = [[UILabel alloc] initWithFrame:CGRectMake(10, offset, actionSheet.frame.size.width-10*2, size.height)];
        labelView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        labelView.font = [UIFont fontWithName:@"Helvetica-Light" size:18];
        labelView.numberOfLines = 0;
        labelView.lineBreakMode = NSLineBreakByCharWrapping;
        labelView.textColor = _messageColor;
        labelView.backgroundColor = [UIColor clearColor];
        labelView.textAlignment = NSTextAlignmentCenter;
        labelView.text = _message;
        [actionSheet addSubview:labelView];
        
        offset += size.height + 10;
    }
    
    
    for (int  i = 0; i < [self.buttonArray count] ; i++) {
        id  buttonItem = [self.buttonArray objectAtIndex:i];
        
        if ([buttonItem isKindOfClass:[NSString class]]) {
            offset +=  10;
            continue;
        }
        
        UIImage *image = [[UIImage alloc] init];
        if (i>0 &&
            i<[self.buttonArray count]-1 &&
            [[self.buttonArray objectAtIndex:i-1] isKindOfClass:[UIButton class]] &&
            [[self.buttonArray objectAtIndex:i+1] isKindOfClass:[UIButton class]])
        {
            image = [UIImage imageNamed:@"TableViewCell-mid"];
            
        }else if ((i == 0 && i <[self.buttonArray count]-1 && [[self.buttonArray objectAtIndex:i+1] isKindOfClass:[UIButton class]]) ||
                  (i>0 && i<[self.buttonArray count]-1 && [[self.buttonArray objectAtIndex:i+1] isKindOfClass:[UIButton class]] && [[self.buttonArray objectAtIndex:i-1] isKindOfClass:[NSString class]]))
        {
            image = [UIImage imageNamed:@"TableViewCell-top"];
            
        }else if ((i==([self.buttonArray count]-1) && i>0 && [[self.buttonArray objectAtIndex:i-1] isKindOfClass:[UIButton class]]) || (i<[self.buttonArray count]-1 && i>0 && [[self.buttonArray objectAtIndex:i-1] isKindOfClass:[UIButton class]] && [[self.buttonArray objectAtIndex:i+1] isKindOfClass:[NSString class]]))
        {
           image = [UIImage imageNamed:@"TableViewCell-bottom"];
            
        }else
        {
           image = [UIImage imageNamed:@"TableViewCell-full"];
        }
        
        
        UIButton * item = (UIButton *)buttonItem;
        [item setBackgroundImage:image forState:UIControlStateNormal];
        item.frame = CGRectMake(10, offset, actionSheet.frame.size.width - 10*2, 45);
        [actionSheet addSubview:item];
        
        offset += item.frame.size.height + 1;
        
    }
    
    actionSheet.frame = CGRectMake((self.frame.size.width-width)/2, self.frame.size.height,width, offset + 10);
    _actionSheet = actionSheet;
    
    
    if (_style == 2) {
        _actionSheet.layer.cornerRadius = 15;
        _actionSheet.layer.contentsScale = 0.6;
    }
    [_actionSheet setBackgroundColor:_backgroundColor];
    
    
    [self addSubview:_mask];
    [self addSubview:_actionSheet];
}

- (void)clickButton:(UIButton *)sender
{
    NSUInteger index = [_buttonArray indexOfObject:sender];
    CallbackBlock block = [_blockArray objectAtIndex:index];
    if (block) {
        block();
    }
    [self dismiss];
}

- (void)clickMask
{
    if (_maskSwith) {
        [self dismiss];
    }
}

/**
 之后都是一些设置
 */
- (void)setActionSheetTitleColor:(UIColor *)color
{
    _titleColor = color;
}

- (void)setActionSheetMessageColor:(UIColor *)color
{
    _messageColor = color;
}

- (void)setActionSheetBackgroundColor:(UIColor *)backgroundColor
{
    _backgroundColor = backgroundColor;
}

- (void)setMaskButtonSwitch:(BOOL)isOpen
{
    _maskSwith = isOpen;
}

- (void)setDismissBlock:(CallbackBlock)block
{
    _dissmissBlock = block;
}

- (void)setShowBlock:(CallbackBlock)block;
{
    _showBlock = block;
}

- (void)setShowAnimationStyle:(ALActionSheetAnimationStyle)animationStyle
{
    _showAnimation = animationStyle;
}

- (void)setDissmissAnimationStyle:(ALActionSheetAnimationStyle)animationStyle
{
    _dismissAnimation = animationStyle;
}

- (void)setMaskColor:(UIColor *)maskColor
{
    _maskColor = maskColor;
}

- (void)setTitle:(NSString *)title
{
    _title = title;
}

- (void)setMessage:(NSString *)message
{
    _message = message;
}

- (void)layoutSubviews
{
    if (_isShow) {
        if (_style == 1) {
            _actionSheet.center = CGPointMake(self.frame.size.width/2,self.frame.size.height-_actionSheet.frame.size.height/2);
        }else
        {
           _actionSheet.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        }
        
    }
}
@end
