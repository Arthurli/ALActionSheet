//
//  ALActionSheetiPhoneController.m
//  ALActionSheetiPhone
//
//  Created by Arthur on 13-12-31.
//  Copyright (c) 2013年 Arthur. All rights reserved.
//

#import "ALActionSheetiPhoneController.h"

@interface ALActionSheetiPhoneController ()

@end

@implementation ALActionSheetiPhoneController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor redColor];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Click Me" forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 100, 40);
    button.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    button.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin |UIViewAutoresizingFlexibleBottomMargin;
    [button addTarget:self action:@selector(clickMe:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)clickMe:(UIButton *)sender
{
//    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"1" message:@"2" delegate:self cancelButtonTitle:@"1" otherButtonTitles:@"2",@"3",nil];
//    alert.alertViewStyle =UIAlertViewStyleLoginAndPasswordInput;
//    [alert show];
    
    UIActionSheet * action = [[UIActionSheet alloc] initWithTitle:@"1" delegate:self cancelButtonTitle:@"2" destructiveButtonTitle:@"3" otherButtonTitles:@"1",@"3", nil];
    action.actionSheetStyle =UIActionSheetStyleBlackOpaque;
    [action showInView:self.view];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
