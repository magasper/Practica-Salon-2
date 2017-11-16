//
//  GamesViewController.m
//  beisbol
//
//  Created by Amalia Gastelum on 11/5/17.
//  Copyright © 2017 UAG. All rights reserved.
//

#import "GamesViewController.h"
#import "GameModel.h"
#import "DateGamesModel.h"
#import "GameViewCell.h"
#import "SWObject.h"
#import "WebServices.h"
#import "Constants.h"

@interface GamesViewController ()
@property NSString *gamesString;
@property NSMutableArray *gamesData;
@end

@implementation GamesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gamesData = [[NSMutableArray alloc]init];
    NSError *error;
    //self.gamesData = [[DateGamesModel alloc]initWithString:self.gamesString error:&error];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [self getGames];
}

- (void)didReceiveMemoryWarning {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (IBAction)btnRefresh:(UIBarButtonItem *)sender {
    [self getGames];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.gamesData != nil) {
        return self.gamesData.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GameViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"gameCell"];
    NSError *error = nil;
    GameModel *current = [[GameModel alloc]initWithDictionary:[self.gamesData objectAtIndex:indexPath.row] error:&error];
    cell.lblTeam1.text = current.home_name;
    cell.lblTeam2.text = current.away_name;
    cell.lblSchedule.text = current.startTime;
    if (indexPath.row%2 == 0) {
        cell.contentView.backgroundColor = [UIColor whiteColor];
    } else {
        cell.contentView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5];
    }
    cell.imgTeam1.image = [self getImageByName:current.home_name];
    cell.imgTeam2.image = [self getImageByName:current.away_name];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.00005;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

- (void)getGames {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [WebServices getGames:^(NSMutableArray *peoples) {
        
        if(peoples){
            [self.gamesData removeAllObjects];
            [self.gamesData addObjectsFromArray:peoples];
            [self.tableView reloadData];
        }
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }];
}

- (UIImage *)getImageByName:(NSString *) name {
    if ([name isEqualToString:@"Tomateros"]) {
        return [UIImage imageNamed:@"tomateros"];
    } else if ([name isEqualToString:@"Águilas"]) {
        return [UIImage imageNamed:@"aguilas"];
    } else if ([name isEqualToString:@"Naranjeros"]) {
        return [UIImage imageNamed:@"naranjeros"];
    } else if ([name isEqualToString:@"Venados"]) {
        return [UIImage imageNamed:@"venados"];
    } else if ([name isEqualToString:@"Yaquis"]) {
        return [UIImage imageNamed:@"yaquis"];
    } else if ([name isEqualToString:@"Mayos"]) {
        return [UIImage imageNamed:@"mayos"];
    } else if ([name isEqualToString:@"Charros"]) {
        return [UIImage imageNamed:@"charros"];
    } else if ([name isEqualToString:@"Cañeros"]) {
        return [UIImage imageNamed:@"caneros"];
    }
    return [UIImage new];
}


@end
