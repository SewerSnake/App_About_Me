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

@property (weak, nonatomic) IBOutlet UILabel *outputText;

@property (weak, nonatomic) IBOutlet UITextField *inputText;

@property (weak, nonatomic) IBOutlet UIButton *guessButton;

@property (weak, nonatomic) IBOutlet UILabel *highLowOutput;

@end

@implementation CocoaViewController {
    int theNumber;
}

// Retrieves an integer from NSUserDefaults.
// Changes the background of the app to the saved color. Generates a random number
// for the game.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.outputText.text = @"Guess a number between 1-100";
    
    theNumber = 1 + arc4random_uniform(100);
    
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

// Handles the user's guess. When the 'Guess' button is pressed, the entered number is compared to the hidden number. If the user guessed correctly, he/she is informed that the game has been won. Otherwise, the 'High Low Output' label tells the user that he/she must guess higher or lower.
- (IBAction)guess:(id)sender {
    int theGuess = self.inputText.text.intValue;
    
    if (theGuess == theNumber) {
        self.outputText.text = @"You won!";
    } else if (theGuess < theNumber) {
        self.highLowOutput.text = @"Higher!";
    } else if (theGuess > theNumber) {
        self.highLowOutput.text = @"Lower!";
    }
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
