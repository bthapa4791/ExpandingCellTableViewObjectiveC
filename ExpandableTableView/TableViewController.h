//
//  TableViewController.h
//  ExpandableTableView
//
//  Created by Bimal Thapa on 1/9/15.
//  Copyright (c) 2015 Bimal Thapa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    int selectedIndex;
    NSMutableArray *titleArray;
    NSArray *subtitlearray;
    NSArray *textArray;
}



@end
