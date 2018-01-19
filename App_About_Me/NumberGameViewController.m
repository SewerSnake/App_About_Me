//
//  NumberGameViewController.m
//  App_About_Me
//
//  Created by Eric Groseclos on 2018-01-17.
//  Copyright © 2018 Eric Groseclos. All rights reserved.
//

#import "NumberGameViewController.h"

@interface NumberGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *outputText;

@property (weak, nonatomic) IBOutlet UITextField *inputText;

@property (weak, nonatomic) IBOutlet UIButton *guessButton;

@property (weak, nonatomic) IBOutlet UILabel *highLowOutput;

@property (nonatomic) int theNumber;

@end

@implementation NumberGameViewController

// Generates a random number
// for the game. Ensures that one
// cannot enter a letter while using
// the keyboard.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _theNumber = 1 + arc4random_uniform(100);
    
    [self loadColor];
    
    self.inputText.keyboardType = UIKeyboardTypeNumberPad;
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

// Handles the user's guess. When the 'Guess' button is pressed, the entered number is compared to the hidden number. If the user guessed correctly, he/she is informed that the game has been won. Otherwise, the 'High Low Output' label tells the user that he/she must guess higher or lower.
- (IBAction)guess:(id)sender {
    int theGuess = self.inputText.text.intValue;
    
    if (theGuess == _theNumber) {
        self.outputText.text = @"You won!";
        _theNumber = 1 + arc4random_uniform(100);
    } else if (theGuess < _theNumber) {
        self.highLowOutput.text = @"Higher!";
        [self resetOutput];
    } else if (theGuess > _theNumber) {
        self.highLowOutput.text = @"Lower!";
        [self resetOutput];
    }
}

// Resets the output for a new game.
- (void) resetOutput {
    if (![self.outputText.text isEqualToString:@"Guess a number between 1-100"]) {
        self.outputText.text = @"Guess a number between 1-100";
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
