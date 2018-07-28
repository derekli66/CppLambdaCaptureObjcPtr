//
//  LambdaKeeper.m
//  LambdaCaptureObjCPtr
//

#import "LambdaKeeper.h"
#include "Holder.h"

/*
@description Change the define type on preprocessor to test different result
 
@param    SampleWeakReference
@param    SampleStrongReference
@param    SampleLambdaCaptureByReference
*/

#define SampleWeakReference

@implementation LambdaKeeper
- (instancetype)init
{
    self = [super init];
    if (!self) return nil;
    
    _holder = new LambdaHolder();
    
#if defined(SampleWeakReference)
    __weak typeof(self) weakSelf = self;
    _holder->setAction([=](){
        [weakSelf playSound];
    });
#elif defined(SampleStrongReference)
    _holder->setAction([=](){
        [self playSound];
    });
#elif defined(SampleLambdaCaptureByReference)
    __weak typeof(self) weakSelf = self;
    _holder->setAction([&](){
        NSLog(@"I am sorry. You may not pass here");
        // You will get crash at here
        [weakSelf playSound];
    });
#endif
    
    return self;
}

- (void)playSound
{
    NSLog(@"LambdaKeeper is making some noise");
}

- (void)performLambdaHolder
{
    if (_holder) {
        _holder->performAction();
    }
}
- (void)dealloc
{
    NSLog(@"LambdaKeeper got dealloc");
    
    // Delete C++ pointer here
    if (_holder != nullptr) delete _holder;
}
@end
