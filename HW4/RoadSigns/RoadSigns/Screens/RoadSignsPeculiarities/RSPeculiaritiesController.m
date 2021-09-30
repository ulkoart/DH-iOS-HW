//
//  RSPeculiaritiesController.m
//  RoadSigns
//
//  Created by user on 29.09.2021.
//

#import "RSPeculiaritiesController.h"

@interface RSPeculiaritiesController ()

@property (nonatomic, strong) NSString *text;

@end

@implementation RSPeculiaritiesController

- (instancetype) initWithText:(NSString *) text {
    self = [super init];
    if (self) {
        self.text = text;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
}

- (void) setupUI {
    UIButton *closeButton = [[UIButton alloc] init];
    closeButton.translatesAutoresizingMaskIntoConstraints = NO;
    [closeButton addTarget:self action:@selector(closeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [closeButton.titleLabel setFont:[UIFont systemFontOfSize:14 weight:UIFontWeightMedium]];
    [closeButton setImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
    [closeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [closeButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    closeButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: closeButton];
    [closeButton.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:24].active = YES;
    [closeButton.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-24].active = YES;
    [closeButton.heightAnchor constraintEqualToConstant:25].active = YES;
    [closeButton.widthAnchor constraintEqualToConstant:25].active = YES;
    
    UILabel *peculiaritiesText = [[UILabel alloc] init];
    peculiaritiesText.text = self.text;
    peculiaritiesText.numberOfLines = 0;
    peculiaritiesText.font = [UIFont systemFontOfSize:18 weight:UIFontWeightBold];
    peculiaritiesText.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: peculiaritiesText];
    [peculiaritiesText.topAnchor constraintEqualToAnchor: closeButton.bottomAnchor constant:16].active = YES;
    [peculiaritiesText.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:8].active = YES;
    [peculiaritiesText.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-8].active = YES;
    
}

- (void) closeButtonClicked:(UIButton*)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
