//
//  CommunityViewController.m
//  Market
//
//  Created by Daniel O'Rorke on 7/14/14.
//  Copyright (c) 2014 Phurbu Dolma. All rights reserved.
//

#import "CommunityViewController.h"
#import "DrawerMenuViewController.h"

@interface CommunityViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *CommunityScrollView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *ActivityIndicator;

@end

@implementation CommunityViewController

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
    
    //set the size of the community scroll content
     self.CommunityScrollView.contentSize = CGSizeMake(320, 760);
    
    
    //set the scroll view images off screen
    self.image1.frame = CGRectMake(0, 568, 320, 499);
    self.image2.frame = CGRectMake(0, 568+363, 320, 333);
    [self performSelector:@selector(loadComm) withObject:(nil) afterDelay:(1)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) loadComm {
    [self.ActivityIndicator stopAnimating];
    self.CommunityScrollView.hidden = NO;
    [UIView animateWithDuration:0.7 delay:0 options:0 animations:^{
        //this part moves content up
        self.image1.frame = CGRectMake(0, 0, 320, 499);
        self.image2.frame = CGRectMake(0, 363, 320, 333);
    } completion: nil];
    
}

- (IBAction)onMenueButton:(id)sender {
    DrawerMenuViewController *drawervc = [[DrawerMenuViewController alloc] init];
    drawervc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:drawervc animated:YES completion: nil];
    
    
}
@end
