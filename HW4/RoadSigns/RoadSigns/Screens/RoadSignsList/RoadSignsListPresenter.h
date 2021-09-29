//
//  RoadSignsListPresenter.h
//  RoadSigns
//
//  Created by user on 29.09.2021.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RoadSignsService.h"
#import "RSListController.h"

NS_ASSUME_NONNULL_BEGIN

@interface RoadSignsListPresenter : NSObject

@property (nonatomic, strong) RoadSignsService *roadSignsService;
@property (nonatomic, strong) RSListController *view;

- (instancetype)initWithView:(UIViewController *)view;
- (void)loadData;

@end

NS_ASSUME_NONNULL_END
