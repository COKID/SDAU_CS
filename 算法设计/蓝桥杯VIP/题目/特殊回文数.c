#include <stdio.h>

int main()
{
    int i, n;
    scanf("%d", &n); 
    for (i = 10000; i < 100000; i++)
    {
        int a = i / 10000;
        int b = (i % 10000) / 1000;
        int c = (i % 1000) / 100;
        int d = (i % 100) / 10;
        int e = i % 10;
        if (a == e && b == d && a+b+c+d+e == n)
            printf("%d\n", i);
    }
    for (i = 100000; i < 1000000; i++)
    {
        int a = i / 100000;
        int b = (i % 100000) / 10000;
        int c = (i % 10000) / 1000;
        int d = (i % 1000) / 100;
        int e = (i % 100) / 10;
        int f = i % 10;
        if (a == f && b == e && c == d && a+b+c+d+e+f == n)
            printf("%d\n", i);
    }
    return 0;
}
