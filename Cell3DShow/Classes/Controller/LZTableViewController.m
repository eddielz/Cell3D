//
//  LZTableViewController.m
//  Cell3DShow
//
//  Created by zhi on 2016/11/9.
//  Copyright © 2016年 zhi. All rights reserved.
//

#import "LZTableViewController.h"
#import "YYFPSLabel.h"

@interface LZTableViewController ()

@end

@implementation LZTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    
    self.view.backgroundColor = [UIColor blackColor];

    [self.tableView registerNib:[UINib nibWithNibName:@"LZTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cellID"];
    
    self.title = @"Cell 3D";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[[YYFPSLabel alloc]initWithFrame:CGRectMake(0, 5, 60, 30)]];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    
    cell.textLabel.text = @"Cell 3D";
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CATransform3D rotation;
    
    rotation = CATransform3DMakeTranslation(0, 50, 20);
    
    rotation = CATransform3DScale(rotation, 0.9, 0.9, 1);
    
    rotation.m34 = 1.0 / -600;
    
    cell.layer.shadowColor = [[UIColor whiteColor] CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;
    
    cell.layer.transform = rotation;
    
    [UIView beginAnimations:@"rotation" context:nil];
    
    //旋转时间
    [UIView setAnimationDuration:0.6];
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    
    [UIView commitAnimations];

}

@end
