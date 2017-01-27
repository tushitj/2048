//
//  TableViewController.m
//  W
//
//  Created by Tushit Jain on 1/26/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//

#import <Foundation/Foundation.h>
@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[MultiColumnTableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.tableView.separatorColor = [UIColor lightGrayColor];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MultiColumnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.label1.text = [NSString stringWithFormat:@"Name %ld", (long)indexPath.row];
    cell.label2.text = [NSString stringWithFormat:@"Start %ld", (long)indexPath.row];
    cell.label3.text = [NSString stringWithFormat:@"End %ld", (long)indexPath.row];
    return cell;
}

@end
