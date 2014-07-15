//
//  ProfileViewController.h
//  Market
//
//  Created by Kaili An on 7/14/14.
//  Copyright (c) 2014 Phurbu Dolma. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <UIKit/UIKit.h>

static NSString *CellIdentifier = @"Cell Identifier";
@interface ProfileViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
//@property (strong, nonatomic) UITableView *tableView;
@property  (strong, nonatomic) NSMutableArray *arrayOfSections;

@end

