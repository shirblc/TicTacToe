//
//  StartGameViewController.m
//  TicTacToe MessagesExtension
//
//  Created by Shir Bar Lev on 22/05/2022.
//

#import "StartGameViewController.h"

@interface StartGameViewController ()

@end

@implementation StartGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)startNewGame:(id)sender {
    MSMessageTemplateLayout *newMessageLayout = [[MSMessageTemplateLayout alloc] init];
    newMessageLayout.caption = @"Want to play tic tac toe?";
    
    MSMessage *newMessage = [[MSMessage alloc] initWithSession:[[MSSession alloc] init]];
    newMessage.layout = newMessageLayout;
    
    [self.activeConversation insertMessage:newMessage completionHandler:^(NSError * _Nullable error) {
        
        if(error) {
            [self showErrorAlertWithError:error.localizedDescription];
        }
    }];
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
