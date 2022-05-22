//
//  TicTacToeViewControllerDelegate.h
//  TicTacToe MessagesExtension
//
//  Created by Shir Bar Lev on 22/05/2022.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TicTacToeViewControllerDelegate <NSObject>

-(void)sendMessageWithMessage:(MSMessage*) message;

@end

NS_ASSUME_NONNULL_END
