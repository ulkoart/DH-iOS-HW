//
//  RSDetailController.m
//  RoadSigns
//
//  Created by user on 29.09.2021.
//

#import "RSDetailController.h"
#import "RSRoadSign.h"
#import "RSPeculiaritiesController.h"

@interface RSDetailController ()

@property (nonatomic, strong) RSRoadSign *roadSign;
@property (nonatomic, strong) UILabel *roadSignTitleLabel;
@property (nonatomic, strong) UILabel *roadSignDescriptionLabel;
@property (nonatomic, strong) UIImageView *roadSignImage;
@property (nonatomic, strong) UIButton *roadSignButton;

@end

@implementation RSDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void) setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.roadSignImage.translatesAutoresizingMaskIntoConstraints = NO;
    self.roadSignImage.contentMode =  UIViewContentModeScaleAspectFit;
    [self.view addSubview: self.roadSignImage];
    [self.roadSignImage.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:8].active = YES;
    [self.roadSignImage.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.roadSignImage.widthAnchor constraintEqualToConstant:150].active = YES;
    [self.roadSignImage.heightAnchor constraintEqualToConstant:130].active = YES;
    
    self.roadSignTitleLabel.numberOfLines = 2;
    self.roadSignTitleLabel.font = [UIFont systemFontOfSize:21 weight:UIFontWeightBold];
    self.roadSignTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: self.roadSignTitleLabel];
    [self.roadSignTitleLabel.topAnchor constraintEqualToAnchor:self.roadSignImage.bottomAnchor constant:8].active = YES;
    [self.roadSignTitleLabel.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:8].active = YES;
    [self.roadSignTitleLabel.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-8].active = YES;
    
    self.roadSignDescriptionLabel.numberOfLines = 0;
    self.roadSignDescriptionLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    self.roadSignDescriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: self.roadSignDescriptionLabel];
    [self.roadSignDescriptionLabel.topAnchor constraintEqualToAnchor:self.roadSignTitleLabel.bottomAnchor constant:8].active = YES;
    [self.roadSignDescriptionLabel.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:8].active = YES;
    [self.roadSignDescriptionLabel.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-8].active = YES;
    
    self.roadSignButton = [[UIButton alloc] init];
    self.roadSignButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.roadSignButton.layer.borderWidth = 1;
    self.roadSignButton.layer.cornerRadius = 5;
    [self.roadSignButton addTarget:self action:@selector(roadSignButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.roadSignButton.titleLabel setFont:[UIFont systemFontOfSize:14 weight:UIFontWeightBold]];
    [self.roadSignButton setTitle:@"Особенности" forState:UIControlStateNormal];
    [self.roadSignButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.roadSignButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    self.roadSignButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: self.roadSignButton];
    [self.roadSignButton.topAnchor constraintEqualToAnchor:self.roadSignDescriptionLabel.bottomAnchor constant:8].active = YES;
    [self.roadSignButton.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:16].active = YES;
    [self.roadSignButton.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-16].active = YES;
    [self.roadSignButton.heightAnchor constraintEqualToConstant:40].active = YES;

}

- (void) roadSignButtonClicked:(UIButton*)sender {
    RSPeculiaritiesController *controller = [[RSPeculiaritiesController alloc] initWithText: self.roadSign.roadSignPeculiarities];
    [self presentViewController:controller animated:YES completion:nil];
}

- (void) configureWithRoadSign:(RSRoadSign *) roadSign {
    self.roadSign = roadSign;
    self.navigationItem.title = [NSString stringWithFormat:@"Знак %@", roadSign.roadSignNumber];
    
    self.roadSignTitleLabel = [[UILabel alloc] init];
    self.roadSignTitleLabel.text = roadSign.title;
    
    self.roadSignDescriptionLabel = [[UILabel alloc] init];
    self.roadSignDescriptionLabel.text = roadSign.roadSignDescription;
    
    self.roadSignImage = [[UIImageView alloc] init];
    self.roadSignImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", roadSign.roadSignNumber]];
}

@end
