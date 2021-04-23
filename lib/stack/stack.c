#include "stack.h"

static int top = -1;
static char stack[STACK_SIZE] = {0};

void stack_clear(void)
{
    top = -1;
}

bool stack_push(char ch)
{
    bool status = false;
    if (top < STACK_SIZE)
    {
        stack[top] = ch;
        top++;
        status = true;
    }
    else
    {
        status = false;
    }

    return status;
}

char stack_pop(void)
{
    char ch = '\0';
    top--;
    stack[top] = ch;
    return ch;
}
