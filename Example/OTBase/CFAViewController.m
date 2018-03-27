//
//  CFAViewController.m
//  OTBase
//
//  Created by miaozhang9 on 03/01/2018.
//  Copyright (c) 2018 miaozhang9. All rights reserved.
//

#import "CFAViewController.h"
#import <OTBase/UIColor+QH.h>
#import "WebSocketStompVC.h"

@interface CFAViewController ()

@end

@implementation CFAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor qh_colorWithHexString:@"#af4ac2"];
    
}

- (void)webSocketStomp {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 50, 70, 30);
    [button setTitle:@"WebSocket" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)click:(id)sender {
    WebSocketStompVC *vc = [[WebSocketStompVC alloc] init];
    [self.navigationController pushViewController:vc animated:true];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
