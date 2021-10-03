//
//  RoadSingViewCell.h
//  RoadSigns
//
//  Created by user on 27.09.2021.
//

#import <UIKit/UIKit.h>
#import "RSRoadSign.h"

NS_ASSUME_NONNULL_BEGIN

@interface RoadSingViewCell : UITableViewCell

- (void) setupWithRoadSign:(RSRoadSign *) roadSign;

@end

NS_ASSUME_NONNULL_END
