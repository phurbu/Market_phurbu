//
//  HomeViewController.m
//  Market
//
//  Created by Phurbu Dolma on 6/29/14.
//  Copyright (c) 2014 Phurbu Dolma. All rights reserved.
//

#import "HomeViewController.h"
#import "ProductViewController.h"
#import "DrawerMenuViewController.h"
#import "ProfileViewController.h"

@interface HomeViewController ()

@property (strong, nonatomic) DrawerMenuViewController * drawerMenuViewController;
@property (weak, nonatomic) IBOutlet UIScrollView *HomeFeedScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *YahooScrollView;
@property (weak, nonatomic) IBOutlet UIView *filterSelected;
@property (weak, nonatomic) IBOutlet UIButton *CameraBtn;
@property (weak, nonatomic) IBOutlet UIView *AllCard1;
@property (weak, nonatomic) IBOutlet UIView *AllCard2;
@property (weak, nonatomic) IBOutlet UIView *YahooCard1;
@property (weak, nonatomic) IBOutlet UIView *YahooCard2;
@property (weak, nonatomic) IBOutlet UIButton *drawerButton;
- (IBAction)onProfileBtn:(id)sender;
- (IBAction)onYahooFilterButton:(id)sender;
- (IBAction)onCameraBtn:(id)sender;
- (IBAction)onAllFilterBtn:(id)sender;

- (IBAction)onTapProduct1:(UITapGestureRecognizer *)sender;
- (IBAction)onDrawerView:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation HomeViewController
//@synthesize menuDrawerWidth, menuDrawerX,recognizer_closed,recognizer_open;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.drawerMenuViewController = [[DrawerMenuViewController alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    int statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
//    menuDrawerWidth = self.view.frame.size.width * 0.75;
//    menuDrawerX = self.view.frame.origin.x - menuDrawerWidth;
//    menuDrawer = [[UIView alloc]initWithFrame:CGRectMake(menuDrawerX, self.view.frame.origin.y+statusBarHeight, menuDrawerWidth, self.view.frame.size.height-statusBarHeight)];
//    menuDrawer.backgroundColor = [UIColor redColor];
//    recognizer_closed = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipes:)];
//    recognizer_closed.direction = UISwipeGestureRecognizerDirectionLeft;
//    recognizer_open.direction = UISwipeGestureRecognizerDirectionRight;
//
//    [self.view addGestureRecognizer:recognizer_open];
//    [self.view addGestureRecognizer:recognizer_closed];
//    
//    [self.view addSubview:menuDrawer];
    
    
    self.HomeFeedScrollView.
    contentSize =
    CGSizeMake(320,1105);
    
    self.YahooScrollView.
    contentSize =
    CGSizeMake(320,800);
    

    
    [UIView animateWithDuration:.4f delay:0 options:0 animations:^{
     self.AllCard1.center = CGPointMake(160, 287);
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:.2f delay:.1f options:0 animations:^{
            
            self.AllCard2.center = CGPointMake(160, 600);
            
        } completion:nil];
        
    }];
    
//    self.drawerMenuViewController.view.frame = self.contentView.frame;
//    [self.contentView addSubview:self.drawerMenuViewController.view];
//    
//    self.drawerButton.selected = YES;
    
    
   

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onProfileBtn:(id)sender {
    UIViewController *vc = [[ProductViewController alloc] init];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)onYahooFilterButton:(id)sender {
    [UIView animateWithDuration:1 animations:^{
                  self.HomeFeedScrollView.alpha = 0;
                    self.filterSelected.alpha = 1;
        CGRect frame = self.filterSelected.frame;
        frame.origin.x = 60;
        self.filterSelected.frame = frame;
    }];
    
    self.YahooCard1.center = CGPointMake(160, 900);
    self.YahooCard2.center = CGPointMake(160, 900);
    
    [UIView animateWithDuration:.4f delay:0 options:0 animations:^{
        self.YahooCard1.center = CGPointMake(160, 283);
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:.2f delay:.1f options:0 animations:^{
            
            self.YahooCard2.center = CGPointMake(160, 610);
            
        } completion:nil];
        
    }];

}

- (IBAction)onAllFilterBtn:(id)sender {
    [UIView animateWithDuration:1 animations:^{
        CGRect frame = self.filterSelected.frame;
        frame.origin.x = -9;
        self.filterSelected.frame = frame;
        self.HomeFeedScrollView.alpha = 1;
    }];
    
    self.AllCard1.center = CGPointMake(160, 900);
    self.AllCard2.center = CGPointMake(160, 900);
    
    [UIView animateWithDuration:.4f delay:0 options:0 animations:^{
        self.AllCard1.center = CGPointMake(160, 287);
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:.2f delay:.1f options:0 animations:^{
            
            self.AllCard2.center = CGPointMake(160, 610);
            
        } completion:nil];
        
    }];
    
}

- (IBAction)onCameraBtn:(id)sender {

    [UIView animateWithDuration:.1 animations:^{
        CGRect frame = self.CameraBtn.frame;
        frame.origin.y = 447;
        self.CameraBtn.frame = frame;
    }];
    
    CGFloat offset = .3*(447 - 505);
    [UIView animateWithDuration:.1 animations:^{
        CGRect frame = self.CameraBtn.frame;
        frame.origin.y = 447 + offset;
        self.CameraBtn.frame = frame;
    } completion:^(BOOL finished){
        [UIView animateWithDuration:.1 animations:^{
            CGRect frame = self.CameraBtn.frame;
            frame.origin.y = 447;
            self.CameraBtn.frame = frame;
        }];
    }];
    
    

}


- (IBAction)onTapProduct1:(UITapGestureRecognizer *)sender {
    NSLog(@"TAPPED 1");
    UIViewController *vc = [[ProductViewController alloc] init];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:vc animated:YES completion:nil];

    
}

- (IBAction)onDrawerView:(id)sender {
    //load the home vc
//    self.drawerMenuViewController.view.frame = self.contentView.frame;
//    [self.contentView addSubview:self.drawerMenuViewController.view];
//    //unselect all the others the home button
//    self.drawerButton.selected = YES;
    
    DrawerMenuViewController *drawervc = [[DrawerMenuViewController alloc] init];
    [self presentViewController:drawervc animated:YES completion: nil];
    
    
}

//- (IBAction)onMenu:(id)sender {
 //   UIViewController *vc = [[DrawerMenuViewController alloc] init];
  //  vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
  //  [self presentViewController:vc animated:YES completion:nil];

//}

//-(void)handleSwipes:(UISwipeGestureRecognizer *) sender{
//    [self drawerAnimation];
//    
//}
//-(void)drawerAnimation{
//    [UIView beginAnimations:Nil context:nil];
//    [UIView setAnimationDelegate:self];
//    [UIView setAnimationDuration:-5];
//    
//    CGFloat new_x = 0;
//    if (menuDrawer.frame.origin.x < self.view.frame.origin.x) {
//        new_x = menuDrawer.frame.origin.x + menuDrawerWidth;
//    
//    }else{
//        new_x = menuDrawer.frame.origin.x - menuDrawerWidth;
//    }
//    menuDrawer.frame = CGRectMake(new_x, menuDrawer.frame.origin.y, menuDrawer.frame.size.width, menuDrawer.frame.size.height);
//    [UIView commitAnimations];
//}
//
//- (IBAction)menuButton:(id)sender {
//     [self drawerAnimation];
//}
//
@end
