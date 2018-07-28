# Description

When working in the Objective-C++ environment, there was a problem I found out that is retain cycle in Cpp lambda expression.

The problem was when an Objective-C object held a lambda and that lambda also embraced its parent. Should we have retain cycle in this situation? Should this retain cycle only happen in Objective-C block?

**The answer is lambda will retain Objective-C object in its scope.**

# Testing

There are 3 conditions in this experiment.

* Using `weak` reference in lambda
* Using `strong` reference in lambda
* Using `weak` reference and use `capture-by-reference `in lambda

To prevent Objective-C object retain cycle when using lambda. Doing the same trick in Objective-C.
Get the `weak` reference to the parent object and then use that `weak` pointer inside the lambda.

```objc

	__weak typeof(self) weakSelf = self;
    _holder->setAction([=](){
        [weakSelf playSound];
    });

```
