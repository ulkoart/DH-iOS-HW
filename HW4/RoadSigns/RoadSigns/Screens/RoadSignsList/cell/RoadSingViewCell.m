//
//  RoadSingViewCell.m
//  RoadSigns
//
//  Created by user on 27.09.2021.
//

#import "RoadSingViewCell.h"
#import "RSRoadSign.h"

@interface RoadSingViewCell ()

@property (nonatomic, strong) UIImageView *roadSignImage;
@property (nonatomic, strong) UILabel *roadSignTitleLabel;
@property (nonatomic, strong) UILabel *roadSignCategoryLabel;

@end

@implementation RoadSingViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void) setupWithRoadSign:(RSRoadSign *) roadSign {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSString *text = [NSString stringWithFormat:@"%@ %@", roadSign.roadSignNumber, roadSign.title];    
    self.roadSignTitleLabel.text = text;

    self.roadSignImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", roadSign.roadSignNumber]];
    self.roadSignCategoryLabel.text = roadSign.roadSignCategory;
}

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.roadSignImage = [[UIImageView alloc] init];
        self.roadSignImage.contentMode =  UIViewContentModeScaleAspectFit;

        [self.roadSignImage.widthAnchor constraintEqualToConstant:50].active = YES;
        [self.roadSignImage.heightAnchor constraintEqualToConstant:48].active = YES;
        
        self.roadSignTitleLabel = [[UILabel alloc] init];
        self.roadSignTitleLabel.numberOfLines = 2;
        self.roadSignTitleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightMedium];
        
        self.roadSignCategoryLabel = [[UILabel alloc] init];
        self.roadSignCategoryLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
        self.roadSignCategoryLabel.textColor = [[UIColor grayColor] init];
        
        UIStackView *labelsStack = [[UIStackView alloc] initWithArrangedSubviews:[[NSArray alloc] initWithObjects:
                                                                                  self.roadSignTitleLabel,
                                                                                  self.roadSignCategoryLabel, nil]];
        labelsStack.translatesAutoresizingMaskIntoConstraints = NO;
        labelsStack.axis = UILayoutConstraintAxisVertical;
        labelsStack.distribution = UIStackViewDistributionEqualCentering;
        labelsStack.alignment = UIStackViewAlignmentLeading;
        
        UIStackView *roadSignInfoStack = [[UIStackView alloc] initWithArrangedSubviews:[[NSArray alloc] initWithObjects: self.roadSignImage, labelsStack, nil]];
        roadSignInfoStack.translatesAutoresizingMaskIntoConstraints = NO;
        roadSignInfoStack.spacing = 5;
        
        [self.contentView addSubview:roadSignInfoStack];
        [roadSignInfoStack.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor].active = YES;
        [roadSignInfoStack.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant: 8].active = YES;
        [roadSignInfoStack.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant: -8].active = YES;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
