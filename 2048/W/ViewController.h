//
//  ViewController.h
//  W
//
//  Created by Tushit Jain on 1/26/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property(retain,nonatomic)IBOutletCollection(UILabel) NSArray * arrayOfLabels;
- (IBAction)startGme:(id)sender;
- (IBAction)print:(id)sender;

- (IBAction)add:(id)sender;
-(BOOL)movePossible;
-(BOOL)endGame;
@end
