//
//  MessagesViewController.m
//  TicTacToe MessagesExtension
//
//  Created by Shir Bar Lev on 21/05/2022.
//

#import "MessagesViewController.h"
#import "AcceptGameViewController.h"


@interface MessagesViewController ()

@end

@implementation MessagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Conversation Handling

-(void)didBecomeActiveWithConversation:(MSConversation *)conversation {
    // Called when the extension is about to move from the inactive to active state.
    // This will happen when the extension is about to present UI.
    
    // Use this method to configure the extension and restore previously stored state.
}

-(void)willResignActiveWithConversation:(MSConversation *)conversation {
    // Called when the extension is about to move from the active to inactive state.
    // This will happen when the user dismisses the extension, changes to a different
    // conversation or quits Messages.
    
    // Use this method to release shared resources, save user data, invalidate timers,
    // and store enough state information to restore your extension to its current state
    // in case it is terminated later.
}

-(void)didReceiveMessage:(MSMessage *)message conversation:(MSConversation *)conversation {
    // Called when a message arrives that was generated by another instance of this
    // extension on a remote device.
    
    // Use this method to trigger UI updates in response to the message.
}

-(void)didStartSendingMessage:(MSMessage *)message conversation:(MSConversation *)conversation {
    // Called when the user taps the send button.
}

-(void)didCancelSendingMessage:(MSMessage *)message conversation:(MSConversation *)conversation {
    // Called when the user deletes the message without sending it.
    
    // Use this to clean up state related to the deleted message.
}

-(void)willTransitionToPresentationStyle:(MSMessagesAppPresentationStyle)presentationStyle {
    // Called before the extension transitions to a new presentation style.
    
    // Use this method to prepare for the change in presentation style.
}

-(void)didTransitionToPresentationStyle:(MSMessagesAppPresentationStyle)presentationStyle {
    if(presentationStyle == MSMessagesAppPresentationStyleExpanded) {
        AcceptGameViewController *acceptGameVC = [self.storyboard instantiateViewControllerWithIdentifier:@"acceptGameVC"];
        [self addChildViewController:acceptGameVC];
        [self.view addSubview:acceptGameVC.view];
        acceptGameVC.view.bounds = self.view.bounds;
    }
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
