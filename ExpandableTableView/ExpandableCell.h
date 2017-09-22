//
//  ExpandableCell.h
//  ExpandableTableView
//
//  Created by Bimal Thapa on 1/9/15.
//  Copyright (c) 2015 Bimal Thapa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExpandableCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *subtitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *text_label;
@property (strong, nonatomic) IBOutlet UILabel *calculationLabel;
@property (strong, nonatomic) IBOutlet UILabel *fruitLabel;
@property (strong, nonatomic) IBOutlet UILabel *calcLabel;

@end
