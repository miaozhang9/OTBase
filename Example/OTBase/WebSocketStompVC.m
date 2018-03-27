//
//  WebSocketStompVC.m
//  OTBase_Example
//
//  Created by Miaoz on 2018/3/27.
//  Copyright © 2018年 miaozhang9. All rights reserved.
//

#import "WebSocketStompVC.h"
#import <OTBase/WebsocketStompKit.h>
@interface WebSocketStompVC ()

@end

@implementation WebSocketStompVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self websocket];
   
}

- (void)websocket{
    NSURL *websocketUrl = [NSURL URLWithString:@"http://172.18.19.97:8088/gs-guide-websocket/websocket"];//
    STOMPClient *client = [[STOMPClient alloc] initWithURL:websocketUrl webSocketHeaders:@{} useHeartbeat:YES];
    // connect to the broker
    [client connectWithLogin:@""
                    passcode:@""
           completionHandler:^(STOMPFrame *_, NSError *error) {
               if (error) {
                   NSLog(@"%@", error);
                   return;
               }
               //监听服务端返回的消息
               [client subscribeTo:@"/app/sub" messageHandler:^(STOMPMessage *message) {
                   NSLog(@"/app/sub --- %@",message.body);
               }];
               //监听服务端返回的消息
               [client subscribeTo:@"/queue/1/message" messageHandler:^(STOMPMessage *message) {
                   NSLog(@"/queue/1/message --- %@",message.body);
               }];
               // send a message
               //               [client sendTo:@"/queue/myqueue" body:@"Hello, iOS!"];
               // and disconnect
               //               [client disconnect];
           }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
