//
//  RoadSignsServiceProxy.h
//  RoadSigns
//
//  Created by user on 04.10.2021.
//

#import <Foundation/Foundation.h>
#import "RoadSignsService.h"

NS_ASSUME_NONNULL_BEGIN

@interface RoadSignsServiceProxy : NSObject<RoadSignsServiceProtocol>

@property (nonatomic, strong) RoadSignsService* roadSignsService;
- (instancetype)initWithRoadSignsService:(RoadSignsService *)roadSignsService;
- (NSArray<RSRoadSign *> *) getRoadSigns;

@end

NS_ASSUME_NONNULL_END
