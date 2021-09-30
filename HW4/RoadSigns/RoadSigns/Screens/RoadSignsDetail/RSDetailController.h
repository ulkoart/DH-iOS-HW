//
//  RSDetailController.h
//  RoadSigns
//
//  Created by user on 29.09.2021.
//

#import <UIKit/UIKit.h>
#import "RSRoadSign.h"

NS_ASSUME_NONNULL_BEGIN

@interface RSDetailController : UIViewController

- (void) configureWithRoadSign:(RSRoadSign *) roadSign;

@end

NS_ASSUME_NONNULL_END
