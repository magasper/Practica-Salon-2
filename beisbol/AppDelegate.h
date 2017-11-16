//
//  AppDelegate.h
//  beisbol
//
//  Created by pegasus on 15/11/17.
//  Copyright © 2017 Pegasus Control. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

