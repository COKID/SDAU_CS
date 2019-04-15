#include <stdio.h>

int main()
{
    int i;
    for (i = 100; i < 1000; i++)
    {
        int a = i / 100;
        int b = (i % 100) / 10;
        int c = i % 10;
        if (i == a*a*a + b*b*b + c*c*c)
            printf("%d\n", i);
    }
    return 0;
}
