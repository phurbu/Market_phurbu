//
//  CameraViewController.m
//  Market
//
//  Created by Kaili An on 7/15/14.
//  Copyright (c) 2014 Phurbu Dolma. All rights reserved.
//

#import "CameraViewController.h"
#import "HomeViewController.h"

@interface CameraViewController ()

- (IBAction)onCamera:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *onCameraBtn;

@end

@implementation CameraViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onCamera:(id)sender {
    
    [UIView animateWithDuration:.1 animations:^{
        CGRect frame = self.onCameraBtn.frame;
        frame.origin.y = 447;
        self.onCameraBtn.frame = frame;
    }];
    
    CGFloat offset = .3*(447 - 505);
    [UIView animateWithDuration:.1 animations:^{
        CGRect frame = self.onCameraBtn.frame;
        frame.origin.y = 447 + offset;
        self.onCameraBtn.frame = frame;
    } completion:^(BOOL finished){
        [UIView animateWithDuration:.1 animations:^{
            CGRect frame = self.onCameraBtn.frame;
            frame.origin.y = 447;
            self.onCameraBtn.frame = frame;
        }];
    }];

    
}
@end
