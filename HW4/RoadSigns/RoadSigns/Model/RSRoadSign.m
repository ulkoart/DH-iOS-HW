//
//  RoadSign.m
//  RoadSigns
//
//  Created by user on 27.09.2021.
//

#import "RSRoadSign.h"

@implementation RSRoadSign

- (instancetype)initWithTitle:(NSString *)title
               roadSignNumber:(NSString *)roadSignNumber
             roadSignCategory:(NSString *)roadSignCategory
        roadSignPeculiarities:(NSString *)roadSignPeculiarities
       andRoadSignDescription:(NSString *)roadSignDescription {
    self = [super init];
    
    if (self) {
        self.title = title;
        self.roadSignNumber = roadSignNumber;
        self.roadSignCategory = roadSignCategory;
        self.roadSignPeculiarities = roadSignPeculiarities;
        self.roadSignDescription = roadSignDescription;
    }
    return self;
}

@end
