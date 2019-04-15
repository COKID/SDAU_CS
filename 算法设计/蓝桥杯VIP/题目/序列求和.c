#include <stdio.h>

int main()
{
    long long n, sum;
    scanf("%I64d", &n);
    sum = (n + 1) * n / 2;
    printf("%I64d", sum);
    return 0;
}
