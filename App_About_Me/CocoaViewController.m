//
//  CocoaViewController.m
//  App_About_Me
//
//  Created by Eric Groseclos on 2018-01-13.
//  Copyright © 2018 Eric Groseclos. All rights reserved.
//

#import "CocoaViewController.h"

@interface CocoaViewController ()

@property (weak, nonatomic) IBOutlet UIButton *colorButton;

@end

@implementation CocoaViewController

// Retrieves an integer from NSUserDefaults.
// Changes the background of the app to the saved color.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
    
    NSString *currentColorKey = @"currentcolor";
    
    if (!([preferences objectForKey:currentColorKey] == nil))
    {
        const NSInteger color = [preferences integerForKey:currentColorKey];
        
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

// Changes the background color for the entire app when the button is pressed. The color is decided at random. Saves the current color to NSUserDefaults.
- (IBAction)colorChange:(id)sender {
    int number = 1 + arc4random_uniform(3);
    
    NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
    
    NSString *currentColorKey = @"currentcolor";
    
    [preferences setInteger:number forKey:currentColorKey];
    
    [preferences synchronize];
    
    [self applyColor:number];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Gets the new view controller
    //[segue destinationViewController]
    // Passes the selected object to the new view controller.
}


@end
