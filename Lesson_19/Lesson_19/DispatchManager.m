//
//  DispatchManager.m
//  Lesson_19
//
//  Created by maxud on 17.10.2017.
//  Copyright © 2017 lesson_1. All rights reserved.
//

#import "DispatchManager.h"

@implementation DispatchManager

+ (void)runInMain:(Completion)completion
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (completion)
        {
            completion();
        }
    });
}

+(void)runInBackground:(Completion)completion
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (completion)
        {
            completion();
        }
    });
}
+(void)waitUntilDone:(Completion)completion
{
    dispatch_sync(dispatch_get_main_queue(), ^{
        if (completion)
        {
            completion();
        }
    });
}



@end
