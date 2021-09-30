//
//  ViewController.h
//  RoadSigns
//
//  Created by user on 27.09.2021.
//

#import <UIKit/UIKit.h>
#import "RSRoadSign.h"

@interface RSListController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray<RSRoadSign *> *roadSigns;

@end

