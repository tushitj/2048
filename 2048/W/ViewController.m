//
//  ViewController.m
//  W
//
//  Created by Tushit Jain on 1/26/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) NSMutableArray * gameB;
@property (nonatomic,strong) NSMutableArray * row1;
@property (nonatomic,strong) NSMutableArray * row2;
@property (nonatomic,strong) NSMutableArray * row3;
@property (nonatomic,strong) NSMutableArray * row4;

- (IBAction)startGme:(id)sender;
- (BOOL) isEmpty;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)startGme:(id)sender {
    _row1 = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0], nil];
    _row2 = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0], nil];
    _row3 = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0], nil];
    _row4 = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0], nil];
    
    _gameB = [[NSMutableArray alloc] initWithObjects :_row1 , _row2 ,_row3 , _row4 ,nil];
    for(int i=0;i<2;i++){
        int row = [self randomRow];
        int col = [self randomCol];
        int value = [self randomValue];
        [[_gameB objectAtIndex:row] replaceObjectAtIndex:col withObject: [NSNumber numberWithInt:value]];
    }
    
  //  int a = [_gameB[1][1] intValue];
  //  int b = [_gameB[2][3] intValue];
  //  int c = a + b + 4;
    
    //NSInteger a = _gameB[2][3];
    //NSInteger b = _gameB[4][5];
    //NSInteger c = [[NSNumber alloc]initWithInt: (a+b)];
   // c = a + b + 4;
    //[[_gameB objectAtIndex:0] replaceObjectAtIndex:1 withObject: [NSNumber numberWithInt:c]];
    
    for(int i=0;i<4;i++){
                    NSLog(@"%@ %@ %@ %@" , _gameB[i][0],_gameB[i][1],_gameB[i][2],_gameB[i][3] );
        NSLog(@"\n");
    }
    
    NSLog(@"DONE***********");
    
    
    
}

-(int) randomCol{
    //NSUInteger value;
    int c = arc4random_uniform(3);
    NSLog(@"IN random Column Function Value is %d" , c);
    return c;

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

-(BOOL)isEmpty{
    if(1 /* put the condition to check any 0 in the matrix*/)
        return YES;
    else
        return NO;
}

-(BOOL)movePossible{
   
    if(1/* Write a condition that checks for each row or coulumn for any addition to take place*/)
        return YES;
    else
        return NO;
}

-(BOOL)endGame{
   if( [self isEmpty])
       return YES;
   else
       return NO;
        
}



- (IBAction)upButton:(id)sender {
    if([self endGame]){
        NSLog(@"TRUE");
        for(int i = 0 ; i< 4; i++){
            for(int j = 0 ; j<4; j++){
        //        if(gameB[i][j] == gameB[i][j] ){
          //          gameB[i][j] = gameB [1][2] + gameB[1][2];
           //     }
            }
        }
        
    }
    
    else
        NSLog(@"False");
}

- (IBAction)rightButton:(id)sender {
}
- (IBAction)downButton:(id)sender {
}
- (IBAction)leftButton:(id)sender {
}






@end
