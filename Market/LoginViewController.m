//
//  LoginViewController.m
//  Market
//
//  Created by Phurbu Dolma on 6/29/14.
//  Copyright (c) 2014 Phurbu Dolma. All rights reserved.
//

#import "LoginViewController.h"
#import "NavViewController.h"
#import "HomeViewController.h"
#import "ProductViewController.h"


@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *UsernameField;
@property (weak, nonatomic) IBOutlet UITextField *PasswordField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *LoadingIndicator;
@property (weak, nonatomic) IBOutlet UIView *FormView;
- (IBAction)SubmitButton:(id)sender;
- (IBAction)OnMoeveUp:(id)sender;
- (IBAction)OnTap:(UITapGestureRecognizer *)sender;

- (void) checkResponse;
@end

@implementation LoginViewController

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

- (IBAction)SubmitButton:(id)sender {
    [self.LoadingIndicator startAnimating];
    [self performSelector:@selector(checkResponse) withObject:nil afterDelay:1];
}

- (IBAction)OnMoeveUp:(id)sender {
    [UIView animateWithDuration:.8 animations:^{
        CGRect frame = self.FormView.frame;
        frame.origin.y = frame.origin.y - 100;
         self.FormView.frame = frame;
    }];

    
   

}

- (IBAction)OnTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
    [UIView animateWithDuration:.8 animations:^{
        CGRect frame = self.FormView.frame;
        frame.origin.y = frame.origin.y + 100;
        self.FormView.frame = frame;
    }];
}

- (void)checkResponse {
    [self.LoadingIndicator stopAnimating];
    if ([[self.UsernameField.text lowercaseString] isEqualToString:@"1"] && [[self.PasswordField.text lowercaseString] isEqualToString:@"1"]) {
        
        UIViewController *homeviewcontroller = [[HomeViewController alloc] init];
        homeviewcontroller.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        
        [self presentViewController:homeviewcontroller animated:YES completion:nil];
        
        
    } else {
        
        UIAlertView *errorView = [[UIAlertView alloc]initWithTitle:@"Incorrect Password" message:@"The password you entered is incorrect. Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        
        [errorView show];    }
}

@end
