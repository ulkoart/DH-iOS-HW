//
//  RoadSignsListPresenter.m
//  RoadSigns
//
//  Created by user on 29.09.2021.
//

#import "RoadSignsListPresenter.h"
#import <UIKit/UIKit.h>
#import "RoadSignsService.h"
#import "RSListController.h"

@implementation RoadSignsListPresenter

- (instancetype)initWithView:(RSListController *)view {
    self = [super init];
    self.view = view;
    self.roadSignsService = [[RoadSignsService alloc] init];
    return self;
}

- (void)loadData {
    self.view.roadSigns = [self.roadSignsService getRoadSigns];
}

@end
