//
//  ViewController.m
//  TagList
//
//  Created by Chen on 15/10/19.
//  Copyright © 2015年 Weidong Chen. All rights reserved.
//

#import "ViewController.h"
#import "WDTagListView.h"

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

#define iOS7 SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")
#define iOS8 SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSArray *tagListNameArr1 = @[@"Foo",@"Tag Label 1",@"Tag Label 2",@"Tag Label 3",@"Tag Label 4",@"Tag Label 5",@"Tag Label 6",@"啦啦啦"];
    NSArray *tagListNameArr2 = @[@"Foo",@"Tag Label 1",@"Tag 2",@"Tag Label 3",@"Tag 4",@"Tag Label 5",@"Label 6",@"好开心"];
    NSArray *tagListNameArr3 = @[@"Foo",@"Tag Label 1",@"Label 2",@"Tag Label 3",@"Label 4",@"Tag Label 5",@"Tag 6",@"我做出来了"];


    WDTagListView *tagListView1 = [[WDTagListView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 200)];
    [tagListView1 viewWithListArray:tagListNameArr1 tagClick:^(NSUInteger tag) {
        [[[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"第%zd个tag被选中",tag] message:nil delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil] show];
    }];
    tagListView1.backgroundColor = [UIColor yellowColor];

    [self.view addSubview:tagListView1];


    WDTagListView *tagListView2 = [[WDTagListView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 200)];
    tagListView2.normalImageName = @"tagBgIcon";
    tagListView2.tagFont = [UIFont boldSystemFontOfSize:18];
    tagListView2.tagHeight = 25;
    [tagListView2 viewWithListArray:tagListNameArr2 tagClick:^(NSUInteger tag) {
        [[[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"第%zd个tag被选中",tag] message:nil delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil] show];
    }];
    tagListView2.backgroundColor = [UIColor greenColor];

    [self.view addSubview:tagListView2];

    WDTagListView *tagListView3 = [[WDTagListView alloc] initWithFrame:CGRectMake(50, 200, self.view.frame.size.width - 100, 200)];
    tagListView3.lineSpace = 10;
    tagListView3.tagSpace = 10;
    [tagListView3 viewWithListArray:tagListNameArr3 tagClick:^(NSUInteger tag) {
        [[[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"第%zd个tag被选中",tag] message:nil delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil] show];
    }];
    tagListView3.backgroundColor = [UIColor redColor];

    [self.view addSubview:tagListView3];


    WDTagListView *tagListView4 = [[WDTagListView alloc] initWithFrame:CGRectMake(25, 350, self.view.frame.size.width - 50, 200)];
    tagListView4.lineSpace = 20;
    tagListView4.tagSpace = 10;
    tagListView4.tagPadding = 40;
    tagListView4.tagMargin = 20;
    tagListView4.tagHeight = 30;
    tagListView4.leftPadding = 10;
    [tagListView4 viewWithListArray:tagListNameArr3 tagClick:^(NSUInteger tag) {
        [[[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"第%zd个tag被选中",tag] message:nil delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil] show];
    }];
    tagListView4.backgroundColor = [UIColor blueColor];
    [self.view addSubview:tagListView4];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
