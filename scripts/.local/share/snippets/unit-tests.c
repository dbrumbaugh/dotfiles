#include <check.h>

START_TEST(t_first_test)
{

}
END_TEST

Suite *unit_testing()
{
    Suite *unit = suite_create("Unit Tests");

    TCase *first = tcase_create("First Test Case");
    tcase_add_test(first, t_first_test);

    return unit;
}

int run_unit_tests()
{
    int failed = 0;
    Suite *unit = unit_testing();
    SRunner *unit_runner = srunner_create(unit);

    srunner_run_all(unit_runner, CK_NORMAL);
    failed = srunner_ntests_failed(unit_runner);
    srunner_free(unit_runner);

    return failed;
}


int main() 
{
    int unit_failed = run_unit_tests();

    return (unit_failed == 0) ? EXIT_SUCCESS : EXIT_FAILURE;
}
