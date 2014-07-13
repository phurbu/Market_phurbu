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

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *HomeFeedScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *YahooScrollView;
- (IBAction)onProfileBtn:(id)sender;
- (IBAction)onYahooFilterButton:(id)sender;
- (IBAction)onCameraBtn:(id)sender;
- (IBAction)onAllFilterBtn:(id)sender;

- (IBAction)onTapProduct1:(UITapGestureRecognizer *)sender;

@property (weak, nonatomic) IBOutlet UIView *filterSelected;
@property (weak, nonatomic) IBOutlet UIButton *CameraBtn;
@property (weak, nonatomic) IBOutlet UIView *AllCard1;
@property (weak, nonatomic) IBOutlet UIView *AllCard2;
@property (weak, nonatomic) IBOutlet UIView *YahooCard1;
@property (weak, nonatomic) IBOutlet UIView *YahooCard2;

@end

@implementation HomeViewController
@synthesize menuDrawerWidth, menuDrawerX,recognizer_closed,recognizer_open;

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
    int statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    menuDrawerWidth = self.view.frame.size.width * 0.75;
    menuDrawerX = self.view.frame.origin.x - menuDrawerWidth;
    menuDrawer = [[UIView alloc]initWithFrame:CGRectMake(menuDrawerX, self.view.frame.origin.y+statusBarHeight, menuDrawerWidth, self.view.frame.size.height-statusBarHeight)];
    menuDrawer.backgroundColor = [UIColor redColor];
    recognizer_closed = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipes:)];
    recognizer_closed.direction = UISwipeGestureRecognizerDirectionLeft;
    recognizer_open.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.view addGestureRecognizer:recognizer_open];
    [self.view addGestureRecognizer:recognizer_closed];
    
    [self.view addSubview:menuDrawer];
    
    
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
        
 //   if (self.HomeFeedScrollView.alpha == 0)
//    {
//        [UIView animateWithDuration:1 animations:^{
//            self.HomeFeedScrollView.alpha = 1;
//        }];
        

        
//    } else {
//        [UIView animateWithDuration:1 animations:^{
 //           self.HomeFeedScrollView.alpha = 0;
 //       }];
    
//}
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
    
    //[UIView animateWithDuration:.3 animations:
    // ^{
    //  self.CameraBtn.transform = CGAffineTransformScale(self.CameraBtn.transform, 1.2, 1.2);
    // }];}
    
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

//- (IBAction)onMenu:(id)sender {
 //   UIViewController *vc = [[DrawerMenuViewController alloc] init];
  //  vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
  //  [self presentViewController:vc animated:YES completion:nil];

//}
- (IBAction)menuButton:(id)sender {
    [self drawerAnimation];
}
-(void)handleSwipes:(UISwipeGestureRecognizer *) sender{
    [self drawerAnimation];
    
}
-(void)drawerAnimation{
    [UIView beginAnimations:Nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:-5];
    
    CGFloat new_x = 0;
    if (menuDrawer.frame.origin.x < self.view.frame.origin.x) {
        new_x = menuDrawer.frame.origin.x + menuDrawerWidth;
    
    }else{
        new_x = menuDrawer.frame.origin.x - menuDrawerWidth;
    }
    menuDrawer.frame = CGRectMake(new_x, menuDrawer.frame.origin.y, menuDrawer.frame.size.width, menuDrawer.frame.size.height);
    [UIView commitAnimations];
}
@end
