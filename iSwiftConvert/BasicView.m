//
//  BasicView.m
//  iSwiftConvert
//
//  Created by Bui Duc Khanh on 9/2/16.
//  Copyright © 2016 Bui Duc Khanh. All rights reserved.
//

#import "BasicView.h"

@interface BasicView ()
@property (weak, nonatomic) IBOutlet UIView *myView;
@property (weak, nonatomic) IBOutlet UISlider *rotateSlider;
@property (weak, nonatomic) IBOutlet UISlider *scaleSlider;

@end

@implementation BasicView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)rotateAndScale {
    CGAffineTransform rotateTransform = CGAffineTransformMakeRotation(_rotateSlider.value * M_PI);
    CGAffineTransform scalaTransform = CGAffineTransformMakeScale(_scaleSlider.value, _scaleSlider.value);
    _myView.transform = CGAffineTransformConcat(rotateTransform, scalaTransform);
}

- (IBAction)onShow:(id)sender {
    _myView.hidden = !((UISwitch *)sender).on;
}

- (IBAction)onAlphaChange:(id)sender {
    _myView.alpha = ((UISlider *)sender).value;
}

- (IBAction)onRotate:(id)sender {
    [self rotateAndScale];
}

- (IBAction)onScaleChange:(id)sender {
    [self rotateAndScale];
}

- (IBAction)onColorChange:(id)sender {
    switch (((UISegmentedControl *)sender).selectedSegmentIndex)
    {
        case 0:
            _myView.backgroundColor = [UIColor blackColor]; break;
            
        case 1:
            _myView.backgroundColor = [UIColor redColor]; break;
            
        case 2:
            _myView.backgroundColor = [UIColor greenColor]; break;
            
        case 3:
            _myView.backgroundColor = [UIColor blueColor]; break;
    }
}


@end
