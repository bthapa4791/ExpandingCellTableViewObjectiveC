//
//  TableViewController.m
//  ExpandableTableView
//
//  Created by Bimal Thapa on 1/9/15.
//  Copyright (c) 2015 Bimal Thapa. All rights reserved.
//

#import "TableViewController.h"
#import "ExpandableCell.h"

@interface TableViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TableViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    selectedIndex = -1;
    
    titleArray = [[NSMutableArray alloc] init];
    NSString *string;
    
    for (int i=1; i<=8; i++) {
        string = [[NSString alloc] initWithFormat:@"Row %i", i];
        [titleArray addObject:string];
    }
    
    subtitlearray = [[NSArray alloc] initWithObjects:@"First Row", @"Second Row", @"Third Row", @"Forth Row", @"Fifth Row", @"Sixth Row", @"Seven row", @"Eight Row", nil];
    textArray = [[NSArray alloc] initWithObjects:@"Apple", @"Banana", @"Grapes", @"PineApple", @"Orange", @"Mango", @"Momo", @"Burger", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return titleArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ExpandableCell *cell = (ExpandableCell *) [tableView dequeueReusableCellWithIdentifier:@"expandableCell"];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ExpandableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        cell.clipsToBounds = YES;
    }
    
    if (selectedIndex == indexPath.row) {
    } else {
    }
    
    cell.titleLabel.text = [titleArray objectAtIndex:indexPath.row];
    cell.subtitleLabel.text = [subtitlearray objectAtIndex:indexPath.row];
    cell.fruitLabel.text = [textArray objectAtIndex:indexPath.row];
    NSInteger calculation = (indexPath.row + 1) * 25;
    cell.calculationLabel.text = [NSString stringWithFormat:@"%ld", (long)calculation];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (selectedIndex == indexPath.row) {
        return 115;
    } else {
        return 44;
    }
}

-(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //user taps expanded row
    if (selectedIndex == indexPath.row) {
        selectedIndex = -1;
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationFade];
        return;
    }
    //user taps different row
    if (selectedIndex != -1) {
        NSIndexPath *prevPath = [NSIndexPath indexPathForRow:selectedIndex inSection:0];
        selectedIndex = indexPath.row;
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:prevPath, nil] withRowAnimation:UITableViewRowAnimationFade];
    };
    //users taps newrow none expanded
    selectedIndex = indexPath.row;
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationFade];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
