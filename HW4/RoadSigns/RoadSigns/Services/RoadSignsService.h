//
//  RoadSignsService.h
//  RoadSigns
//
//  Created by user on 27.09.2021.
//

#import <Foundation/Foundation.h>
#import "RSRoadSign.h"

NS_ASSUME_NONNULL_BEGIN

@interface RoadSignsService : NSObject

- (NSArray<RSRoadSign *> *) getRoadSigns;

@end

NS_ASSUME_NONNULL_END
