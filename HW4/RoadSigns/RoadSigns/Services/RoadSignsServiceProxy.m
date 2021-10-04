//
//  RoadSignsServiceProxy.m
//  RoadSigns
//
//  Created by user on 04.10.2021.
//

#import "RoadSignsServiceProxy.h"
#import "RoadSignsService.h"

/// Заместитель для RoadSignsService
@implementation RoadSignsServiceProxy

- (instancetype)initWithRoadSignsService:(RoadSignsService *)roadSignsService {
    self = [super init];
    self.roadSignsService = roadSignsService;
    return self;
}

- (NSArray<RSRoadSign *> *) getRoadSigns {
    NSArray<RSRoadSign *> *roadSignsArray = [self.roadSignsService getRoadSigns];
    NSLog(@"Hello Proxy!");
    return roadSignsArray;
}

@end
