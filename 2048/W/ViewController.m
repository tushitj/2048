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
@property (weak, nonatomic) IBOutlet UILabel * scoreLabel;
//- (IBAction)startGme:(id)sender;
- (BOOL) isEmpty;
@end
@implementation ViewController
- (IBAction)rightGesture:(UISwipeGestureRecognizer *)sender {
    [self right];
    NSLog(@"RIGHT SWIPED");
}
- (IBAction)leftGesture:(UISwipeGestureRecognizer *)sender {
    NSLog(@"left SWIPED");
    [self left];
}
- (IBAction)upGesture:(UISwipeGestureRecognizer *)sender {
    NSLog(@"up SWIPED");
    [self up];
}
- (IBAction)downGesture:(UISwipeGestureRecognizer *)sender {
    NSLog(@"down SWIPED");
    [self down];
}
NSString * highScore;
int score;
- (void)viewDidLoad {
    [super viewDidLoad];
    highScore = [[NSUserDefaults standardUserDefaults] stringForKey:@"highScore"];
    [self.highScore setText:highScore];
    [_gameLabel setImage:[UIImage imageNamed:@"og_image.png"]];
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
    //NSLog(@"DONE***********");
    [self updateLabel];
    //[self add setHidden:true];
    //[_arrayOfLabels setHidden:true];
    // [self arrayOfLabels hidden:YES];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
//- (IBAction)startGme:(id)sender {
//    _row1 = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0], nil];
//    _row2 = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0], nil];
//    _row3 = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0], nil];
//    _row4 = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0], nil];
//
//    _gameB = [[NSMutableArray alloc] initWithObjects :_row1 , _row2 ,_row3 , _row4 ,nil];
//    for(int i=0;i<2;i++){
//        int row = [self randomRow];
//        int col = [self randomCol];
//        int value = [self randomValue];
//        [[_gameB objectAtIndex:row] replaceObjectAtIndex:col withObject: [NSNumber numberWithInt:value]];
//
//    }
//
//    //NSLog(@"DONE***********");
//
//    [self updateLabel];
//
//}
- (IBAction)print:(id)sender {
    [self printArray];
}
- (IBAction)add:(id)sender {
    [self addNewNumbers];
}
-(int) randomCol{
    //NSUInteger value;
    int c = arc4random_uniform(3);
    //NSLog(@"IN random Column Function Value is %d" , c);
    return c;
}
-(int) randomRow{
    //NSUInteger value;
    int r = arc4random_uniform(3);
    //NSLog(@"IN random Row Function Value is %d" , r);
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
    // NSLog(@"IN random Function Value is %d" , value);
    return value;
}
-(BOOL)isEmpty{
    for(int  i = 0; i<4 ; i++){
        for(int j=0;j<4;j++){
            if([_gameB[i][j] intValue] == 0)
                return YES;
        }
    }
    return NO;
}
-(BOOL)movePossible{
    if(1/* Write a condition that checks for each row or coulumn for any addition to take place*/)
        return YES;
    else
        return NO;
}
-(BOOL)endGame{
    if(!([self movePossible] && [self isEmpty]))
        return YES;
    else
        return NO;
}
-(void)addNewNumbers{
    NSMutableArray * emptySpacesX = [[NSMutableArray alloc] init];
    NSMutableArray * emptySpacesY = [[NSMutableArray alloc] init];
    for(int i=0;i<4;i ++){
        for(int j=0;j<4;j++){
            NSString * checker = [NSString stringWithFormat:@"%@" , _gameB[i][j]];
            if([checker isEqualToString:@"0"]){
                [emptySpacesX addObject:[NSNumber numberWithInt:i]];
                [emptySpacesY addObject:[NSNumber numberWithInt:j]];
            }
        }
    }
    int choice = arc4random_uniform((uint32_t)[emptySpacesX count]);
    //NSLog(@"Choice : %d" , choice);
    int x = [[emptySpacesX objectAtIndex:choice] intValue];
    int y = [[emptySpacesY objectAtIndex:choice] intValue];
    // NSLog(@"%d %d" , x,y);
    [[_gameB objectAtIndex:x] replaceObjectAtIndex:y withObject: [NSNumber numberWithInt:[self randomValue]]];
    [self updateLabel];
}
-(void)printArray{
    for(int i=0;i<4;i++){
        // NSLog(@"%@ %@ %@ %@" , _gameB[i][0],_gameB[i][1],_gameB[i][2],_gameB[i][3] );
        // NSLog(@"\n");
    }
    //NSLog(@"DONE***********");
}
-(void)up{
    BOOL alreadyCombined[4] = {NO,NO,NO,NO};
    NSLog(@"Push Up Now");
    // [self addNewNumbers];
    for(int y = 0; y<4 ; y++){
        for(int x = 1 ; x<4 ; x++){
            if([_gameB[x][y] intValue] !=0){
                int a = [[[_gameB objectAtIndex:x] objectAtIndex:y] intValue];
                int mover = x-1;
                while((mover>=0) && [_gameB[mover][y] intValue] ==0){
                    mover--;
                }
                if(mover == -1){
                    [[_gameB objectAtIndex:0] replaceObjectAtIndex:y withObject: [NSNumber numberWithInt:a]];
                    [[_gameB objectAtIndex:x] replaceObjectAtIndex:y withObject: [NSNumber numberWithInt:0]];
                }
                else if (([_gameB[mover][y] intValue] !=a) && mover+1 != x){
                    [[_gameB objectAtIndex:(mover+1)] replaceObjectAtIndex:y withObject: [NSNumber numberWithInt:a]];
                    [[_gameB objectAtIndex:x] replaceObjectAtIndex:y withObject: [NSNumber numberWithInt:0]];
                }
                else if([_gameB[mover][y] intValue] == a){
                    if(alreadyCombined[mover]){
                        [[_gameB objectAtIndex:(mover+1)] replaceObjectAtIndex:y withObject: [NSNumber numberWithInt:a]];
                        [[_gameB objectAtIndex:x] replaceObjectAtIndex:y withObject: [NSNumber numberWithInt:0]];
                    }
                    else{
                        [[_gameB objectAtIndex:mover] replaceObjectAtIndex:y withObject: [NSNumber numberWithInt:[[[_gameB objectAtIndex:mover] objectAtIndex:y] intValue]*2]];
                        score = score+4;
                        alreadyCombined[mover] = NO;
                        [[_gameB objectAtIndex:x] replaceObjectAtIndex:y withObject:[NSNumber numberWithInt:0]];
                    }
                }
            }
        }
    }
    //[self printArray];
    score++;
    if([self isEmpty])
        [self addNewNumbers];
    [self updateLabel];
}
-(void)left{
    //NSLog(@"Push Left Now");
    // [self addNewNumbers];
    BOOL alreadyCombined[4] = {NO,NO,NO,NO};
    for(int x = 0; x<4 ; x++){
        for(int y = 0 ; y<4 ; y++ ){
            if([_gameB[x][y] intValue] !=0){
                int a = [[[_gameB objectAtIndex:x] objectAtIndex:y] intValue];
                int mover = y - 1;
                while((mover>=0) && [_gameB[x][mover] intValue] ==0){
                    mover--;
                }
                if(mover == -1){
                    [[_gameB objectAtIndex:x] replaceObjectAtIndex:y withObject: [NSNumber numberWithInt:0]];
                    [[_gameB objectAtIndex:x] replaceObjectAtIndex:0 withObject: [NSNumber numberWithInt:a]];
                }
                else if (([_gameB[x][mover] intValue] !=a) && mover-1 != y){
                    [[_gameB objectAtIndex:x] replaceObjectAtIndex:y withObject: [NSNumber numberWithInt:0]];
                    [[_gameB objectAtIndex:x] replaceObjectAtIndex:(mover+1) withObject: [NSNumber numberWithInt:a]];
                }
                else if([_gameB[x][mover] intValue] == a){
                    if(alreadyCombined[mover]){
                        [[_gameB objectAtIndex:x] replaceObjectAtIndex:(mover+1) withObject: [NSNumber numberWithInt:a]];
                        [[_gameB objectAtIndex:x] replaceObjectAtIndex:y withObject: [NSNumber numberWithInt:0]];
                    }
                    else{
                        [[_gameB objectAtIndex:x] replaceObjectAtIndex:mover withObject: [NSNumber numberWithInt:[[[_gameB objectAtIndex:x] objectAtIndex:mover] intValue]*2]];
                        score = score+4;
                        alreadyCombined[mover]= YES;
                        [[_gameB objectAtIndex:x] replaceObjectAtIndex:y withObject:[NSNumber numberWithInt:0]];
                    }
                }
            }
        }
    }
    score++;
    if([self isEmpty])
        [self addNewNumbers];
    [self updateLabel];
}
-(void)right{
    //  NSLog(@"Push Right Now");
    BOOL alreadyCombined[4] = {NO,NO,NO,NO};
    for(int x = 0; x<4 ; x++){
        for(int y = 3 ; y>-1  ; y-- ){
            if([_gameB[x][y] intValue] !=0){
                int a = [[[_gameB objectAtIndex:x] objectAtIndex:y] intValue];
                int mover = y + 1;
                while((mover<=3) && [_gameB[x][mover] intValue] ==0){
                    mover++;
                }
                if(mover == 4){
                    [[_gameB objectAtIndex:x] replaceObjectAtIndex:y withObject: [NSNumber numberWithInt:0]];
                    [[_gameB objectAtIndex:x] replaceObjectAtIndex:3 withObject: [NSNumber numberWithInt:a]];
                }
                else if (([_gameB[x][mover] intValue] !=a) && mover-1 != y){
                    [[_gameB objectAtIndex:x] replaceObjectAtIndex:y withObject: [NSNumber numberWithInt:0]];
                    [[_gameB objectAtIndex:x] replaceObjectAtIndex:(mover-1) withObject: [NSNumber numberWithInt:a]];
                }
                else if([_gameB[x][mover] intValue] == a){
                    if(alreadyCombined[mover]){
                        [[_gameB objectAtIndex:x] replaceObjectAtIndex:(mover-1) withObject: [NSNumber numberWithInt:a]];
                        [[_gameB objectAtIndex:x] replaceObjectAtIndex:y withObject: [NSNumber numberWithInt:0]];
                    }
                    else{
                        [[_gameB objectAtIndex:x] replaceObjectAtIndex:mover withObject: [NSNumber numberWithInt:[[[_gameB objectAtIndex:x] objectAtIndex:mover] intValue]*2]];
                        score = score+4;
                        alreadyCombined[mover]= YES;
                        [[_gameB objectAtIndex:x] replaceObjectAtIndex:y withObject:[NSNumber numberWithInt:0]];
                    }
                }
            }
        }
    }
    score++;
    if([self isEmpty])
        [self addNewNumbers];
    [self updateLabel];
}
-(void) down{
    // NSLog(@"Push Down Now");
    // [self addNewNumbers];
    BOOL alreadyCombined[4] = {NO,NO,NO,NO};
    for(int y = 0; y<4 ; y++){
        for(int x = 2 ; x > -1 ; x--){
            if([_gameB[x][y] intValue] !=0){
                int a = [[[_gameB objectAtIndex:x] objectAtIndex:y] intValue];
                int mover = x + 1;
                while((mover<=3) && [_gameB[mover][y] intValue] ==0){
                    mover++;
                }
                if(mover == 4){
                    [[_gameB objectAtIndex:3] replaceObjectAtIndex:y withObject: [NSNumber numberWithInt:a]];
                    [[_gameB objectAtIndex:x] replaceObjectAtIndex:y withObject: [NSNumber numberWithInt:0]];
                }
                else if (([_gameB[mover][y] intValue] !=a) && mover-1 != x){
                    [[_gameB objectAtIndex:(mover-1)] replaceObjectAtIndex:y withObject: [NSNumber numberWithInt:a]];
                    [[_gameB objectAtIndex:x] replaceObjectAtIndex:y withObject: [NSNumber numberWithInt:0]];
                }
                else if([_gameB[mover][y] intValue] == a){
                    if(alreadyCombined[mover]){
                        [[_gameB objectAtIndex:(mover-1)] replaceObjectAtIndex:y withObject: [NSNumber numberWithInt:a]];
                        [[_gameB objectAtIndex:x] replaceObjectAtIndex:y withObject: [NSNumber numberWithInt:0]];
                    }
                    else{
                        [[_gameB objectAtIndex:mover] replaceObjectAtIndex:y withObject: [NSNumber numberWithInt:[[[_gameB objectAtIndex:mover] objectAtIndex:y] intValue]*2]];
                        score = score+4;
                        alreadyCombined[mover]= YES;
                        [[_gameB objectAtIndex:x] replaceObjectAtIndex:y withObject:[NSNumber numberWithInt:0]];
                    }
                }
            }
        }
    }
    score++;
    if([self isEmpty])
        [self addNewNumbers];
    [self updateLabel];
}
- (IBAction)upButton:(id)sender {
    [self up];
}
- (IBAction)downButton:(id)sender {
    [self down];
}
- (IBAction)rightButton:(id)sender {
    [self right];
}
- (IBAction)leftButton:(id)sender {
    [self left];
}
-(void)updateLabel{
    int index = 0;
    for(int  i = 0; i<4 ; i++){
        for(int j=0;j<4;j++){
            UILabel *label = (UILabel*)[self.arrayOfLabels objectAtIndex:index];
            int value = [_gameB[i][j] intValue];
            if(value == 0)
                [label setText:[NSString stringWithFormat:@""]];
            else
                [label setText:[NSString stringWithFormat:@"%d", value]];
            index++;
        }
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"%i",score];
    int highScoreInt = [highScore intValue];
    if(score>highScoreInt){
        highScore = [NSString stringWithFormat:@"%d", score];
        [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%d" ,score] forKey:@"highScore"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        self.highScore.text = highScore;
    }
}
@end
