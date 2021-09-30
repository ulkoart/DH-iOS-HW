//
//  RoadSign.h
//  RoadSigns
//
//  Created by user on 27.09.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RSRoadSign : NSObject

@property NSString *title;
@property NSString *roadSignNumber;
@property NSString *roadSignCategory;
@property NSString *roadSignDescription;
@property NSString *roadSignPeculiarities;

- (instancetype)initWithTitle:(NSString *)title
               roadSignNumber:(NSString *)roadSignNumber
             roadSignCategory:(NSString *)roadSignCategory
        roadSignPeculiarities:(NSString *)roadSignPeculiarities
       andRoadSignDescription:(NSString *)roadSignDescription
;

@end

NS_ASSUME_NONNULL_END
