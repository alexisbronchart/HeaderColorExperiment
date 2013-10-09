//
//  HCEViewController.m
//  HeaderColorExperiment
//
//  Created by Alexis Bronchart on 08/10/13.
//  Copyright (c) 2013 Jafar. All rights reserved.
//

#import "HCEViewController.h"
#import "HCEHeaderColorView.h"

@interface HCEViewController ()

@end

@implementation HCEViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%d", indexPath.row];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    HCEHeaderColorView *v = [[HCEHeaderColorView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    
    v.backgroundColor = [UIColor blueColor];
    
    return v;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    [[NSNotificationCenter defaultCenter] postNotificationName:@"scroll" object:nil];
}

@end
