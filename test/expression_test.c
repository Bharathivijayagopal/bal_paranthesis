#include "unity.h"
#include "expression.h"

void setUp() {}
void tearDown() {}
void test_expression()
{
    TEST_ASSERT_TRUE(expression_check("(2 + 3)"));
}

int main(void)
{
    UNITY_BEGIN();

    RUN_TEST(test_expression);

    return UNITY_END();
}
