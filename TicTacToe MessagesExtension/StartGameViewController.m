//
//  StartGameViewController.m
//  TicTacToe MessagesExtension
//
//  Created by Shir Bar Lev on 22/05/2022.
//

#import "StartGameViewController.h"
#import "Delegates/TicTacToeViewControllerDelegate.h"

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
    
    [self.delegate sendMessageWithMessage:newMessage];
}

@end
