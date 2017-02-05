//
//  StartViewController.m
//  W
//
//  Created by Tushit Jain on 2/5/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//

#import "StartViewController.h"

@interface StartViewController ()
@property (nonatomic,strong) NSMutableArray * gameB;
@property (nonatomic,strong) NSMutableArray * row1;
@property (nonatomic,strong) NSMutableArray * row2;
@property (nonatomic,strong) NSMutableArray * row3;
@property (nonatomic,strong) NSMutableArray * row4;

@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)startGame:(id)sender {

    

}
-(int) randomRow{
    //NSUInteger value;
    int r = arc4random_uniform(3);
    NSLog(@"IN random Row Function Value is %d" , r);
    return r;
    
}
-(int) randomValue{
    int value;
    int r = arc4random_uniform(2);
    if(r==1){
        value = 4;
    }
    else{
        value = 2 ;
    }
    NSLog(@"IN random Function Value is %d" , value);
    return value;
}
-(int) randomCol{
    //NSUInteger value;
    int c = arc4random_uniform(3);
    NSLog(@"IN random Column Function Value is %d" , c);
    return c;
    
}

@end
