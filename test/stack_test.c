#include "stack.h"
#include "unity.h"

void setUp() {}
void tearDown() {}

void test_stackpush()
{

    TEST_ASSERT_TRUE(stack_push('('));
    for (int i = 1; i < STACK_SIZE; i++)
    {
        stack_push('(');
    }
   
   
}

void test_stackpop()
{
    stack_clear();
    stack_push('(');
    TEST_ASSERT_EQUAL_CHAR('(', stack_pop());
    for (int i = 1; i < STACK_SIZE; i++)
    {
        stack_push('(');
    }
    for (int i = 1; i < STACK_SIZE; i++)
    {
        TEST_ASSERT_EQUAL_CHAR('(', stack_pop());
    }
}

int main(void)
{
    UNITY_BEGIN();

    RUN_TEST(test_stackpush);
    RUN_TEST(test_stackpop);

    return UNITY_END();
}
