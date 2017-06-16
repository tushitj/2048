//
//  ViewController.h
//  W
//
//  Created by Tushit Jain on 1/26/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//
#import <UIKit/UIKit.h>
@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *highScore;
@property (weak, nonatomic) IBOutlet UIImageView *gameLabel;
@property(retain,nonatomic)IBOutletCollection(UILabel) NSArray * arrayOfLabels;
@property(strong,nonatomic) NSMutableDictionary * imageToNum;
//- (IBAction)startGme:(id)sender;
//- (IBAction)print:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *scoreBest;
- (IBAction)add:(id)sender;
-(BOOL)movePossible;
-(BOOL)endGame;
@end
