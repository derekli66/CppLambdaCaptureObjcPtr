//
//  LambdaKeeper.h
//  LambdaCaptureObjCPtr
//

#import <Foundation/Foundation.h>

class LambdaHolder;

@interface LambdaKeeper: NSObject
@property (nonatomic, assign) LambdaHolder *holder;

- (void)performLambdaHolder;
@end
