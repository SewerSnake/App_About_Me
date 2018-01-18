//
//  InterestsViewController.m
//  App_About_Me
//
//  Created by Eric Groseclos on 2018-01-17.
//  Copyright © 2018 Eric Groseclos. All rights reserved.
//

#import "InterestsViewController.h"

@interface InterestsViewController ()

@end

@implementation InterestsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadColor];
}

// Retrieves an integer from NSUserDefaults.
// Changes the background of the app to the saved color.
- (void)loadColor {
    NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
    
    NSString *currentColorKey = @"currentcolor";
    
    if (!([preferences objectForKey:currentColorKey] == nil)) {
        NSInteger color = [preferences integerForKey:currentColorKey];
        
        [self applyColor:(int)color];
    }
}

// Changes the color to red, blue or green.
- (void)applyColor: (int)number {
    if (number == 1) {
        self.view.backgroundColor = [UIColor redColor];
    } else if (number == 2) {
        self.view.backgroundColor = [UIColor blueColor];
    } else if (number == 3) {
        self.view.backgroundColor = [UIColor greenColor];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
