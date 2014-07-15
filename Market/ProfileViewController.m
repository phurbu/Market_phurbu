//
//  ProfileViewController.m
//  Market
//
//  Created by Kaili An on 7/14/14.
//  Copyright (c) 2014 Phurbu Dolma. All rights reserved.
//

#import "ProfileViewController.h"
#import "ProductViewCell.h"

@interface ProfileViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *productImage;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *products;

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
    
    UINib *nib = [UINib nibWithNibName:@"ProductCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"ProductCell"];
    
    self.tableView.rowHeight = 320;
    
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth| UIViewAutoresizingFlexibleHeight;
    
    self.tableView.tableHeaderView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header"]];
    
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
    //    NSDictionary *productInfo = self.products[section];
    //    NSString *username = productInfo[@"user"][@"username"];
    //
    //    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    //    headerView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.6];
    //
    //    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 320, 30)];
    //    label.font = [UIFont boldSystemFontOfSize:16];
    //    label.textColor = [UIColor blueColor];
    //    label.text = username;
    //
    //    [headerView addSubview:label];
    //
    //    return headerView;
    
    UIView *header = nil;
    
    if (section == 0){
        return [self newLabelWithTitle:@"This is a Header"];
        
        //        UIImageView *imgVew = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header"]];
        
        UILabel *label = [self newLabelWithTitle:@"Section 1 Header"];
        
        /* Move the label 10 points to the right */
        label.frame = CGRectMake(label.frame.origin.x + 10.0f,
                                 5.0f, /* Go 5 points down in y axis */
                                 label.frame.size.width,
                                 label.frame.size.height);
        
        /* Give the container view 10 points more in width than our label
         because the label needs a 10 extra points left-margin */
        CGRect resultFrame = CGRectMake(0.0f,
                                        0.0f,
                                        label.frame.size.width + 10.0f,
                                        label.frame.size.height);
        header = [[UIView alloc] initWithFrame:resultFrame];
        [header addSubview:label];
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
    
    //    NSDictionary *photoInfo = self.photos[indexPath.section];
    //    PhotoViewController *vc = [[PhotoViewController alloc] init];
    //    vc.photoInfo = photoInfo;
    //    [self.navigationController pushViewController:vc animated:YES];
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
        
        [result addObject:[[NSString alloc] initWithFormat:@"Section %lu Cell %lu",
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

- (void) moveSection1ToSection3{
    
    NSMutableArray *s1 = self.arrayOfSections[0];
    [self.arrayOfSections removeObject:s1];
    [self.arrayOfSections addObject:s1];
    
    [self.tableView moveSection:0
                      toSection:2];
    
}


@end
