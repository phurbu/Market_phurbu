//
//  NavViewController.m
//  Market
//
//  Created by Phurbu Dolma on 6/29/14.
//  Copyright (c) 2014 Phurbu Dolma. All rights reserved.
//

#import "NavViewController.h"
#import "HomeViewController.h"
#import "WishlistViewController.h"



@interface NavViewController ()
@property (weak, nonatomic) IBOutlet UIView *ContentView;
@property (nonatomic, strong) HomeViewController* homeViewController;
@property (nonatomic, strong) WishlistViewController* wishlistViewController;
@end

@implementation NavViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.homeViewController = [[HomeViewController alloc] init];

        self.wishlistViewController = [[WishlistViewController alloc] init];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.homeViewController.view.frame = self.ContentView.frame;
    [self.ContentView addSubview:self.homeViewController.view];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
