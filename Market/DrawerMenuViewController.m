//
//  DrawerMenuViewController.m
//  Market
//
//  Created by Phurbu Dolma on 7/7/14.
//  Copyright (c) 2014 Phurbu Dolma. All rights reserved.
//

#import "DrawerMenuViewController.h"
#import "ProfileViewController.h"

@interface DrawerMenuViewController ()
- (IBAction)onMainButton:(id)sender;
- (IBAction)onProfileButton:(id)sender;
@property (strong, nonatomic) ProfileViewController * profileViewController;

@end

@implementation DrawerMenuViewController

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

- (IBAction)onMainButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)onProfileButton:(id)sender {
    ProfileViewController *profilevc = [[ProfileViewController alloc] init];
    [self presentViewController:profilevc animated:YES completion: nil];
    
}
@end
