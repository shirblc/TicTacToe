//
//  AcceptGameViewController.h
//  TicTacToe MessagesExtension
//
//  Created by Shir Bar Lev on 21/05/2022.
//

#import <Messages/Messages.h>
#import "Delegates/TicTacToeViewControllerDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface AcceptGameViewController : MSMessagesAppViewController

@property (nonatomic) MSMessagesAppViewController <TicTacToeViewControllerDelegate> *delegate;

@end

NS_ASSUME_NONNULL_END
