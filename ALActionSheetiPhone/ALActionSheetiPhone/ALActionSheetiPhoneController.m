//
//  ALActionSheetiPhoneController.m
//  ALActionSheetiPhone
//
//  Created by Arthur on 13-12-31.
//  Copyright (c) 2013年 Arthur. All rights reserved.
//

#import "ALActionSheetiPhoneController.h"
#import "ALActionSheet.h"
@interface ALActionSheetiPhoneController ()

@end

@implementation ALActionSheetiPhoneController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"ActionSheet1" forState:UIControlStateNormal];
    button.tag = 1;
    button.frame = CGRectMake(0, 0, 100, 40);
    button.center = CGPointMake(self.view.frame.size.width/2, 40);
    button.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin |UIViewAutoresizingFlexibleBottomMargin;
    [button addTarget:self action:@selector(clickMe:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button1 setTitle:@"ActionSheet2" forState:UIControlStateNormal];
    button1.tag = 2;
    button1.frame = CGRectMake(0, 0, 100, 40);
    button1.center = CGPointMake(self.view.frame.size.width/2, 100);
    button1.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin |UIViewAutoresizingFlexibleBottomMargin;
    [button1 addTarget:self action:@selector(clickMe:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton * button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button2 setTitle:@"ActionSheet3" forState:UIControlStateNormal];
    button2.tag = 3;
    button2.frame = CGRectMake(0, 0, 100, 40);
    button2.center = CGPointMake(self.view.frame.size.width/2, 160);
    button2.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin |UIViewAutoresizingFlexibleBottomMargin;
    [button2 addTarget:self action:@selector(clickMe:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UIButton * button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button3 setTitle:@"AlertView1" forState:UIControlStateNormal];
    button3.tag = 4;
    button3.frame = CGRectMake(0, 0, 100, 40);
    button3.center = CGPointMake(self.view.frame.size.width/2, 220);
    button3.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin |UIViewAutoresizingFlexibleBottomMargin;
    [button3 addTarget:self action:@selector(clickMe:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    UIButton * button4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button4 setTitle:@"AlertView2" forState:UIControlStateNormal];
    button4.tag = 5;
    button4.frame = CGRectMake(0, 0, 100, 40);
    button4.center = CGPointMake(self.view.frame.size.width/2, 280);
    button4.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin |UIViewAutoresizingFlexibleBottomMargin;
    [button4 addTarget:self action:@selector(clickMe:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    
    UIButton * button5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button5 setTitle:@"AlertView3" forState:UIControlStateNormal];
    button5.tag = 6;
    button5.frame = CGRectMake(0, 0, 100, 40);
    button5.center = CGPointMake(self.view.frame.size.width/2, 340);
    button5.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin |UIViewAutoresizingFlexibleBottomMargin;
    [button5 addTarget:self action:@selector(clickMe:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button5];
}

- (void)clickMe:(UIButton *)sender
{
    
    if (sender.tag ==1 ) {
        ALActionSheet * actionsheet = [ALActionSheet createActionSheetView];
        [actionsheet addButtonWithTitle:@"ActionSheet" andType:ALActionSheetButtonStyleDefault andCallbackBlock:^{
            NSLog(@"1");
        }];
        [actionsheet addButtonWithTitle:@"Hello" andType:ALActionSheetButtonStyleBlue andCallbackBlock:^{
            NSLog(@"2");
        }];
        [actionsheet addButtonWithTitle:@"It is easily!" andType:ALActionSheetButtonStyleGary andCallbackBlock:^{
            NSLog(@"3");
        }];
        [actionsheet insertInterval];
        [actionsheet addButtonWithTitle:@"Cancel" andType:ALActionSheetButtonStyleRed andCallbackBlock:^{
            NSLog(@"1");
        }];
        [actionsheet setTitle:@"ActionSheet"];
        [actionsheet setMessage:@"Animation style 1"];
        [actionsheet showInView:self.view];
    }else if (sender.tag == 2){
        ALActionSheet * actionsheet = [ALActionSheet createActionSheetView];
        [actionsheet addButtonWithTitle:@"ActionSheet" andType:ALActionSheetButtonStyleDefault andCallbackBlock:^{
            NSLog(@"1");
        }];
        [actionsheet addButtonWithTitle:@"Hello" andType:ALActionSheetButtonStyleBlue andCallbackBlock:^{
            NSLog(@"2");
        }];
        [actionsheet addButtonWithTitle:@"It is easily!" andType:ALActionSheetButtonStyleGary andCallbackBlock:^{
            NSLog(@"3");
        }];
        [actionsheet insertInterval];
        [actionsheet addButtonWithTitle:@"Cancel" andType:ALActionSheetButtonStyleRed andCallbackBlock:^{
            NSLog(@"1");
        }];
        [actionsheet setTitle:@"ActionSheet"];
        [actionsheet setMessage:@"Animation style 2"];
        [actionsheet setShowAnimationStyle:ALActionSheetAnimationStyleTop];
        [actionsheet setDissmissAnimationStyle:ALActionSheetAnimationStyleTop];
        [actionsheet showInView:self.view];
    }else if (sender.tag == 3){
        ALActionSheet * actionsheet = [ALActionSheet createActionSheetView];
        [actionsheet addButtonWithTitle:@"ActionSheet" andType:ALActionSheetButtonStyleDefault andCallbackBlock:^{
            NSLog(@"1");
        }];
        [actionsheet addButtonWithTitle:@"Hello" andType:ALActionSheetButtonStyleBlue andCallbackBlock:^{
            NSLog(@"2");
        }];
        [actionsheet addButtonWithTitle:@"It is easily!" andType:ALActionSheetButtonStyleGary andCallbackBlock:^{
            NSLog(@"3");
        }];
        [actionsheet insertInterval];
        [actionsheet addButtonWithTitle:@"Cancel" andType:ALActionSheetButtonStyleRed andCallbackBlock:^{
            NSLog(@"1");
        }];
        [actionsheet setTitle:@"ActionSheet"];
        [actionsheet setMessage:@"Animation style 3"];
        [actionsheet setShowAnimationStyle:ALActionSheetAnimationStyleFade];
        [actionsheet setDissmissAnimationStyle:ALActionSheetAnimationStyleFade];
        [actionsheet showInView:self.view];
    }else if (sender.tag == 4){
        ALActionSheet * actionsheet = [ALActionSheet createAlertView];
        [actionsheet addButtonWithTitle:@"AlertView" andType:ALActionSheetButtonStyleDefault andCallbackBlock:^{
            NSLog(@"1");
        }];
        [actionsheet addButtonWithTitle:@"Hello" andType:ALActionSheetButtonStyleBlue andCallbackBlock:^{
            NSLog(@"2");
        }];
        [actionsheet addButtonWithTitle:@"It is easily!" andType:ALActionSheetButtonStyleGary andCallbackBlock:^{
            NSLog(@"3");
        }];
        [actionsheet insertInterval];
        [actionsheet addButtonWithTitle:@"Cancel" andType:ALActionSheetButtonStyleRed andCallbackBlock:^{
            NSLog(@"1");
        }];
        [actionsheet setTitle:@"AlertView"];
        [actionsheet setMessage:@"Animation style 1"];
        [actionsheet showInView:self.view];

    }else if (sender.tag == 5){
        ALActionSheet * actionsheet = [ALActionSheet createAlertView];
        [actionsheet addButtonWithTitle:@"AlertView" andType:ALActionSheetButtonStyleDefault andCallbackBlock:^{
            NSLog(@"1");
        }];
        [actionsheet addButtonWithTitle:@"Hello" andType:ALActionSheetButtonStyleBlue andCallbackBlock:^{
            NSLog(@"2");
        }];
        [actionsheet addButtonWithTitle:@"It is easily!" andType:ALActionSheetButtonStyleGary andCallbackBlock:^{
            NSLog(@"3");
        }];
        [actionsheet insertInterval];
        [actionsheet addButtonWithTitle:@"Cancel" andType:ALActionSheetButtonStyleRed andCallbackBlock:^{
            NSLog(@"1");
        }];
        [actionsheet setTitle:@"AlertView"];
        [actionsheet setMessage:@"Animation style 2"];
        [actionsheet setShowAnimationStyle:ALActionSheetAnimationStyleTop];
        [actionsheet setDissmissAnimationStyle:ALActionSheetAnimationStyleTop];
        [actionsheet showInView:self.view];

    }else if (sender.tag == 6){
        ALActionSheet * actionsheet = [ALActionSheet createAlertView];
        [actionsheet addButtonWithTitle:@"AlertView" andType:ALActionSheetButtonStyleDefault andCallbackBlock:^{
            NSLog(@"1");
        }];
        [actionsheet addButtonWithTitle:@"Hello" andType:ALActionSheetButtonStyleBlue andCallbackBlock:^{
            NSLog(@"2");
        }];
        [actionsheet addButtonWithTitle:@"It is easily!" andType:ALActionSheetButtonStyleGary andCallbackBlock:^{
            NSLog(@"3");
        }];
        [actionsheet insertInterval];
        [actionsheet addButtonWithTitle:@"Cancel" andType:ALActionSheetButtonStyleRed andCallbackBlock:^{
            NSLog(@"1");
        }];
        [actionsheet setTitle:@"AlertView"];
        [actionsheet setMessage:@"Animation style 3"];
        [actionsheet setShowAnimationStyle:ALActionSheetAnimationStyleBottom];
        [actionsheet setDissmissAnimationStyle:ALActionSheetAnimationStyleBottom];
        [actionsheet showInView:self.view];

    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
