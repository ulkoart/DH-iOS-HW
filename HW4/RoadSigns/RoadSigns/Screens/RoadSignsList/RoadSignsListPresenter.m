//
//  RoadSignsListPresenter.m
//  RoadSigns
//
//  Created by user on 29.09.2021.
//

#import "RoadSignsListPresenter.h"
#import <UIKit/UIKit.h>
#import "RoadSignsService.h"
#import "RoadSignsServiceProxy.h"
#import "RSListController.h"

@implementation RoadSignsListPresenter

- (instancetype)initWithView:(RSListController *)view {
    self = [super init];
    self.view = view;
    self.roadSignsServiceProxy = [[RoadSignsServiceProxy alloc] initWithRoadSignsService:[[RoadSignsService alloc] init]];
    return self;
}

- (void)loadDataWithComplition:(void(^)(NSUInteger)) complition {
    NSArray<RSRoadSign *> * soadSigns = [self.roadSignsServiceProxy getRoadSigns];
    self.view.roadSigns = soadSigns;
    complition(soadSigns.count);
}

@end
