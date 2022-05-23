//
//  MessagesViewController.h
//  TicTacToe MessagesExtension
//
//  Created by Shir Bar Lev on 21/05/2022.
//

#import <Messages/Messages.h>
#import "Delegates/TicTacToeViewControllerDelegate.h"

@interface MessagesViewController : MSMessagesAppViewController <TicTacToeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *appTitle;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

@end
