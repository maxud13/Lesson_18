//
//  ViewController.m
//  Lesson_19
//
//  Created by maxud on 17.10.2017.
//  Copyright © 2017 lesson_1. All rights reserved.
//

#import "ViewController.h"
#import "DispatchManager.h"

static NSInteger const kMaxValue = 50000;

@interface ViewController () <UITableViewDelegate ,UITableViewDataSource
>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSMutableArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.array = [NSMutableArray new];
    
    
    for (NSInteger i = 0; i < 50;i++)
    {
        [self.array addObject:[NSString stringWithFormat:@"Text %lu",i]];
    }
    
}
#pragma mark - Table View Data Source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.textLabel.text = self.array[indexPath.row];
    
//    __weak typeof (self)weakSelf = self;
//
//    [DispatchManager runInMain:^{
//        [weakSelf doSomeLogic];
//    }];
//    
//    [DispatchManager runInBAckground:^{
//        [weakSelf doSomeLogic];
//    }];
    
    return cell;
}
#pragma mark - Table View Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    __weak typeof(self)selfWeak = self;
    
    [DispatchManager runInBackground:^{
        NSInteger half = (NSInteger)(kMaxValue / 2.0f);
        
        for (NSInteger i = 0; i < kMaxValue; i++)
        {
            if (i == half)
            {
                [DispatchManager waitUntilDone:^{
                    [selfWeak needToCalculateAsSoonAsPosible];
                }];
            }
            else
            {
                NSLog(@"Do Some Logic... %lu", i);
            }
        }
    }];
}

#pragma mark - Private

- (void)doSomeLogic
{
    for (NSInteger i = 0; i < kMaxValue; i++)
    {
        NSLog(@"Do some Logic... %lu",i);
    }
}

-(void)needToCalculateAsSoonAsPosible
{
    for (NSInteger i =0; i < kMaxValue; i++) {
        NSLog(@"NeedToRunToCalculateAsSoonAsPosible...%lu",i);
    }
}



@end
