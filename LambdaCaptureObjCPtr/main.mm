//
//  main.m
//  LambdaCaptureObjCPtr
//

#import <Foundation/Foundation.h>
#import "LambdaKeeper.h"

#include "Holder.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        LambdaKeeper *keeper = [[LambdaKeeper alloc] init];
        [keeper performLambdaHolder];
    }
    
    NSLog(@"LambdaKeeper should be dealloc after autorelease pool scope");
    
    return 0;
}
