//
//  ViewController.m
//  HelloWorld
//
//  Created by Evans Owamoyo on 19.12.2020.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *conversionSegmentController;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property double ans;
@property NSArray * unitArrays;

@property NSString * currentUnit;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.unitArrays = @[@"Kilometers", @"Centimeters", @"Millimeters"];
    
}
- (IBAction)updateUnit:(id)sender {
    if(!_ans){
        _ans = 0.0;
    }
    _currentUnit = self.unitArrays[[self.conversionSegmentController selectedSegmentIndex]];
}

- (IBAction)convertFromMeters:(id)sender {
     double inputValue =  [self.inputField.text doubleValue];
    
    switch ([_conversionSegmentController selectedSegmentIndex]) {
        case 0:
            self.ans = inputValue/1000;
            break;
        case 1:
            self.ans = inputValue*100;
            break;
        case 2:
            self.ans = inputValue*1000;
            break;
        default:
            break;
    }
    [self.answerLabel setText: [NSString stringWithFormat:@"%.2f %@",self.ans,self.currentUnit]];
}

@end
