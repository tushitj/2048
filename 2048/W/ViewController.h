//
//  ViewController.h
//  W
//
//  Created by Tushit Jain on 1/26/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)startGme:(id)sender;

-(BOOL)movePossible;
-(BOOL)endGame;
@end
