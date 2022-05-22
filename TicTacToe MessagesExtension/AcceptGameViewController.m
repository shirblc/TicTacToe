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
    
    [self.activeConversation sendMessage:newMessage completionHandler:^(NSError * _Nullable error) {
        if(error) {
            [self showErrorAlertWithError:error.localizedDescription];
        }
    }];
}

- (IBAction)declineGame:(id)sender {
    MSMessage *newMessage = [self createResponseMessageWithValue:@"false" withMessage:@"Not right now. Maybe some other time."];
    
    [self.activeConversation insertMessage:newMessage completionHandler:^(NSError * _Nullable error) {
        if(error) {
            [self showErrorAlertWithError:error.localizedDescription];
        }
    }];
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

-(void)showErrorAlertWithError: (NSString*)errorText {
    UIAlertController *errorAlert = [[UIAlertController alloc] init];
    errorAlert.title = @"An error occurred";
    errorAlert.message = [[NSString alloc] initWithFormat:@"An error occurred: %@", errorText];
    UIAlertAction *closeAction = [UIAlertAction actionWithTitle:@"Close" style:1 handler:^(UIAlertAction * _Nonnull action) {
        [self dismiss];
    }];
    [errorAlert addAction: closeAction];
    [self presentViewController:errorAlert animated:true completion:nil];
}

@end
