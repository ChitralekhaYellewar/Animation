//
//  AnimationViewController.m
//  AnimationObjeC
//
//  Created by Chitralekha Yellewar on 21/08/18.
//  Copyright © 2018 Chitralekha Yellewar. All rights reserved.
//

#import "AnimationViewController.h"
#import "Constants.h"

@interface AnimationViewController ()
    
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleBottomConstraint;
    
@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self hideLabels];
    [self startAnimation];
}
    
- (void)hideLabels {
    self.titleLabel.alpha = ALPHA_ZERO;
    self.subTitleLabel.alpha = ALPHA_ZERO;
}
    
- (void)startAnimation {
    [self animateTitleLabel];
}

#pragma Mark- animate title label
    
- (void)animateTitleLabel {
    [UIView animateWithDuration:ANIMATE_DURATION delay:ANIMATE_DELAY options:UIViewAnimationOptionTransitionCurlUp animations:^{
        self.titleLabel.alpha = ALPHA_ONE;
        [self.titleBottomConstraint setConstant:self.view.frame.size.height * BOTTOM_MULTIPLIER];
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self animateSubtitleLabel];
    }];
}

#pragma Mark- animate subtitle label
    
- (void)animateSubtitleLabel {
    [UIView animateWithDuration:ANIMATE_DURATION delay:ANIMATE_DELAY options:UIViewAnimationOptionTransitionCurlUp animations:^{
        self.subTitleLabel.alpha = ALPHA_ONE;
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        NSLog(@"Animation complete !!");
    }];
}
    
@end
