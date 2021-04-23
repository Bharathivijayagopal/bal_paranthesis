#include "stack.h"
#include "expression.h"

bool expression_check(const char *exp)
{
    bool status = false;
    char ch;
    for (int i = 0; i < exp[i] != '\0'; i++)
    {
        if (exp[i] == '(')
        {
            stack_push(exp[i]);
        }
        else if (exp[i] == ')')
        {
            ch = stack_pop();
        }
    }
    char final = stack_pop();
    if (final == '\0')
    {
        status = true;
    }
    else
        status = false;

    return status;
}
