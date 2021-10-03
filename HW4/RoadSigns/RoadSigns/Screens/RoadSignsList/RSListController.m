//
//  ViewController.m
//  RoadSigns
//
//  Created by user on 27.09.2021.
//

#import "RSListController.h"
#import "RSRoadSign.h"
#import "RoadSingViewCell.h"
#import "RoadSignsListPresenter.h"
#import "RSDetailController.h"

@interface RSListController ()

@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) RoadSignsListPresenter *presenter;

@end

@implementation RSListController

NSString *tableViewCellIdentifier = @"roadSignCell";

- (void) viewDidLoad {
    [super viewDidLoad];
    self.presenter = [[RoadSignsListPresenter alloc] initWithView:self];
    [self setupUI];
    [self getData];
}

-(void) getData {
    // Задание 6 Использовать блоки в коде проекта
    typedef void (^ComplitionBlockType)(NSUInteger);

    ComplitionBlockType complitionBlock = ^(NSUInteger count) {
        NSLog(@"loaded - %ld road signs", count);
    };
    
     //без typedef
//        void (^complitionBlock)(NSUInteger) = ^(NSUInteger count) {
//            NSLog(@"loaded - %ld road signs", count);
//        };
    
    [self.presenter loadDataWithComplition:complitionBlock];
}

- (void) setupUI {
    self.view.backgroundColor = [[UIColor whiteColor] init]; // [UIColor whiteColor]
    self.navigationItem.title = @"Дорожные знаки";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Назад" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationController.navigationBar.topItem.backBarButtonItem = barButtonItem;
    
    self.table = [[UITableView alloc] init];
    [self.table registerClass: RoadSingViewCell.self forCellReuseIdentifier:tableViewCellIdentifier];
    self.table.allowsSelection = YES;
    self.table.translatesAutoresizingMaskIntoConstraints = NO;
    self.table.dataSource = self;
    self.table.delegate = self;
    self.table.tableFooterView = [[UIView alloc] init];
    
    [self.view addSubview:self.table];
    [self.table.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.table.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.table.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.table.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.roadSigns.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *) indexPath {
    RoadSingViewCell *cell = [self.table dequeueReusableCellWithIdentifier:tableViewCellIdentifier];
    RSRoadSign *roadSign = self.roadSigns[indexPath.row];
    [cell setupWithRoadSign: roadSign];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RSDetailController *controller = [[RSDetailController alloc] init];
    RSRoadSign *roadSign = self.roadSigns[indexPath.row];
    [controller configureWithRoadSign:roadSign];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
