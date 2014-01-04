ALActionSheet
=============

一个简单实用的actionSheet. 

其中包括两种style ,通过以下两种方法创建
>  \+ (ALActionSheet *)createActionSheetView;
> 
>  \+ (ALActionSheet *)createAlertView;

通过以下方法添加button和间隔：
> \- (void)addButtonWithTitle:(NSString *)title andType:(ALActionSheetButtonStyle)buttonStyle
> andCallbackBlock:(CallbackBlock)callback;
>
> \- (void)insertInterval;

其中有四种button和三种简单的动画选择

> typedef enum{
>     ALActionSheetButtonStyleDefault,
>     ALActionSheetButtonStyleBlue,
>     ALActionSheetButtonStyleRed,
>     ALActionSheetButtonStyleGary,
> }ALActionSheetButtonStyle;

> typedef enum{
>     ALActionSheetAnimationStyleBottom,
>     ALActionSheetAnimationStyleTop,
>     ALActionSheetAnimationStyleFade
> }ALActionSheetAnimationStyle;

最后呈现一个小Demo:

>     ALActionSheet * actionsheet = [ALActionSheet createActionSheetView];
>     [actionsheet addButtonWithTitle:@"ActionSheet" andType:ALActionSheetButtonStyleDefault andCallbackBlock:^{
>         NSLog(@"1");
>      }];
>     [actionsheet addButtonWithTitle:@"Hello" andType:ALActionSheetButtonStyleBlue andCallbackBlock:^{
>         NSLog(@"2");
>     }];
>     [actionsheet addButtonWithTitle:@"It is easily!" andType:ALActionSheetButtonStyleGary andCallbackBlock:^{
>         NSLog(@"3");
>     }];
>     [actionsheet insertInterval];
>     [actionsheet addButtonWithTitle:@"Cancel" andType:ALActionSheetButtonStyleRed andCallbackBlock:^{
>         NSLog(@"1");
>     }];
>     [actionsheet setTitle:@"ActionSheet"];
>     [actionsheet setMessage:@"Animation style 1"];
>     [actionsheet showInView:self.view];
