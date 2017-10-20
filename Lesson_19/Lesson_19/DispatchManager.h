//
//  DispatchManager.h
//  Lesson_19
//
//  Created by maxud on 17.10.2017.
//  Copyright © 2017 lesson_1. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^Completion)(void);

@interface DispatchManager : NSObject

+ (void)runInMain:(Completion)completion;
+ (void)runInBackground:(Completion)completion;
+ (void)waitUntilDone:(Completion)completion;
@end
