//
//  AcceptGameViewController.m
//  TicTacToe MessagesExtension
//
//  Created by Shir Bar Lev on 21/05/2022.
//

#import "AcceptGameViewController.h"

@interface AcceptGameViewController ()

@end

@implementation AcceptGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)acceptGame:(id)sender {
    MSMessage *newMessage = [self createResponseMessageWithValue:@"true" withMessage:@"Sure! Let's start."];
    [self.delegate sendMessageWithMessage:newMessage];
}

- (IBAction)declineGame:(id)sender {
    MSMessage *newMessage = [self createResponseMessageWithValue:@"false" withMessage:@"Not right now. Maybe some other time."];
    [self.delegate sendMessageWithMessage:newMessage];
}

- (MSMessage*)createResponseMessageWithValue:(NSString*) userResponseValue
                           withMessage:(NSString*) userMessage {
    NSURLComponents *userResponseUrl = [[NSURLComponents alloc] init];
    NSMutableArray *queryItems = [[NSMutableArray alloc] initWithObjects:[[NSURLQueryItem alloc] initWithName:@"shouldStartGame" value:userResponseValue], nil];
    userResponseUrl.queryItems = queryItems;
    
    MSMessageTemplateLayout *newMessageLayout = [[MSMessageTemplateLayout alloc] init];
    newMessageLayout.caption = userMessage;
    
    MSMessage *newMessage = [[MSMessage alloc] initWithSession:[[MSSession alloc] init]];
    newMessage.layout = newMessageLayout;
    newMessage.URL = userResponseUrl.URL;
    
    return newMessage;
}

@end
