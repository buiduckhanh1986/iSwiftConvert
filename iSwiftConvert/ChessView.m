//
//  ChessView.m
//  iSwiftConvert
//
//  Created by Bui Duc Khanh on 9/2/16.
//  Copyright © 2016 Bui Duc Khanh. All rights reserved.
//

#import "ChessView.h"

@interface ChessView ()

@end

@implementation ChessView
{
    CGFloat margin;
    CGFloat h0;
    UIView * containerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)loadView {
    [super loadView];
    
    margin = 10.0;
    h0 = 160.0;
    
    self.view.backgroundColor = [UIColor grayColor];
    
    containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width - margin * 2.0, self.view.bounds.size.width - margin * 2.0)];
    
    containerView.backgroundColor= [UIColor blackColor];
    
    [self.view addSubview:containerView];
    containerView.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
    
    
    float cellWidth = (self.view.bounds.size.width - margin * 2.0) / 8.0;
    
    for (int rowIndex = 0; rowIndex < 8; rowIndex++)
        for (int colIndex = 0; colIndex < 8; colIndex++)
        {
            CGRect rect = CGRectMake(colIndex * cellWidth, rowIndex*cellWidth, cellWidth, cellWidth);
            
            UIView *cell = [[UIView alloc] initWithFrame:rect];
            
            if (rowIndex % 2 == 0) {  //even row
                cell.backgroundColor = (colIndex % 2 == 0) ? [UIColor blackColor] : [UIColor whiteColor];
            } else { //odd row
                cell.backgroundColor = (colIndex % 2 == 0) ? [UIColor whiteColor] : [UIColor blackColor];
            }
            
            [containerView addSubview:cell];
        }
    
    UISlider * slider = [[UISlider alloc] initWithFrame:CGRectMake(20, self.view.bounds.size.height - 100, self.view.bounds.size.width - 40, 10)];
    
    slider.minimumValue = -1;
    slider.maximumValue = 1;
    slider.value = 0;
    
    [slider addTarget:self action:@selector(onRotate:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:slider];
}

- (void) onRotate: (UISlider *)sender{
    containerView.transform = CGAffineTransformMakeRotation(sender.value * M_PI);
}

@end
