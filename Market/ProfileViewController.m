//
//  ProfileViewController.m
//  Market
//
//  Created by Kaili An on 7/14/14.
//  Copyright (c) 2014 Phurbu Dolma. All rights reserved.
//

#import "ProfileViewController.h"
#import "ProductViewCell.h"
#import "HomeViewController.h"

@interface ProfileViewController ()


@property (weak, nonatomic) HomeViewController *homeView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *products;
@property (nonatomic, strong) UIImageView *myImageView;
- (IBAction)onBackButton:(id)sender;


@end

@implementation ProfileViewController

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
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UINib *nib = [UINib nibWithNibName:@"ProductViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"ProductViewCell"];
    
    self.tableView.rowHeight = 320;
    
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth| UIViewAutoresizingFlexibleHeight;
    
    self.tableView.tableHeaderView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"profile_header"]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSMutableArray *sectionArray = self.arrayOfSections[section];
    return sectionArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ProductViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductViewCell"];
    cell.textLabel.text = [[NSString alloc] initWithFormat:@"Cell %ld", (long)indexPath.row] ;
    
    
    NSMutableArray *sectionArray = self.arrayOfSections[indexPath.section];
    
    cell.textLabel.text = sectionArray[indexPath.row];
    
    return cell;
    
}


//UItable view header
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *header = nil;
    
    //UIView* headerView = [[UIView alloc] initWithFrame: CGRectMake(0.0, 0.0, 320.0, 69.0)];
    
    if (section == 0){
        return [self newLabelWithTitle:@""];
        
        UIImage *profile = [UIImage imageNamed:@"card"];
        self.myImageView = [[UIImageView alloc] initWithImage:profile];
        self.myImageView.center = self.view.center;
        //UILabel *label = [self newLabelWithTitle:@""];
        
        /* Move the label 10 points to the right */
        //label.frame = CGRectMake(0 + 10.0f,5.0f,160,69);
        
        CGRect resultFrame = CGRectMake(0.0f,0.0f,160.0,69.0);
        header = [[UIView alloc] initWithFrame:resultFrame];
        [header addSubview:self.myImageView];
    }
    
    return header;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0){
        return 30.0f;
    }
    
    return 0.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UILabel *) newLabelWithTitle :(NSString *)paramTitle{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.text = paramTitle;
    label.backgroundColor = [UIColor clearColor];
    [label sizeToFit];
    return label;
}

- (NSMutableArray *) newSectionWithIndex:(NSUInteger)paramIndex
                               cellCount:(NSUInteger)paramCellCount{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    NSUInteger counter = 0;
    for (counter = 0;
         counter < paramCellCount;
         counter++){
        
        [result addObject:[[NSString alloc] initWithFormat:@"",
                           (unsigned long)paramIndex,
                           (unsigned long)counter+1]];
    }
    
    return result;
    
}

- (NSMutableArray *) arrayOfSections{
    
    if(_arrayOfSections == nil){
        NSMutableArray *s1 = [self newSectionWithIndex:1 cellCount:3];
        NSMutableArray *s2 = [self newSectionWithIndex:2 cellCount:3];
        NSMutableArray *s3 = [self newSectionWithIndex:3 cellCount:3];
        _arrayOfSections = [[NSMutableArray alloc] initWithArray:@[s1,s2,s3]];
        
    }
    return _arrayOfSections;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.arrayOfSections.count;
    
}


- (IBAction)onBackButton:(id)sender {
    HomeViewController *homevc = [[HomeViewController alloc] init];
    [self presentViewController:homevc animated:YES completion: nil];

}
@end
