//
//  CommunityTableViewCell.m
//  Market
//
//  Created by Daniel O'Rorke on 7/15/14.
//  Copyright (c) 2014 Phurbu Dolma. All rights reserved.
//

#import "CommunityTableViewCell.h"
#import "DrawerMenuViewController.h"

@implementation CommunityTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)onDrawerView:(id)sender {
    //load the home vc
    //    self.drawerMenuViewController.view.frame = self.contentView.frame;
    //    [self.contentView addSubview:self.drawerMenuViewController.view];
    //    //unselect all the others the home button
    //    self.drawerButton.selected = YES;
    
   
}

@end
