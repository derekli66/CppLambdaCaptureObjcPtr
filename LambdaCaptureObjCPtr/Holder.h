//
//  Holder.hpp
//  LambdaWithObjective-C-Ptr
//

#include <stdio.h>
#include <functional>

using ActionLambda = std::function<void(void)>;

class LambdaHolder
{
public:
    LambdaHolder() = default;
    ~LambdaHolder(){};
    
    void setAction(ActionLambda action)
    {
        m_action = action;
    }
    
    void performAction()
    {
        if (nullptr != m_action) m_action();
    }
    
private:
    ActionLambda m_action{nullptr};
};
