//
//  WebServices.h
//  Starwars API
//
//  Created by Walter Gonzalez Domenzain on 08/11/17.
//  Copyright © 2017 Boletomovil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
#import "SWObject.h"
#import "DateGamesModel.h"

@interface WebServices : NSObject<NSURLSessionDelegate>

+ (void)getGames:(void (^)(NSMutableArray *people)) handler;
+ (void)getPerson:(NSString*)personID completion: (void (^)(NSMutableArray<DateGamesModel *> *people)) handler;

@end
