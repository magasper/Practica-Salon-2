//
//  GameViewCell.h
//  beisbol
//
//  Created by Amalia Gastelum on 11/5/17.
//  Copyright © 2017 UAG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblTeam1;
@property (weak, nonatomic) IBOutlet UILabel *lblTeam2;
@property (weak, nonatomic) IBOutlet UILabel *lblSchedule;
@property (weak, nonatomic) IBOutlet UIImageView *imgTeam1;
@property (weak, nonatomic) IBOutlet UIImageView *imgTeam2;

@end
