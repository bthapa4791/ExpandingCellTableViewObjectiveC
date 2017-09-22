//
//  ExpandableCell.m
//  ExpandableTableView
//
//  Created by Bimal Thapa on 1/9/15.
//  Copyright (c) 2015 Bimal Thapa. All rights reserved.
//

#import "ExpandableCell.h"

@implementation ExpandableCell

@synthesize titleLabel, subtitleLabel, text_label, calculationLabel, fruitLabel, calcLabel;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
