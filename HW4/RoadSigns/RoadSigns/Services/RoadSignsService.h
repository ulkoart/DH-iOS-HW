//
//  RoadSignsService.h
//  RoadSigns
//
//  Created by user on 27.09.2021.
//

#import <Foundation/Foundation.h>
#import "RSRoadSign.h"

NS_ASSUME_NONNULL_BEGIN

@protocol RoadSignsServiceProtocol <NSObject>

@required
- (NSArray<RSRoadSign *> *) getRoadSigns;

@end

@interface RoadSignsService : NSObject<RoadSignsServiceProtocol>

- (NSArray<RSRoadSign *> *) getRoadSigns;

@end

NS_ASSUME_NONNULL_END
